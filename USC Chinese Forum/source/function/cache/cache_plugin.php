<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: cache_plugin.php 33987 2013-09-13 06:48:25Z nemohou $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

function build_cache_plugin() {
	global $_G, $importtxt;

	loadcache(array('addoninfo_plugin', 'addoninfo_pack'));
	if(is_array($_G['cache']['addoninfo_plugin']) && !empty($_G['cache']['addoninfo_plugin'])){
    foreach($_G['cache']['addoninfo_plugin'] as $key => $value){
    	if(!ispluginkey($key) || !file_exists(DISCUZ_ROOT . './source/plugin/' . $key . '/plugin_logo.png')){
    		unset($_G['cache']['addoninfo_plugin'][$key]);
    	}
    }
    savecache('addoninfo_plugin', $_G['cache']['addoninfo_plugin']);
  }
	if(is_array($_G['cache']['addoninfo_pack']) && !empty($_G['cache']['addoninfo_pack'])){
    foreach($_G['cache']['addoninfo_pack'] as $key => $value){
    	if(!ispluginkey($key) || !file_exists(DISCUZ_ROOT . './data/attachment/addonpack/' . $key . '.png')){
    		unset($_G['cache']['addoninfo_pack'][$key]);
    	}
    }
    savecache('addoninfo_pack', $_G['cache']['addoninfo_pack']);
  }

	$data = $pluginsetting = array();
	foreach(C::t('common_plugin')->fetch_all_data(1) as $plugin) {
		$dir = $plugin['identifier'];
		$plugin['modules'] = unserialize($plugin['modules']);
		if($plugin['modules']['extra']['langexists']) {
			$file = DISCUZ_ROOT.'./source/plugin/'.$dir.'/discuz_plugin_'.$dir.'.xml';
			if(file_exists($file)) {
				require_once libfile('function/plugin');
				require_once libfile('function/admincp');
				$importtxt = @implode('', file($file));
				$pluginarray = getimportdata('Discuz! Plugin', 0, 1);
				if($pluginarray) {
					updatepluginlanguage($pluginarray);
				}
			}
		}

		foreach(C::t('common_pluginvar')->fetch_all_by_pluginid($plugin['pluginid']) as $var) {
			$data[$plugin['identifier']][$var['variable']] = $var['value'];
			if(in_array(substr($var['type'], 0, 6), array('group_', 'forum_'))) {
				$stype = substr($var['type'], 0, 5).'s';
				$type = substr($var['type'], 6);
				if($type == 'select') {
					foreach(explode("\n", $var['extra']) as $key => $option) {
						$option = trim($option);
						if(strpos($option, '=') === FALSE) {
							$key = $option;
						} else {
							$item = explode('=', $option);
							$key = trim($item[0]);
							$option = trim($item[1]);
						}
						$var['select'][] = array($key, $option);
					}
				}
				$pluginsetting[$stype][$plugin['identifier']]['name'] = $plugin['name'];
				$pluginsetting[$stype][$plugin['identifier']]['setting'][$var['pluginvarid']] = array('title' => $var['title'], 'description' => $var['description'], 'type' => $type, 'select' => $var['select']);
			}
		}
	}

	writetocache('pluginsetting', getcachevars(array('pluginsetting' => $pluginsetting)));

	savecache('plugin', $data);
}

?>