<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms'
 *
 *      $Id: admincp_plugins.php 34498 2014-05-12 02:51:02Z nemohou $
 */

if (!defined('IN_DISCUZ') || !defined('IN_ADMINCP')) {
	exit('Access Denied');
}

cpheader();

if (!empty($_GET['identifier']) && !empty($_GET['pmod'])) {
	$operation = 'config';
}
global $admincp;
if ($operation != 'config' && !$admincp->isfounder) {
	cpmsg('noaccess_isfounder', '', 'error');
}

global $_G, $lang;

$pluginid = !empty($_GET['pluginid']) ? intval($_GET['pluginid']) : 0;
$catid = !empty($_GET['catid']) ? intval($_GET['catid']) : 0;
$anchor = !empty($_GET['anchor']) ? $_GET['anchor'] : '';
$isplugindeveloper = isset($_G['config']['plugindeveloper']) && $_G['config']['plugindeveloper'] > 0;
if (isset($_GET['dir']) && !ispluginkey($_GET['dir'])) {
	unset($_GET['dir']);
}
if (isset($_GET['installtype'])) {
	$_GET['installtype'] = isinstalltype($_GET['installtype']) ? $_GET['installtype'] : '';
}

require_once libfile('function/plugin');
$cats = C::t('common_plugincat')->fetch_all_cat();
$catmenu[0] = array(cplang('all') . cplang('plugins_list'), 'plugins', !$catid);
foreach ($cats as $cat) {
	$catlist[$cat['catid']] = $cat;
	$catmenu[$cat['catid']] = array($cat['catname'], 'plugins&catid=' . $cat['catid'], $catid == $cat['catid']);
}
$submenu = array(
    !empty($catlist) ? array(array('menu' => ($catid ? $catlist[$catid]['catname'] : 'plugins_list'), 'submenu' => $catmenu), !$operation) : array('plugins_list', 'plugins', !$operation),
    array('plugins_cat', 'plugins&operation=cat&formhash=' . FORMHASH, ($operation == 'cat' ? true : false)),
    array('plugins_validator', 'plugins&operation=upgradecheck&formhash=' . FORMHASH, ($operation == 'upgradecheck' ? true : false)),
    array('cloudaddons_plugin_link', 'cloudaddons" target="_blank'),
);


loadcache('addonfiles');
$addonfiles = $_G['cache']['addonfiles'];
if(in_array($operation, array('import', 'upgrade', 'bump', 'cat', 'plugininstall', 'pluginupgrade', 'enable', 'disable', 'delete', 'upgradecheck', 'vars', 'edit', 'hook')) && (empty($_GET['formhash']) || FORMHASH != $_GET['formhash'])){
	cpformhashurl();
}

if (!$operation) {

	if (!submitcheck('submit')) {

		loadcache('plugin');
		shownav('plugin');
		showsubmenu('nav_plugins', $submenu);

		if($_G['isHTTPS']){
			$query = array();
			parse_str($_SERVER['QUERY_STRING'], $query);
			$query['auth'] = authcode(authcode(getglobal('auth', 'cookie'), 'DECODE'), 'ENCODE', $_G['config']['security']['authkey'], 3600);
			$query_sting_tmp = http_build_query($query);
			showtips(cplang('https_to_http', array('url' => str_replace('https://', 'http://', $_G['siteurl']).ADMINSCRIPT . '?' . $query_sting_tmp)));
		}

		showformheader('plugins' . ($catid ? '&catid=' . $catid : ''));
		$outputsubmit = false;
		$plugins = $addonids = $pluginlist = array();
		$plugins = C::t('common_plugin')->fetch_all_data(false, $catid, true);
		if (empty($_G['cookie']['addoncheck_plugin'])) {
			foreach ($plugins as $plugin) {
				if($plugin['available']){
					$addonids[$plugin['pluginid']] = $plugin['identifier'] . '.plugin';
				}
			}
			$checkresult = dunserialize(cloudaddons_upgradecheck($addonids));
			savecache('addoncheck_plugin', $checkresult);
			dsetcookie('addoncheck_plugin', 1, 3600);
		} else {
			loadcache('addoncheck_plugin');
			$checkresult = $_G['cache']['addoncheck_plugin'];
		}
		$plugin_dirs = array();
		foreach ($plugins as $plugin) {
			$plugin_dirs[] = $plugin['identifier'];
		}
		$plugin_upgrades = array();
		if (empty($_GET['system']) && !$catid) {
			$plugindir = DISCUZ_ROOT . './source/plugin';
			$pluginsdir = dir($plugindir);
			$newplugins = array();
			$newlist = '';
			while ($entry = $pluginsdir->read()) {
				if (!in_array($entry, array('.', '..')) && is_dir($plugindir . '/' . $entry)) {
					if(!in_array($entry, $plugin_dirs)){
						$entryversion = $entrycopyright = $importtxt = '';
						$pluginarray = cloudaddons_getlocaldata($entry, 0, 1);
						if (!empty($pluginarray)) {
							if (!empty($pluginarray['plugin']['name'])) {
								$entrytitle = dhtmlspecialchars($pluginarray['plugin']['name']);
								$entryversion = dhtmlspecialchars($pluginarray['plugin']['version']);
								$entrycopyright = dhtmlspecialchars($pluginarray['plugin']['copyright']);
								$entrydescription = dhtmlspecialchars($pluginarray['plugin']['description']);
								$plugin = array(
								    'new' => 1,
								    'identifier' => $entry,
								    'name' => $entrytitle,
								    'copyright' => $entrycopyright,
								    'description' => $entrydescription,
								);
								$pluginlist['new'][] = pluginlistrow($plugin);
								$plugin_dirs[] = $entry;
							}
						}
					}else{
						$entryversion = $entrycopyright = $importtxt = '';
						$pluginarray = cloudaddons_getlocaldata($entry, 0, 1);
						if (!empty($pluginarray['plugin']['version'])) {
							$plugin_upgrades[$entry] = $pluginarray['plugin']['version'];
						}
					}
				}
			}
		}

		$splitavailable = array();
		foreach ($plugins as $plugin) {
			$addonid = $plugin['identifier'] . '.plugin';
			$plugin['updateinfo'] = '';
			if ($plugin_upgrades[$plugin['identifier']] && $plugin_upgrades[$plugin['identifier']] > $plugin['version']) {
				$plugin['updateinfo'] = '<a href="' . ADMINSCRIPT . '?action=plugins&operation=upgrade&pluginid='.$plugin['pluginid'].'&formhash=' . FORMHASH . ($catid ? '&catid=' . $catid : '') . '" title="' . $lang['plugins_find_newversion'] . ' ' . dhtmlspecialchars($plugin_upgrades[$plugin['identifier']]) . '">'.$lang['plugins_config_upgrade'].'</a>&nbsp;';
			}else{
				list(, $newver, $sysver) = explode(':', $checkresult[$addonid]);
				if ($sysver && $sysver > $plugin['version']) {
					$plugin['updateinfo'] = '<a href="' . ADMINSCRIPT . '?action=cloudaddons&id=' . $addonid . '" target="_blank" title="' . $lang['plugins_online_update'] . ' ' . $sysver . '"><font color="red">' . $lang['plugins_find_newversion'] . '</font></a>';
				} elseif ($newver) {
					$plugin['updateinfo'] = '<a href="' . ADMINSCRIPT . '?action=cloudaddons&id=' . $addonid . '" target="_blank" title="' . $lang['plugins_online_update'] . ' ' . $newver . '"><font color="red">' . $lang['plugins_find_newversion'] . '</font></a>';
				}
			}
			$hookexists = FALSE;
			$plugin['modules'] = dunserialize($plugin['modules']);
			$submenuitem = false;
			if (isset($_G['cache']['plugin'][$plugin['identifier']])) {
				$submenuitem = true;
			}
			if (is_array($plugin['modules'])) {
				foreach ($plugin['modules'] as $k => $module) {
					if ($module['type'] == 11) {
						$hookorder = $module['displayorder'];
						$hookexists = $k;
					}
					if ($module['type'] == 3) {
						$submenuitem = true;
					}
					if ($module['type'] == 29) {
						$submenuitem = true;
					}
				}
			}
			$outputsubmit = $hookexists !== FALSE && $plugin['available'] || $outputsubmit;
			$hl = !empty($_GET['hl']) && $_GET['hl'] == $plugin['pluginid'];
			$intro = $title = '';
			$order = $plugin['available'] ? 'open' : 'close';
			if ($plugin['pluginid'] == $_GET['hl']) {
				$order = 'hightlight';
			}
			$pluginlist[$order][$plugin['pluginid']] = pluginlistrow($plugin);
		}

		ksort($pluginlist);
		$pluginlist = array_merge((array) $pluginlist['hightlight'] + (array) $pluginlist['updatelist'] + (array) $pluginlist['open'] + (array) $pluginlist['close'], (array) $pluginlist['new']);

		if ($pluginlist) {
			echo '<ul class="plb cl">';
			echo implode('', $pluginlist);
			echo '</ul>';
			echo <<<EOF
<script>
    function getMemo(obj, id) {
        var baseobj = $('base_' + id);
		var memoobj = $('memo_' + id);
		baseobj.className = 'x0 over';
        obj.onmouseout = function () {
		        baseobj.className = 'x0';
        }
	}
</script>
EOF;
		} else {
			echo '<div class="infobox"><h4 class="marginbot normal" style="font-size: 30px;color: red;">'.cplang('plugins_empty').'</h4></div>';
		}
		showtableheader('', 'psetting');
		if ($outputsubmit) {
			showsubmit('submit', 'submit', !empty($catlist) ? '<select name="catidnew">' . get_selectcat($plugin['catid']) . '</select>' : '', '<a href="' . ADMINSCRIPT . '?action=cloudaddons" target="_blank">' . cplang('cloudaddons_plugin_link') . '</a>', '');
		} else {
			showsubmit('', '', '', '<a href="' . ADMINSCRIPT . '?action=cloudaddons" target="_blank">' . cplang('cloudaddons_plugin_link') . '</a>');
		}
		showtablefooter();
		showformfooter();
		if (!$catid) {
			cloudaddons_clearcache($plugin_dirs);
		}
	} else {
		foreach (C::t('common_plugin')->fetch_all_data() as $plugin) {
			$updatedata = array();
			if (!empty($_GET['displayordernew'][$plugin['pluginid']])) {
				$plugin['modules'] = dunserialize($plugin['modules']);
				$k = array_keys($_GET['displayordernew'][$plugin['pluginid']]);
				$v = array_values($_GET['displayordernew'][$plugin['pluginid']]);
				$plugin['modules'][$k[0]]['displayorder'] = $v[0];
				$updatedata = array('modules' => serialize($plugin['modules']));
			}
			$plugin['modules'] = dunserialize($plugin['modules']);
			if (in_array($plugin['pluginid'], $_GET['check']) && !$plugin['modules']['system']) {
				$updatedata['catid'] = intval($_GET['catidnew']);
			}
			if($updatedata) {
				C::t('common_plugin')->update($plugin['pluginid'], $updatedata);
			}
		}
		updatecache(array('plugin', 'setting', 'styles'));
		updatemenu('plugin');
		cleartemplatecache();
		cpmsg('plugins_edit_succeed', 'action=plugins' . ($catid ? '&catid=' . $catid : ''), 'succeed');
	}
} elseif ($operation == 'enable' || $operation == 'disable') {

	$conflictplugins = '';
	$plugin = C::t('common_plugin')->fetch($_GET['pluginid']);
	if (!$plugin) {
		cpmsg('plugin_not_found', '', 'error');
	}
	if ($operation == 'enable') {
		$maxdisplayorder = C::t('common_plugin')->fetch_maxdisplayorder_by_pluginid($_GET['pluginid']);
		C::t('common_plugin')->update($_GET['pluginid'], array('displayorder' => $maxdisplayorder+1));
	}
	$dir = $plugin['identifier'];
	$modules = dunserialize($plugin['modules']);
	$pluginarray = cloudaddons_getimportdata($dir, 0, 1);
	if (empty($pluginarray)) {
		$pluginarray[$operation . 'file'] = $modules['extra'][$operation . 'file'];
		$pluginarray['plugin']['version'] = $plugin['version'];
	}
	if (!empty($pluginarray[$operation . 'file']) && preg_match('/^[\w\.]+$/', $pluginarray[$operation . 'file'])) {
		loadcache('addonfiles');
		$addonfiles = $_G['cache']['addonfiles'];
		$filename_c = $operation == 'enable' ? 'enable.php' : 'disable.php';
		if($addonfiles[$dir][$filename_c]){
			cloudaddons_addonexecute($addonfiles[$dir][$filename_c], $filename_c);
		}else{
			$filename = DISCUZ_ROOT . './source/plugin/' . $dir . '/' . $pluginarray[$operation . 'file'];
			if (file_exists($filename)) {
				@include $filename;
			}
		}
	}

	if ($operation == 'enable') {
		require_once libfile('cache/setting', 'function');
		list(,, $hookscript) = get_cachedata_setting_plugin($plugin['identifier']);
		$exists = array();
		foreach ($hookscript as $script => $modules) {
			foreach ($modules as $module => $data) {
				foreach (array('funcs' => '', 'outputfuncs' => '_output', 'messagefuncs' => '_message') as $functype => $funcname) {
					foreach ($data[$functype] as $k => $funcs) {
						$pluginids = array();
						foreach ($funcs as $func) {
							$pluginids[$func[0]] = $func[0];
						}
						if (in_array($plugin['identifier'], $pluginids) && count($pluginids) > 1) {
							unset($pluginids[$plugin['identifier']]);
							foreach ($pluginids as $pluginid) {
								$exists[$pluginid][$k . $funcname] = $k . $funcname;
							}
						}
					}
				}
			}
		}
		if ($exists) {
			$plugins = array();
			foreach (C::t('common_plugin')->fetch_all_by_identifier(array_keys($exists)) as $plugin) {
				$plugins[] = '<b>' . $plugin['name'] . '</b>:' .
					'&nbsp;<a href="javascript:;" onclick="display(\'conflict_' . $plugin['identifier'] . '\')">' . cplang('plugins_conflict_view') . '</a>' .
					'&nbsp;<a href="' . cloudaddons_addonlogo_url($plugin['identifier']) . '" onerror="this.src=\'static/image/admincp/plugin_logo.png\';this.onerror=null" target="_blank">' . cplang('plugins_conflict_info') . '</a>' .
					'<span id="conflict_' . $plugin['identifier'] . '" style="display:none"><br />' . implode(',', $exists[$plugin['identifier']]) . '</span>';
			}
			$conflictplugins = '<div align="left" style="margin: auto 100px; border: 1px solid #DEEEFA;padding: 4px;line-height: 25px;">' . implode('<br />', $plugins) . '</div>';
		}
	}
	$available = $operation == 'enable' ? 1 : 0;
	C::t('common_plugin')->update($_GET['pluginid'], array('available' => $available));
	updatecache(array('plugin', 'setting', 'styles'));
	cleartemplatecache();
	updatemenu('plugin');
	if ($operation == 'enable') {
		cloudaddons_addonlogo_url($plugin['identifier'], 'plugin', 1);
		if (!$conflictplugins) {
			dheader('location: ' . ADMINSCRIPT . '?action=plugins' . (!empty($_GET['system']) ? '&system=1' : '') . ($catid ? '&catid=' . $catid : ''));
		} else {
			cpmsg('plugins_conflict', 'action=plugins' . (!empty($_GET['system']) ? '&system=1' : '').($catid ? '&catid='.$catid : ''), 'succeed', array('plugins' => $conflictplugins, 'timeout' => 600000));
		}
	} else {
		dheader('location: ' . ADMINSCRIPT . '?action=plugins' . (!empty($_GET['system']) ? '&system=1' : '') . ($catid ? '&catid=' . $catid : ''));
	}
	cpmsg('plugins_' . $operation . '_succeed', 'action=plugins' . (!empty($_GET['system']) ? '&system=1' : '') . ($catid ? '&catid=' . $catid : ''), 'succeed');
} elseif ($operation == 'hook') {

	if (empty($pluginid)) {
		$pluginlist = '<select name="pluginid">';
		foreach (C::t('common_plugin')->fetch_all_data() as $plugin) {
			$pluginlist .= '<option value="' . $plugin['pluginid'] . '">' . $plugin['name'] . '</option>';
		}
		$pluginlist .= '</select>';
		global $highlight;
		cpmsg('plugins_nonexistence', 'action=plugins&operation=hook&formhash=' . FORMHASH . (!empty($highlight) ? "&highlight=$highlight" : ''), 'form', array(), $pluginlist);
	}

	$plugin = C::t('common_plugin')->fetch($pluginid);
	if (!$plugin) {
		cpmsg('plugin_not_found', '', 'error');
	}

	$plugin['modules'] = dunserialize($plugin['modules']);
	$plugin['tempcat'] = dunserialize($plugin['tempcat']);
	$plugin['catcode'] = $plugin['tempcat']['catcode'];
	$plugin['catname'] = $plugin['tempcat']['catname'];
	$plugin['catstatus'] = $plugin['tempcat']['catstatus'];
	if ($plugin['modules']['system']) {
		cpmsg('plugin_donot_edit', '', 'error');
	}


	showsubmenuanchors($plugin['name'] . ($plugin['available'] ? cplang('plugins_edit_available') : ''), array(
	    array('plugins_list', 'plugins', 0, 1),
	    array('plugins_hooks', 'hook', 1),
	));
	showtips('plugins_hooks_tips');

	require_once libfile('cache/setting', 'function');
	list(,, $hookscript) = get_cachedata_setting_plugin($plugin['identifier']);
	$exists = array();
	foreach ($hookscript as $script => $modules) {
		foreach ($modules as $module => $data) {
			foreach (array('funcs' => '', 'outputfuncs' => '_output', 'messagefuncs' => '_message') as $functype => $funcname) {
				foreach ($data[$functype] as $k => $funcs) {
					$pluginids = array();
					foreach ($funcs as $func) {
						$pluginids[$func[0]] = $func[0];
					}
					if (in_array($plugin['identifier'], $pluginids) && count($pluginids) > 1) {
						unset($pluginids[$plugin['identifier']]);
						foreach ($pluginids as $pluginid) {
							$exists[$pluginid][$k . $funcname] = $k . $funcname;
						}
					}
				}
			}
		}
	}
	if ($exists) {
		showtableheader('plugins_hooks_title');
		showtablefooter();
		$plugins = array();
		foreach (C::t('common_plugin')->fetch_all_by_identifier(array_keys($exists)) as $plugin) {
			$plugins[] = '
			<li style="float: none;width: auto;height: auto;"><div class="x1 cl">
			<a href="' . ADMINSCRIPT . '?action=plugins&operation=config&do=' . $plugin['pluginid'] . '" class="avt"><img src="' . cloudaddons_addonlogo_url($plugin['identifier']) . '" onerror="this.src=\'static/image/admincp/plugin_logo.png\';this.onerror=null" /></a>
			<p class="cl">
			<a href="' . ADMINSCRIPT . '?action=cloudaddons&id='.$plugin['identifier'].'.plugin" target="_blank">' . dhtmlspecialchars($plugin['name'].' '.$plugin['version']) . '</a>
			</p><p class="cl"><a href="javascript:;" onclick="display(\'conflict_' . $plugin['identifier'] . '\')">' . cplang('plugins_conflict_view') . '</a>' .
			'&nbsp;<a href="' . ADMINSCRIPT . '?action=cloudaddons&id='.$plugin['identifier'].'.plugin" target="_blank">' . cplang('plugins_conflict_info') . '</a></p>' .
			'<span id="conflict_' . $plugin['identifier'] . '" style="display:none"><br />' . implode(',', $exists[$plugin['identifier']]) . '</span></div></li>';
		}
		if(!empty($plugins)){
			echo '<ul class="plb cl">';
			echo implode('', $plugins);
			echo '</ul>';
			exit;
		}
	}
	echo '<div class="infobox"><h4 class="marginbot normal" style="font-size: 30px;color: red;">'.$lang['plugins_hooks_no'].'</h4></div>';
	exit;
} elseif($operation == 'bump') {

	$conflictplugins = '';
	$plugin = C::t('common_plugin')->fetch($_GET['pluginid']);
	if(!$plugin) {
		cpmsg('plugin_not_found', '', 'error');
	}
	$maxdisplayorder = C::t('common_plugin')->fetch_maxdisplayorder_by_pluginid($_GET['pluginid']);
	C::t('common_plugin')->update($_GET['pluginid'], array('displayorder' => $maxdisplayorder+1));

	dheader('location: ' . ADMINSCRIPT . '?action=plugins' . (!empty($_GET['system']) ? '&system=1' : '') . ($catid ? '&catid=' . $catid : ''));

} elseif ($operation == 'import') {

	if (isset($_GET['dir']) && !empty($_GET['dir'])) {

		cloudaddons_validator($_GET['dir'] . '.plugin');
		$dir = $_GET['dir'];
		$license = $_GET['license'] ? 1 : 0;
		$pluginarray = cloudaddons_getimportdata($dir);
		if (empty($license) && $pluginarray['license']) {
			require_once libfile('function/discuzcode');
			$pluginarray['license'] = discuzcode(strip_tags($pluginarray['license']), 1, 0);
			echo '<div class="infobox"><h4 class="infotitle2">' . $pluginarray['plugin']['name'] . ' ' . $pluginarray['plugin']['version'] . ' ' . $lang['plugins_import_license'] . '</h4><div style="text-align:left;line-height:25px;">' . $pluginarray['license'] . '</div><br /><br /><center>' .
			'<button onclick="location.href=\'' . ADMINSCRIPT . '?action=plugins&operation=import&dir=' . $dir . '&formhash=' . FORMHASH . '&license=yes\'">' . $lang['plugins_import_agree'] . '</button>&nbsp;&nbsp;' .
			'<button onclick="location.href=\'' . ADMINSCRIPT . '?action=plugins\'">' . $lang['plugins_import_pass'] . '</button></center></div>';
			exit;
		}

		if (!ispluginkey($pluginarray['plugin']['identifier'])) {
			cpmsg('plugins_edit_identifier_invalid', 'action=plugins', 'error');
		}
		if (is_array($pluginarray['vars'])) {
			foreach ($pluginarray['vars'] as $config) {
				if (!ispluginkey($config['variable'])) {
					cpmsg('plugins_import_var_invalid', 'action=plugins', 'error');
				}
			}
		}

		$plugin = C::t('common_plugin')->fetch_by_identifier($pluginarray['plugin']['identifier']);
		if ($plugin) {
			cloudaddons_clear('plugin', $dir);
			cpmsg('plugins_import_identifier_duplicated', 'action=plugins', 'error', array('plugin_name' => $plugin['name']));
		}

		if (!empty($pluginarray['checkfile']) && preg_match('/^[\w\.]+$/', $pluginarray['checkfile'])) {
			loadcache('pluginlanguage_install');
			$installlang = $pluginarray['language']['installlang'];

			loadcache('addonfiles');
			$addonfiles = $_G['cache']['addonfiles'];
			if($addonfiles[$dir]['check.php']){
				cloudaddons_addonexecute($addonfiles[$dir]['check.php'], 'check.php');
			}else{
				$filename = DISCUZ_ROOT . './source/plugin/' . $dir . '/' . $pluginarray['checkfile'];
				if (file_exists($filename)) {
					@include $filename;
				}
			}
		}

		if (empty($_GET['ignoreversion']) && !cloudaddons_versioncompatible($pluginarray['version'])) {
			cpmsg('plugins_import_version_invalid_confirm', 'action=plugins&operation=import&ignoreversion=yes&dir=' . $dir . '&license=' . $license . '&formhash=' . FORMHASH, 'form', array('cur_version' => $pluginarray['version'], 'set_version' => $_G['setting']['version']), '', true, ADMINSCRIPT . '?action=plugins');
		}

		$pluginid = plugininstall($pluginarray);

		updatemenu('plugin');

		if (!empty($pluginarray['installfile']) && preg_match('/^[\w\.]+$/', $pluginarray['installfile'])) {
			dheader('location: ' . ADMINSCRIPT . '?action=plugins&operation=plugininstall&dir=' . $dir . '&pluginid=' . $pluginid . '&formhash=' . FORMHASH);
		}

		cloudaddons_clear('plugin', $dir);
		dheader('location: ' . ADMINSCRIPT . '?action=plugins&hl=' . $pluginid);
	}
	dheader('location: ' . ADMINSCRIPT . '?action=plugins');
} elseif ($operation == 'plugininstall' || $operation == 'pluginupgrade') {

	$finish = FALSE;
	$dir = $_GET['dir'];
	$pluginarray = cloudaddons_getimportdata($dir, 0, 1);
	if (empty($pluginarray)) {
		cpmsg('plugin_file_error', '', 'error');
	}
	if ($operation == 'plugininstall') {
		$filename = $pluginarray['installfile'];
		$filename_c = 'install.php';
	} else {
		$filename = $pluginarray['upgradefile'];
		$filename_c = 'upgrade.php';
		$toversion = $pluginarray['plugin']['version'];
	}
	loadcache('pluginlanguage_install');
	$installlang = $_G['cache']['pluginlanguage_install'][$dir];

	if (!empty($filename) && preg_match('/^[\w\.]+$/', $filename)) {
		loadcache('addonfiles');
		$addonfiles = $_G['cache']['addonfiles'];
		if($addonfiles[$dir][$filename_c]){
				cloudaddons_addonexecute($addonfiles[$dir][$filename_c], $filename_c);
		}else{
			$filename = DISCUZ_ROOT . './source/plugin/' . $dir . '/' . $filename;
			if (file_exists($filename)) {
				@include_once $filename;
			} else {
				$finish = TRUE;
			}
		}
	} else {
		$finish = TRUE;
	}

	if ($finish) {
		updatecache('setting');
		updatemenu('plugin');
		cloudaddons_clear('plugin', $dir);
		dheader('location: ' . ADMINSCRIPT . '?action=plugins&hl=' . $pluginid);
	}
} elseif ($operation == 'upgrade') {

	$plugin = C::t('common_plugin')->fetch($pluginid);
	$modules = dunserialize($plugin['modules']);
	$dir = $plugin['identifier'];

	if (!$_GET['confirmed']) {
		$upgrade = false;
		$pluginarray = cloudaddons_getimportdata($dir);
		$newver = !empty($pluginarray['plugin']['version']) ? $pluginarray['plugin']['version'] : 0;
		$upgrade = $newver > $plugin['version'] ? true : false;

		$entrydir = DISCUZ_ROOT . './source/plugin/' . $dir;
		if (!empty($pluginarray['checkfile']) && preg_match('/^[\w\.]+$/', $pluginarray['checkfile'])) {
			loadcache('addonfiles');
			$addonfiles = $_G['cache']['addonfiles'];
			loadcache('pluginlanguage_install');
			$installlang = $_G['cache']['pluginlanguage_install'][$plugin['identifier']];
			if($addonfiles[$dir]['check.php']){
				cloudaddons_addonexecute($addonfiles[$dir]['check.php'], 'check.php');
			}else{
				$filename = DISCUZ_ROOT . './source/plugin/' . $plugin['identifier'] . '/' . $pluginarray['checkfile'];
				if (file_exists($filename)) {
					@include $filename;
				}
			}
		}


		if ($upgrade) {
			cpmsg('plugins_config_upgrade_confirm', 'action=plugins&operation=upgrade&pluginid=' . $pluginid . '&formhash=' . FORMHASH . '&confirm=yes'.($catid ? '&catid=' . $catid : ''), 'form', array('pluginname' => $plugin['name'], 'version' => $plugin['version'], 'toversion' => $newver));
		} else {
			$addonid = $plugin['identifier'] . '.plugin';
			$checkresult = dunserialize(cloudaddons_upgradecheck(array($addonid)));

			list($return, $newver, $sysver) = explode(':', $checkresult[$addonid]);

			cloudaddons_installlog($pluginarray['plugin']['identifier'] . '.plugin');
			dsetcookie('addoncheck_plugin', '', -1);

			cloudaddons_clear('plugin', $dir);

			if ($sysver && $sysver > $plugin['version']) {
				cpmsg('plugins_config_upgrade_new', '', 'succeed', array('newver' => $sysver, 'addonid' => $addonid));
			} elseif ($newver) {
				cpmsg('plugins_config_upgrade_new', '', 'succeed', array('newver' => $newver, 'addonid' => $addonid));
			} else {
				cpmsg('plugins_config_upgrade_missed', 'action=plugins'.($catid ? '&catid=' . $catid : ''), 'succeed');
			}
		}
	} else {

		cloudaddons_validator($dir . '.plugin');
		$pluginarray = cloudaddons_getimportdata($dir, 0, 1);
		if (empty($pluginarray)) {
			cpmsg('plugin_file_error', '', 'error');
		}

		if (!ispluginkey($pluginarray['plugin']['identifier']) || $pluginarray['plugin']['identifier'] != $plugin['identifier']) {
			cpmsg('plugins_edit_identifier_invalid', '', 'error');
		}
		if (is_array($pluginarray['vars'])) {
			foreach ($pluginarray['vars'] as $config) {
				if (!ispluginkey($config['variable'])) {
					cpmsg('plugins_upgrade_var_invalid', '', 'error');
				}
			}
		}

		if (!empty($pluginarray['checkfile']) && preg_match('/^[\w\.]+$/', $pluginarray['checkfile'])) {
			if (!empty($pluginarray['language'])) {
				$installlang[$pluginarray['plugin']['identifier']] = $pluginarray['language']['installlang'];
			}
			loadcache('addonfiles');
			$addonfiles = $_G['cache']['addonfiles'];
			if($addonfiles[$dir]['check.php']){
				loadcache('pluginlanguage_install');
				$installlang = $_G['cache']['pluginlanguage_install'][$plugin['identifier']];
				cloudaddons_addonexecute($addonfiles[$dir]['check.php'], 'check.php');
			}else{
				$filename = DISCUZ_ROOT . './source/plugin/' . $plugin['identifier'] .'/'. $pluginarray['checkfile'];
				if (file_exists($filename)) {
					loadcache('pluginlanguage_install');
					$installlang = $_G['cache']['pluginlanguage_install'][$plugin['identifier']];
					@include $filename;
				}
			}
		}

		pluginupgrade($pluginarray);

		if (!empty($pluginarray['upgradefile']) && preg_match('/^[\w\.]+$/', $pluginarray['upgradefile'])) {
			dheader('location: ' . ADMINSCRIPT . '?action=plugins&operation=pluginupgrade&dir=' . $dir . '&fromversion=' . $plugin['version'] . '&formhash=' . FORMHASH);
		}
		$toversion = $pluginarray['plugin']['version'];

		cloudaddons_clear('plugin', $dir);

		cpmsg('plugins_upgrade_succeed', "action=plugins".($catid ? '&catid=' . $catid : ''), 'succeed', array('toversion' => $toversion));
	}
} elseif ($operation == 'config') {
  global $do;
	if (empty($pluginid) && !empty($do)) {
		$pluginid = $do;
	}
	if ($_GET['identifier']) {
		$plugin = C::t('common_plugin')->fetch_by_identifier($_GET['identifier']);
	} else {
		$plugin = C::t('common_plugin')->fetch($pluginid);
	}
	if (!$plugin) {
		cpmsg('plugin_not_found', '', 'error');
	} else {
		$pluginid = $plugin['pluginid'];
	}

	cloudaddons_validator($plugin['identifier'] . '.plugin');

	$plugin['modules'] = dunserialize($plugin['modules']);

	$pluginvars = array();
	foreach (C::t('common_pluginvar')->fetch_all_by_pluginid($pluginid) as $var) {
		if (strexists($var['type'], '_')) {
			continue;
		}
		$pluginvars[$var['variable']] = $var;
	}

	if ($pluginvars) {
		$submenuitem[] = array('config', "plugins&operation=config&do=$pluginid", !$_GET['pmod']);
	}
	if (is_array($plugin['modules'])) {
		foreach ($plugin['modules'] as $module) {
			if ($module['type'] == 3) {
				parse_str($module['param'], $param);
				if (!$pluginvars && empty($_GET['pmod'])) {
					$_GET['pmod'] = $module['name'];
					if ($param) {
						foreach ($param as $_k => $_v) {
							$_GET[$_k] = $_v;
						}
					}
				}
				if ($param) {
					$m = true;
					foreach ($param as $_k => $_v) {
						if (!isset($_GET[$_k]) || $_GET[$_k] != $_v) {
							$m = false;
							break;
						}
					}
				} else {
					$m = true;
				}
				$submenuitem[] = array($module['menu'], "plugins&operation=config&do=$pluginid&identifier=$plugin[identifier]&pmod=$module[name]" . ($module['param'] ? '&' . $module['param'] : ''), $_GET['pmod'] == $module['name'] && $m, !$_GET['pmod'] ? 1 : 0);
			}
		}
	}

	if (!$submenuitem) {
		cpmsg('plugin_setting_not_found', '', 'error');
	}

	if (empty($_GET['pmod'])) {

		if (!submitcheck('editsubmit')) {
			$operation = '';
			shownav('plugin', $plugin['name']);
			showsubmenuanchors($plugin['name'], $submenuitem);

			if ($pluginvars) {
				showformheader("plugins&operation=config&do=$pluginid");
				showtableheader();
				showtitle($lang['plugins_config']);

				$extra = array();
				foreach ($pluginvars as $var) {
					if (strexists($var['type'], '_')) {
						continue;
					}
					$var['variable'] = 'varsnew[' . $var['variable'] . ']';
					if ($var['type'] == 'number') {
						$var['type'] = 'text';
					} elseif ($var['type'] == 'select') {
						$var['type'] = "<select name=\"$var[variable]\">\n";
						foreach (explode("\n", $var['extra']) as $key => $option) {
							$option = trim($option);
							if (strpos($option, '=') === FALSE) {
								$key = $option;
							} else {
								$item = explode('=', $option);
								$key = trim($item[0]);
								$option = trim($item[1]);
							}
							$var['type'] .= "<option value=\"" . dhtmlspecialchars($key) . "\" " . ($var['value'] == $key ? 'selected' : '') . ">$option</option>\n";
						}
						$var['type'] .= "</select>\n";
						$var['variable'] = $var['value'] = '';
					} elseif ($var['type'] == 'selects') {
						$var['value'] = dunserialize($var['value']);
						$var['value'] = is_array($var['value']) ? $var['value'] : array($var['value']);
						$var['type'] = "<select name=\"$var[variable][]\" multiple=\"multiple\" size=\"10\">\n";
						foreach (explode("\n", $var['extra']) as $key => $option) {
							$option = trim($option);
							if (strpos($option, '=') === FALSE) {
								$key = $option;
							} else {
								$item = explode('=', $option);
								$key = trim($item[0]);
								$option = trim($item[1]);
							}
							$var['type'] .= "<option value=\"" . dhtmlspecialchars($key) . "\" " . (in_array($key, $var['value']) ? 'selected' : '') . ">$option</option>\n";
						}
						$var['type'] .= "</select>\n";
						$var['variable'] = $var['value'] = '';
					} elseif ($var['type'] == 'date') {
						$var['type'] = 'calendar';
						$extra['date'] = '<script type="text/javascript" src="static/js/calendar.js"></script>';
					} elseif ($var['type'] == 'datetime') {
						$var['type'] = 'calendar';
						$var['extra'] = 1;
						$extra['date'] = '<script type="text/javascript" src="static/js/calendar.js"></script>';
					} elseif ($var['type'] == 'forum') {
						require_once libfile('function/forumlist');
						$var['type'] = '<select name="' . $var['variable'] . '"><option value="">' . cplang('plugins_empty') . '</option>' . forumselect(FALSE, 0, $var['value'], TRUE) . '</select>';
						$var['variable'] = $var['value'] = '';
					} elseif ($var['type'] == 'forums') {
						$var['description'] = ($var['description'] ? (isset($lang[$var['description']]) ? $lang[$var['description']] : $var['description']) . "\n" : '') . $lang['plugins_edit_vars_multiselect_comment'] . "\n" . $var['comment'];
						$var['value'] = dunserialize($var['value']);
						$var['value'] = is_array($var['value']) ? $var['value'] : array();
						require_once libfile('function/forumlist');
						$var['type'] = '<select name="' . $var['variable'] . '[]" size="10" multiple="multiple"><option value="">' . cplang('plugins_empty') . '</option>' . forumselect(FALSE, 0, 0, TRUE) . '</select>';
						foreach ($var['value'] as $v) {
							$var['type'] = str_replace('<option value="' . $v . '">', '<option value="' . $v . '" selected>', $var['type']);
						}
						$var['variable'] = $var['value'] = '';
					} elseif (substr($var['type'], 0, 5) == 'group') {
						if ($var['type'] == 'groups') {
							$var['description'] = ($var['description'] ? (isset($lang[$var['description']]) ? $lang[$var['description']] : $var['description']) . "\n" : '') . $lang['plugins_edit_vars_multiselect_comment'] . "\n" . $var['comment'];
							$var['value'] = dunserialize($var['value']);
							$var['type'] = '<select name="' . $var['variable'] . '[]" size="10" multiple="multiple"><option value=""' . (@in_array('', $var['value']) ? ' selected' : '') . '>' . cplang('plugins_empty') . '</option>';
						} else {
							$var['type'] = '<select name="' . $var['variable'] . '"><option value="">' . cplang('plugins_empty') . '</option>';
						}
						$var['value'] = is_array($var['value']) ? $var['value'] : array($var['value']);

						$query = C::t('common_usergroup')->range_orderby_credit();
						$groupselect = array();
						foreach ($query as $group) {
							$group['type'] = $group['type'] == 'special' && $group['radminid'] ? 'specialadmin' : $group['type'];
							$groupselect[$group['type']] .= '<option value="' . $group['groupid'] . '"' . (@in_array($group['groupid'], $var['value']) ? ' selected' : '') . '>' . $group['grouptitle'] . '</option>';
						}
						$var['type'] .= '<optgroup label="' . $lang['usergroups_member'] . '">' . $groupselect['member'] . '</optgroup>' .
							($groupselect['special'] ? '<optgroup label="' . $lang['usergroups_special'] . '">' . $groupselect['special'] . '</optgroup>' : '') .
							($groupselect['specialadmin'] ? '<optgroup label="' . $lang['usergroups_specialadmin'] . '">' . $groupselect['specialadmin'] . '</optgroup>' : '') .
							'<optgroup label="' . $lang['usergroups_system'] . '">' . $groupselect['system'] . '</optgroup></select>';
						$var['variable'] = $var['value'] = '';
					} elseif ($var['type'] == 'extcredit') {
						$var['type'] = '<select name="' . $var['variable'] . '"><option value="">' . cplang('plugins_empty') . '</option>';
						foreach ($_G['setting']['extcredits'] as $id => $credit) {
							$var['type'] .= '<option value="' . $id . '"' . ($var['value'] == $id ? ' selected' : '') . '>' . $credit['title'] . '</option>';
						}
						$var['type'] .= '</select>';
						$var['variable'] = $var['value'] = '';
					}

					showsetting(isset($lang[$var['title']]) ? $lang[$var['title']] : dhtmlspecialchars($var['title']), $var['variable'], $var['value'], $var['type'], '', 0, isset($lang[$var['description']]) ? $lang[$var['description']] : nl2br(dhtmlspecialchars($var['description'])), dhtmlspecialchars($var['extra']), '', true);
				}
				showsubmit('editsubmit');
				showtablefooter();
				showformfooter();
				echo implode('', $extra);
			}
		} else {

			if (is_array($_GET['varsnew'])) {
				foreach ($_GET['varsnew'] as $variable => $value) {
					if (isset($pluginvars[$variable])) {
						if ($pluginvars[$variable]['type'] == 'number') {
							$value = (float) $value;
						} elseif (in_array($pluginvars[$variable]['type'], array('forums', 'groups', 'selects'))) {
							$value = serialize($value);
						}
						$value = (string) $value;
						C::t('common_pluginvar')->update_by_variable($pluginid, $variable, array('value' => $value));
					}
				}
			}

			updatecache(array('plugin', 'setting', 'styles'));
			cleartemplatecache();
			cpmsg('plugins_setting_succeed', 'action=plugins&operation=config&do=' . $pluginid . '&anchor=' . $anchor, 'succeed');
		}
	} else {

		$scriptlang[$plugin['identifier']] = lang('plugin/' . $plugin['identifier']);
		$modfile = '';
		if (is_array($plugin['modules'])) {
			foreach ($plugin['modules'] as $module) {
				if ($module['type'] == 3 && $module['name'] == $_GET['pmod']) {
					$modfile = './source/plugin/' . $plugin['identifier'] .'/'. $module['name'] . '.inc.php';
					break;
				}
			}
		}

		if ($modfile) {
			shownav('plugin', $plugin['name']);
			showsubmenu($plugin['name'], $submenuitem);
			if (!@include(DISCUZ_ROOT . $modfile)) {
				cpmsg('plugins_setting_module_nonexistence', '', 'error', array('modfile' => $modfile));
			} else {
				exit();
			}
		} else {
			cpmsg('plugin_file_error', '', 'error');
		}
	}
} elseif ($operation == 'edit') {

	if (!$isplugindeveloper) {
		cpmsg('undefined_action', '', 'error');
	}

	if (empty($pluginid)) {
		$pluginlist = '<select name="pluginid">';
		foreach (C::t('common_plugin')->fetch_all_data() as $plugin) {
			$pluginlist .= '<option value="' . $plugin['pluginid'] . '">' . $plugin['name'] . '</option>';
		}
		$pluginlist .= '</select>';
		global $highlight;
		cpmsg('plugins_nonexistence', 'action=plugins&operation=edit&formhash=' . FORMHASH . (!empty($highlight) ? "&highlight=$highlight" : ''), 'form', array(), $pluginlist);
	}

	$plugin = C::t('common_plugin')->fetch($pluginid);
	if (!$plugin) {
		cpmsg('plugin_not_found', '', 'error');
	}

	$plugin['modules'] = dunserialize($plugin['modules']);
	$plugin['tempcat'] = dunserialize($plugin['tempcat']);
	$plugin['catcode'] = $plugin['tempcat']['catcode'];
	$plugin['catname'] = $plugin['tempcat']['catname'];
	$plugin['catstatus'] = $plugin['tempcat']['catstatus'];
	if ($plugin['modules']['system']) {
		cpmsg('plugin_donot_edit', '', 'error');
	}

	if (!submitcheck('editsubmit')) {

		$adminidselect = array($plugin['adminid'] => 'selected');

		shownav('plugin');
		$anchor = in_array($_GET['anchor'], array('config', 'modules', 'vars')) ? $_GET['anchor'] : 'config';
		showsubmenuanchors($lang['plugins_edit'] . ' - ' . $plugin['name'] . ($plugin['available'] ? cplang('plugins_edit_available') : ''), array(
		    array('plugins_list', 'plugins', 0, 1),
		    array('config', 'config', $anchor == 'config'),
		    array('plugins_config_module', 'modules', $anchor == 'modules'),
		    array('plugins_config_vars', 'vars', $anchor == 'vars'),
		));
		showtips('plugins_edit_tips');

		showtagheader('div', 'config', $anchor == 'config');
		showformheader("plugins&operation=edit&type=common&pluginid=$pluginid", '', 'configform');
		showtableheader();
		showsetting('plugins_edit_name', 'namenew', $plugin['name'], 'text', 1);
		showsetting('plugins_edit_version', 'versionnew', $plugin['version'], 'text');
		showsetting('plugins_edit_identifier', 'identifiernew', $plugin['identifier'], 'text', 1);
		showsetting('plugins_edit_description', 'descriptionnew', $plugin['description'], 'textarea', 1);
		showsetting('plugins_edit_langexists', 'langexists', $plugin['modules']['extra']['langexists'], 'radio');
		showsubmit('editsubmit');
		showtablefooter();
		showformfooter();
		showtagfooter('div');

		showtagheader('div', 'modules', $anchor == 'modules');
		showformheader("plugins&operation=edit&type=modules&pluginid=$pluginid", '', 'modulesform');
		showtableheader('plugins_edit_modules');
		showsubtitle(array('', 'plugins_edit_modules_type', 'plugins_edit_modules_name', 'plugins_edit_modules_menu', 'plugins_edit_modules_menu_url', 'plugins_edit_modules_adminid', 'display_order'));

		$moduleids = array();
		if (is_array($plugin['modules'])) {
			foreach ($plugin['modules'] as $moduleid => $module) {
				if ($moduleid === 'extra' || $moduleid === 'system') {
					continue;
				}
				$module = dhtmlspecialchars($module);
				$adminidselect = array($module['adminid'] => 'selected');
				$includecheck = empty($val['include']) ? $lang['no'] : $lang['yes'];

				$typeselect = '<optgroup label="' . cplang('plugins_edit_modules_type_g1') . '">' .
					'<option h="1100100" e="inc" value="1"' . ($module['type'] == 1 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_1') . '</option>' .
					'<option h="1111" e="inc" value="5"' . ($module['type'] == 5 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_5') . '</option>' .
					'<option h="1100100" e="inc" value="27"' . ($module['type'] == 27 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_27') . '</option>' .
					'<option h="1100100" e="inc" value="23"' . ($module['type'] == 23 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_23') . '</option>' .
					'<option h="1100110" e="inc" value="25"' . ($module['type'] == 25 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_25') . '</option>' .
					'<option h="1100111" e="inc" value="24"' . ($module['type'] == 24 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_24') . '</option>' .
					'</optgroup>' .
					'<optgroup label="' . cplang('plugins_edit_modules_type_g3') . '">' .
					'<option h="1111" e="inc" value="7"' . ($module['type'] == 7 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_7') . '</option>' .
					'<option h="1111" e="inc" value="17"' . ($module['type'] == 17 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_17') . '</option>' .
					'<option h="1111" e="inc" value="19"' . ($module['type'] == 19 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_19') . '</option>' .
					'<option h="1001" e="inc" value="14"' . ($module['type'] == 14 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_14') . '</option>' .
					'<option h="1111" e="inc" value="26"' . ($module['type'] == 26 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_26') . '</option>' .
					'<option h="1111" e="inc" value="21"' . ($module['type'] == 21 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_21') . '</option>' .
					'<option h="1001" e="inc" value="15"' . ($module['type'] == 15 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_15') . '</option>' .
					'<option h="1001" e="inc" value="16"' . ($module['type'] == 16 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_16') . '</option>' .
					'<option h="1001" e="inc" value="3"' . ($module['type'] == 3 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_3') . '</option>' .
					'<option h="1100" e="inc" value="29"' . ($module['type'] == 29 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_29') . '</option>' .
					'</optgroup>' .
					'<optgroup label="' . cplang('plugins_edit_modules_type_g2') . '">' .
					'<option h="0011" e="class" value="11"' . ($module['type'] == 11 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_11') . '</option>' .
					'<option h="0011" e="class" value="28"' . ($module['type'] == 28 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_28') . '</option>' .
					'<option h="0001" e="class" value="12"' . ($module['type'] == 12 ? ' selected="selected"' : '') . '>' . cplang('plugins_edit_modules_type_12') . '</option>' .
					'</optgroup>';
				showtablerow('', array('class="td25"', 'class="td28"'), array(
				    "<input class=\"checkbox\" type=\"checkbox\" name=\"delete[$moduleid]\">",
				    "<select id=\"s_$moduleid\" onchange=\"shide(this, '$moduleid')\" name=\"typenew[$moduleid]\">$typeselect</select>",
				    "<input type=\"text\" class=\"txt\" size=\"15\" id=\"en_$moduleid\" name=\"namenew[$moduleid]\" value=\"$module[name]\"><span id=\"e_$moduleid\"></span>",
				    "<span id=\"m_$moduleid\"><input type=\"text\" class=\"txt\" size=\"15\" name=\"menunew[$moduleid]\" value=\"$module[menu]\"></span>",
				    "<span id=\"u_$moduleid\"><input type=\"text\" class=\"txt\" size=\"15\" id=\"url_$moduleid\" onchange=\"shide($('s_$moduleid'), '$moduleid')\" name=\"urlnew[$moduleid]\" value=\"" . dhtmlspecialchars($module['url']) . "\"></span>",
				    "<span id=\"a_$moduleid\"><select name=\"adminidnew[$moduleid]\">\n" .
				    "<option value=\"0\" $adminidselect[0]>$lang[usergroups_system_0]</option>\n" .
				    "<option value=\"1\" $adminidselect[1]>$lang[usergroups_system_1]</option>\n" .
				    "<option value=\"2\" $adminidselect[2]>$lang[usergroups_system_2]</option>\n" .
				    "<option value=\"3\" $adminidselect[3]>$lang[usergroups_system_3]</option>\n" .
				    "</select></span>",
				    "<span id=\"o_$moduleid\"><input type=\"text\" class=\"txt\" style=\"width:50px\" name=\"ordernew[$moduleid]\" value=\"$module[displayorder]\"></span>"
				));
				showtagheader('tbody', 'n_' . $moduleid);
				showtablerow('class="noborder"', array('', 'colspan="6"'), array(
				    '',
				    '&nbsp;&nbsp;&nbsp;<span id="nt_' . $moduleid . '">' . $lang['plugins_edit_modules_navtitle'] . ':<input type="text" class="txt" size="15" name="navtitlenew[' . $moduleid . ']" value="' . $module['navtitle'] . '"></span>
					<span id="ni_' . $moduleid . '">' . $lang['plugins_edit_modules_navicon'] . ':<input type="text" class="txt" name="naviconnew[' . $moduleid . ']" value="' . $module['navicon'] . '"></span>
					<span id="nsn_' . $moduleid . '">' . $lang['plugins_edit_modules_navsubname'] . ':<input type="text" class="txt" name="navsubnamenew[' . $moduleid . ']" value="' . $module['navsubname'] . '"></span>
					<span id="nsu_' . $moduleid . '">' . $lang['plugins_edit_modules_navsuburl'] . ':<input type="text" class="txt" name="navsuburlnew[' . $moduleid . ']" value="' . $module['navsuburl'] . '"></span>
					',
				));
				showtagfooter('tbody');
				showtagheader('tbody', 'n2_' . $moduleid);
				showtablerow('class="noborder"', array('', 'colspan="6"'), array(
				    '',
				    '&nbsp;&nbsp;&nbsp;<span id="nsp_' . $moduleid . '">' . $lang['plugins_edit_modules_param'] . ':<input type="text" class="txt" name="paramnew[' . $moduleid . ']" value="' . $module['param'] . '"></span>',
				));
				showtagfooter('tbody');

				$moduleids[] = $moduleid;
			}
		}
		showtablerow('', array('class="td25"', 'class="td28"'), array(
		    cplang('add_new'),
		    '<select id="s_n" onchange="shide(this, \'n\')" name="newtype">' .
		    '<optgroup label="' . cplang('plugins_edit_modules_type_g1') . '">' .
		    '<option h="1100100" e="inc" value="1">' . cplang('plugins_edit_modules_type_1') . '</option>' .
		    '<option h="1111" e="inc" value="5">' . cplang('plugins_edit_modules_type_5') . '</option>' .
		    '<option h="1100100" e="inc" value="27">' . cplang('plugins_edit_modules_type_27') . '</option>' .
		    '<option h="1100100" e="inc" value="23">' . cplang('plugins_edit_modules_type_23') . '</option>' .
		    '<option h="1100110" e="inc" value="25">' . cplang('plugins_edit_modules_type_25') . '</option>' .
		    '<option h="1100111" e="inc" value="24">' . cplang('plugins_edit_modules_type_24') . '</option>' .
		    '</optgroup>' .
		    '<optgroup label="' . cplang('plugins_edit_modules_type_g3') . '">' .
		    '<option h="1111" e="inc" value="7">' . cplang('plugins_edit_modules_type_7') . '</option>' .
		    '<option h="1111" e="inc" value="17">' . cplang('plugins_edit_modules_type_17') . '</option>' .
		    '<option h="1111" e="inc" value="19">' . cplang('plugins_edit_modules_type_19') . '</option>' .
		    '<option h="1001" e="inc" value="14">' . cplang('plugins_edit_modules_type_14') . '</option>' .
		    '<option h="1001" e="inc" value="26">' . cplang('plugins_edit_modules_type_26') . '</option>' .
		    '<option h="1001" e="inc" value="21">' . cplang('plugins_edit_modules_type_21') . '</option>' .
		    '<option h="1001" e="inc" value="15">' . cplang('plugins_edit_modules_type_15') . '</option>' .
		    '<option h="1001" e="inc" value="16">' . cplang('plugins_edit_modules_type_16') . '</option>' .
		    '<option h="1101" e="inc" value="3">' . cplang('plugins_edit_modules_type_3') . '</option>' .
		    '<option h="1100" e="inc" value="3">' . cplang('plugins_edit_modules_type_29') . '</option>' .
		    '</optgroup>' .
		    '<optgroup label="' . cplang('plugins_edit_modules_type_g2') . '">' .
		    '<option h="0011" e="class" value="11">' . cplang('plugins_edit_modules_type_11') . '</option>' .
		    '<option h="0011" e="class" value="28">' . cplang('plugins_edit_modules_type_28') . '</option>' .
		    '<option h="0001" e="class" value="12">' . cplang('plugins_edit_modules_type_12') . '</option>' .
		    '</optgroup>' .
		    '</select>',
		    '<input type="text" class="txt" size="15" name="newname"><span id="e_n"></span>',
		    '<span id="m_n"><input type="text" class="txt" size="15" name="newmenu"></span>',
		    '<span id="u_n"><input type="text" class="txt" size="15" id="url_n" onchange="shide($(\'s_n\'), \'n\')" name="newurl"></span>',
		    '<span id="a_n"><select name="newadminid">' .
		    '<option value="0" selected>' . cplang('usergroups_system_0') . '</option>' .
		    '<option value="1">' . cplang('usergroups_system_1') . '</option>' .
		    '<option value="2">' . cplang('usergroups_system_2') . '</option>' .
		    '<option value="3">' . cplang('usergroups_system_3') . '</option>' .
		    '</select></span>',
		    '<span id="o_n"><input type="text" class="txt" style="width:50px"  name="neworder"></span>',
		));
		showtagheader('tbody', 'n_n');
		showtablerow('class="noborder"', array('', 'colspan="7"'), array(
		    '',
		    '&nbsp;&nbsp;&nbsp;<span id="nt_n">' . $lang['plugins_edit_modules_navtitle'] . ':<input type="text" class="txt" name="newnavtitle"></span>
			<span id="ni_n">' . $lang['plugins_edit_modules_navicon'] . ':<input type="text" class="txt" name="newnavicon"></span>
			<span id="nsn_n">' . $lang['plugins_edit_modules_navsubname'] . ':<input type="text" class="txt" name="newnavsubname"></span>
			<span id="nsu_n">' . $lang['plugins_edit_modules_navsuburl'] . ':<input type="text" class="txt" name="newnavsuburl"></span>
			',
		));
		showtagfooter('tbody');
		showtagheader('tbody', 'n2_n');
		showtablerow('class="noborder"', array('', 'colspan="6"'), array(
		    '',
		    '&nbsp;&nbsp;&nbsp;<span id="nsp_n">' . $lang['plugins_edit_modules_param'] . ':<input type="text" class="txt" name="newparam"></span>',
		));
		showtagfooter('tbody');
		showsubmit('editsubmit', 'submit', 'del');
		showtablefooter();
		showformfooter();
		showtagfooter('div');
		$shideinit = '';
		foreach ($moduleids as $moduleid) {
			$shideinit .= 'shide($("s_' . $moduleid . '"), \'' . $moduleid . '\');';
		}
		echo '<script type="text/JavaScript">
			function shide(obj, id) {
				v = obj.options[obj.selectedIndex].getAttribute("h");
				$("m_" + id).style.display = v.substr(0,1) == "1" ? "" : "none";
				$("u_" + id).style.display = v.substr(1,1) == "1" ? "" : "none";
				$("a_" + id).style.display = v.substr(2,1) == "1" ? "" : "none";
				$("o_" + id).style.display = v.substr(3,1) == "1" ? "" : "none";
				if(v.substr(4,1)) {
					$("n_" + id).style.display = v.substr(4,1) == "1" ? "" : "none";
					$("nt_" + id).style.display = v.substr(4,1) == "1" ? "" : "none";
					$("ni_" + id).style.display = v.substr(5,1) == "1" ? "" : "none";
					$("nsn_" + id).style.display = v.substr(6,1) == "1" ? "" : "none";
					$("nsu_" + id).style.display = v.substr(6,1) == "1" ? "" : "none";
				} else {
					$("n_" + id).style.display = "none";
				}
				if(obj.value == 3) {
					$("n2_" + id).style.display = "";
					$("nsp_" + id).style.display = "";
				} else {
					$("n2_" + id).style.display = "none";
					$("nsp_" + id).style.display = "none";
				}
				e = obj.options[obj.selectedIndex].getAttribute("e");
				$("e_" + id).innerHTML = e && ($("url_" + id).value == \'\' || $("u_" + id).style.display == "none") ? "." + e + ".php" : "";
			}
			shide($("s_n"), "n");' . $shideinit . '
		</script>';

		showtagheader('div', 'vars', $anchor == 'vars');
		showformheader("plugins&operation=edit&type=vars&pluginid=$pluginid", '', 'varsform');
		showtableheader('plugins_edit_vars');
		showsubtitle(array('', 'display_order', 'plugins_vars_title', 'plugins_vars_variable', 'plugins_vars_type', ''));
		foreach (C::t('common_pluginvar')->fetch_all_by_pluginid($plugin['pluginid']) as $var) {
			$var['type'] = $lang['plugins_edit_vars_type_' . $var['type']];
			$var['title'] .= isset($lang[$var['title']]) ? '<br />' . $lang[$var['title']] : '';
			showtablerow('', array('class="td25"', 'class="td28"'), array(
			    "<input class=\"checkbox\" type=\"checkbox\" name=\"delete[]\" value=\"$var[pluginvarid]\">",
			    "<input type=\"text\" class=\"txt\" size=\"2\" name=\"displayordernew[$var[pluginvarid]]\" value=\"$var[displayorder]\">",
			    $var['title'],
			    $var['variable'],
			    $var['type'],
			    "<a href=\"" . ADMINSCRIPT . "?action=plugins&operation=vars&pluginid=$plugin[pluginid]&pluginvarid=$var[pluginvarid]&formhash=" . FORMHASH . "\" class=\"act\">$lang[detail]</a>"
			));
		}
		showtablerow('', array('class="td25"', 'class="td28"'), array(
		    cplang('add_new'),
		    '<input type="text" class="txt" size="2" name="newdisplayorder" value="0">',
		    '<input type="text" class="txt" size="15" name="newtitle">',
		    '<input type="text" class="txt" size="15" name="newvariable">',
		    '<select name="newtype">
				<option value="number">' . cplang('plugins_edit_vars_type_number') . '</option>
				<option value="text" selected>' . cplang('plugins_edit_vars_type_text') . '</option>
				<option value="textarea">' . cplang('plugins_edit_vars_type_textarea') . '</option>
				<option value="radio">' . cplang('plugins_edit_vars_type_radio') . '</option>
				<option value="select">' . cplang('plugins_edit_vars_type_select') . '</option>
				<option value="selects">' . cplang('plugins_edit_vars_type_selects') . '</option>
				<option value="color">' . cplang('plugins_edit_vars_type_color') . '</option>
				<option value="date">' . cplang('plugins_edit_vars_type_date') . '</option>
				<option value="datetime">' . cplang('plugins_edit_vars_type_datetime') . '</option>
				<option value="forum">' . cplang('plugins_edit_vars_type_forum') . '</option>
				<option value="forums">' . cplang('plugins_edit_vars_type_forums') . '</option>
				<option value="group">' . cplang('plugins_edit_vars_type_group') . '</option>
				<option value="groups">' . cplang('plugins_edit_vars_type_groups') . '</option>
				<option value="extcredit">' . cplang('plugins_edit_vars_type_extcredit') . '</option>
				<option value="forum_text">' . cplang('plugins_edit_vars_type_forum_text') . '</option>
				<option value="forum_textarea">' . cplang('plugins_edit_vars_type_forum_textarea') . '</option>
				<option value="forum_radio">' . cplang('plugins_edit_vars_type_forum_radio') . '</option>
				<option value="forum_select">' . cplang('plugins_edit_vars_type_forum_select') . '</option>
				<option value="group_text">' . cplang('plugins_edit_vars_type_group_text') . '</option>
				<option value="group_textarea">' . cplang('plugins_edit_vars_type_group_textarea') . '</option>
				<option value="group_radio">' . cplang('plugins_edit_vars_type_group_radio') . '</option>
				<option value="group_select">' . cplang('plugins_edit_vars_type_group_select') . '</option>
			</seletc>',
		    ''
		));
		showsubmit('editsubmit', 'submit', 'del');
		showtablefooter();
		showformfooter();
		showtagfooter('div');
	} else {

		$type = $_GET['type'];
		$anchor = $_GET['anchor'];
		if ($type == 'common') {

			$versionnew = strip_tags(trim($_GET['versionnew']));
			$adminidnew = ($_GET['adminidnew'] > 0 && $_GET['adminidnew'] <= 3) ? $_GET['adminidnew'] : 1;

			$plugin['modules']['extra']['langexists'] = $_GET['langexists'] ? 1 : 0;
			C::t('common_plugin')->update($pluginid, array(
			    'adminid' => $adminidnew,
			    'version' => $versionnew,
			    'modules' => serialize($plugin['modules']),
			));
		} elseif ($type == 'modules') {

			$modulesnew = array();
			$newname = trim($_GET['newname']);
			$updatenav = false;
			if (is_array($plugin['modules'])) {
				foreach ($plugin['modules'] as $moduleid => $module) {
					if (!isset($_GET['delete'][$moduleid])) {
						if ($moduleid === 'extra' || $moduleid === 'system') {
							continue;
						}
						$modulesnew[] = array(
						    'name' => $_GET['namenew'][$moduleid],
						    'param' => $_GET['paramnew'][$moduleid],
						    'menu' => $_GET['menunew'][$moduleid],
						    'url' => $_GET['urlnew'][$moduleid],
						    'type' => $_GET['typenew'][$moduleid],
						    'adminid' => ($_GET['adminidnew'][$moduleid] >= 0 && $_GET['adminidnew'][$moduleid] <= 3) ? $_GET['adminidnew'][$moduleid] : $module['adminid'],
						    'displayorder' => intval($_GET['ordernew'][$moduleid]),
						    'navtitle' => $_GET['navtitlenew'][$moduleid],
						    'navicon' => $_GET['naviconnew'][$moduleid],
						    'navsubname' => $_GET['navsubnamenew'][$moduleid],
						    'navsuburl' => $_GET['navsuburlnew'][$moduleid],
						);
						if (in_array($_GET['typenew'][$moduleid], array(1, 23, 24, 25))) {
							$updatenav = true;
						}
					} elseif (in_array($_GET['typenew'][$moduleid], array(1, 23, 24, 25))) {
						$updatenav = true;
					}
				}
			}

			if ($updatenav) {
				C::t('common_nav')->delete_by_type_identifier(3, $plugin['identifier']);
			}

			$modulenew = array();
			if (!empty($_GET['newname'])) {
				$modulesnew[] = array(
				    'name' => $_GET['newname'],
				    'param' => $_GET['newparam'],
				    'menu' => $_GET['newmenu'],
				    'url' => $_GET['newurl'],
				    'type' => $_GET['newtype'],
				    'adminid' => $_GET['newadminid'],
				    'displayorder' => intval($_GET['neworder']),
				    'navtitle' => $_GET['newnavtitle'],
				    'navicon' => $_GET['newnavicon'],
				    'navsubname' => $_GET['newnavsubname'],
				    'navsuburl' => $_GET['newnavsuburl'],
				);
			}

			usort($modulesnew, 'modulecmp');

			$namesarray = array();
			foreach ($modulesnew as $key => $module) {
				$namekey = in_array($module['type'], array(11, 12)) ? 1 : 0;
				if (!ispluginkey($module['name'])) {
					cpmsg('plugins_edit_modules_name_invalid', '', 'error');
				} elseif (@in_array($module['name'] . '?' . $module['param'], $namesarray[$namekey])) {
					cpmsg('plugins_edit_modules_duplicated', '', 'error');
				}
				$namesarray[$namekey][] = $module['name'] . '?' . $module['param'];

				$module['menu'] = trim($module['menu']);
				$module['url'] = trim($module['url']);
				$module['adminid'] = $module['adminid'] >= 0 && $module['adminid'] <= 3 ? $module['adminid'] : 1;

				$modulesnew[$key] = $module;
			}
			if (!empty($plugin['modules']['extra'])) {
				$modulesnew['extra'] = $plugin['modules']['extra'];
			}

			if (!empty($plugin['modules']['system'])) {
				$modulesnew['system'] = $plugin['modules']['system'];
			}

			C::t('common_plugin')->update($pluginid, array('modules' => serialize($modulesnew)));
		} elseif ($type == 'vars') {

			if ($_GET['delete']) {
				C::t('common_pluginvar')->delete($_GET['delete']);
			}

			if (is_array($_GET['displayordernew'])) {
				foreach ($_GET['displayordernew'] as $id => $displayorder) {
					C::t('common_pluginvar')->update($id, array('displayorder' => $displayorder));
				}
			}

			$newtitle = dhtmlspecialchars(trim($_GET['newtitle']));
			$newvariable = trim($_GET['newvariable']);
			if ($newtitle && $newvariable) {
				if (strlen($newvariable) > 40 || !ispluginkey($newvariable) || C::t('common_pluginvar')->check_variable($pluginid, $newvariable)) {
					cpmsg('plugins_edit_var_invalid', '', 'error');
				}
				$data = array(
				    'pluginid' => $pluginid,
				    'displayorder' => $_GET['newdisplayorder'],
				    'title' => $newtitle,
				    'variable' => $newvariable,
				    'type' => $_GET['newtype'],
				);
				C::t('common_pluginvar')->insert($data);
			}
		}

		updatecache(array('plugin', 'setting', 'styles'));
		cleartemplatecache();
		updatemenu('plugin');
		cpmsg('plugins_edit_succeed', "action=plugins&operation=edit&pluginid=$pluginid&anchor=$anchor&formhash=" . FORMHASH, 'succeed');
	}
} elseif ($operation == 'delete') {

	$plugin = C::t('common_plugin')->fetch($pluginid);
	$dir = $plugin['identifier'];
	$modules = dunserialize($plugin['modules']);
	if ($modules['system']) {
		cpmsg('plugins_delete_error');
	}

	$pluginarray = cloudaddons_getimportdata($dir, 0, 1);
	if (empty($pluginarray)) {
		$pluginarray['checkfile'] = $modules['extra']['checkfile'];
		$pluginarray['uninstallfile'] = $modules['extra']['uninstallfile'];
	}

	if (!empty($pluginarray['checkfile']) && preg_match('/^[\w\.]+$/', $pluginarray['checkfile'])) {
		loadcache('pluginlanguage_install');
		$installlang = $_G['cache']['pluginlanguage_install'][$plugin['identifier']];
		loadcache('addonfiles');
		$addonfiles = $_G['cache']['addonfiles'];
		if($addonfiles[$dir]['check.php']){
			cloudaddons_addonexecute($addonfiles[$dir]['check.php'], 'check.php');
		}else{
			$filename = DISCUZ_ROOT . './source/plugin/' . $plugin['identifier'] . '/' . $pluginarray['checkfile'];
			if (file_exists($filename)) {
				@include $filename;
			}
		}
	}

	$identifier = $plugin['identifier'];
	C::t('common_plugin')->delete($pluginid);
	C::t('common_pluginvar')->delete_by_pluginid($pluginid);
	C::t('common_nav')->delete_by_type_identifier(3, $identifier);

	foreach (array('script', 'template') as $type) {
		loadcache('pluginlanguage_' . $type, 1);
		if (isset($_G['cache']['pluginlanguage_' . $type][$identifier])) {
			unset($_G['cache']['pluginlanguage_' . $type][$identifier]);
			savecache('pluginlanguage_' . $type, $_G['cache']['pluginlanguage_' . $type]);
		}
	}

	updatecache(array('plugin', 'setting', 'styles'));
	cleartemplatecache();
	updatemenu('plugin');

	if(!empty($pluginarray['uninstallfile']) && preg_match('/^[\w\.]+$/', $pluginarray['uninstallfile'])) {
		loadcache('pluginlanguage_install');
		$installlang = $_G['cache']['pluginlanguage_install'][$plugin['identifier']];
		loadcache('addonfiles');
		$addonfiles = $_G['cache']['addonfiles'];
		if($addonfiles[$dir]['uninstall.php']){
			cloudaddons_addonexecute($addonfiles[$dir]['uninstall.php'], 'uninstall.php');
		}else{
			$filename = DISCUZ_ROOT.'./source/plugin/'.$plugin['identifier'].'/'.$pluginarray['uninstallfile'];
			if(file_exists($filename)) {
				@include $filename;
			}
		}
	}

	cron_delete($dir);
	loadcache('pluginlanguage_install', 1);
	if (!empty($_G['cache']['pluginlanguage_install']) && isset($_G['cache']['pluginlanguage_install'][$identifier])) {
		unset($_G['cache']['pluginlanguage_install'][$identifier]);
		savecache('pluginlanguage_install', $_G['cache']['pluginlanguage_install']);
	}

	cloudaddons_uninstall($dir . '.plugin', DISCUZ_ROOT . './source/plugin/' . $dir);
	dheader('location: ' . ADMINSCRIPT . '?action=plugins' . ($catid ? '&catid=' . $catid : ''));

} elseif ($operation == 'vars') {

	$pluginvarid = $_GET['pluginvarid'];
	$pluginvar = C::t('common_plugin')->fetch_by_pluginvarid($pluginid, $pluginvarid);
	if (!$pluginvar) {
		cpmsg('pluginvar_not_found', '', 'error');
	}

	if (!submitcheck('varsubmit')) {
		shownav('plugin');
		showsubmenu($lang['plugins_edit'] . ' - ' . $pluginvar['name'], array(
		    array('plugins_list', 'plugins', 0),
		    array('config', 'plugins&operation=edit&pluginid=' . $pluginid . '&anchor=config&formhash=' . FORMHASH, 0),
		    array('plugins_config_module', 'plugins&operation=edit&pluginid=' . $pluginid . '&anchor=modules&formhash=' . FORMHASH, 0),
		    array('plugins_config_vars', 'plugins&operation=edit&pluginid=' . $pluginid . '&anchor=vars&formhash=' . FORMHASH, 1),
		));

		$typeselect = '<select name="typenew" onchange="if(this.value.indexOf(\'select\') != -1) $(\'extra\').style.display=\'\'; else $(\'extra\').style.display=\'none\';">';
		foreach (array('number', 'text', 'radio', 'textarea', 'select', 'selects', 'color', 'date', 'datetime', 'forum', 'forums', 'group', 'groups', 'extcredit',
	    'forum_text', 'forum_textarea', 'forum_radio', 'forum_select', 'group_text', 'group_textarea', 'group_radio', 'group_select') as $type) {
			$typeselect .= '<option value="' . $type . '" ' . ($pluginvar['type'] == $type ? 'selected' : '') . '>' . $lang['plugins_edit_vars_type_' . $type] . '</option>';
		}
		$typeselect .= '</select>';

		showformheader("plugins&operation=vars&pluginid=$pluginid&pluginvarid=$pluginvarid");
		showtableheader();
		showtitle($lang['plugins_edit_vars'] . ' - ' . $pluginvar['title']);
		showsetting('plugins_edit_vars_title', 'titlenew', $pluginvar['title'], 'text');
		showsetting('plugins_edit_vars_description', 'descriptionnew', $pluginvar['description'], 'textarea');
		showsetting('plugins_edit_vars_type', '', '', $typeselect);
		showsetting('plugins_edit_vars_variable', 'variablenew', $pluginvar['variable'], 'text');
		showtagheader('tbody', 'extra', $pluginvar['type'] == 'select' || $pluginvar['type'] == 'selects');
		showsetting('plugins_edit_vars_extra', 'extranew', $pluginvar['extra'], 'textarea');
		showtagfooter('tbody');
		showsubmit('varsubmit');
		showtablefooter();
		showformfooter();
	} else {

		$titlenew = cutstr(trim($_GET['titlenew']), 25);
		$descriptionnew = cutstr(trim($_GET['descriptionnew']), 255);
		$variablenew = trim($_GET['variablenew']);
		$extranew = trim($_GET['extranew']);

		if (!$titlenew) {
			cpmsg('plugins_edit_var_title_invalid', '', 'error');
		} elseif ($variablenew != $pluginvar['variable']) {
			if (!$variablenew || strlen($variablenew) > 40 || !ispluginkey($variablenew) || C::t('common_pluginvar')->check_variable($pluginid, $variablenew)) {
				cpmsg('plugins_edit_vars_invalid', '', 'error');
			}
		}

		C::t('common_pluginvar')->update_by_pluginvarid($pluginid, $pluginvarid, array(
		    'title' => $titlenew,
		    'description' => $descriptionnew,
		    'type' => $_GET['typenew'],
		    'variable' => $variablenew,
		    'extra' => $extranew
		));

		updatecache(array('plugin', 'setting', 'styles'));
		cleartemplatecache();
		cpmsg('plugins_edit_vars_succeed', "action=plugins&operation=edit&pluginid=$pluginid&anchor=vars&formhash=" . FORMHASH, 'succeed');
	}
} elseif ($operation == 'upgradecheck') {
	if (empty($_GET['identifier'])) {
		$pluginarray = C::t('common_plugin')->fetch_all_data();
	} else {
		$plugin = C::t('common_plugin')->fetch_by_identifier($_GET['identifier']);
		$pluginarray = $plugin ? array($plugin) : array();
	}
	$plugins = $errarray = $newarray = $nowarray = array();
	if (!$pluginarray) {
		cpmsg('plugin_not_found', '', 'error');
	} else {
		$addonids = array();
		foreach ($pluginarray as $row) {
			if (ispluginkey($row['identifier']) && $row['available']) {
				$addonids[] = $row['identifier'] . '.plugin';
			}
		}
		if($addonids){
			$checkresult = dunserialize(cloudaddons_upgradecheck($addonids));
			savecache('addoncheck_plugin', $checkresult);
			foreach ($pluginarray as $row) {
				$addonid = $row['identifier'] . '.plugin';
				if (isset($checkresult[$addonid])) {
					list($return, $newver, $sysver) = explode(':', $checkresult[$addonid]);
					$result[$row['identifier']]['result'] = $return;
					if ($sysver) {
						if ($sysver > $row['version']) {
							$result[$row['identifier']]['result'] = 2;
							$result[$row['identifier']]['newver'] = $sysver;
						} else {
							$result[$row['identifier']]['result'] = 1;
						}
					} elseif ($newver) {
						$result[$row['identifier']]['newver'] = $newver;
					}
				}
				$plugins[$row['identifier']] = $row['name'] . ' ' . $row['version'];
				$modules = dunserialize($row['modules']);

				$pluginarray = cloudaddons_getimportdata($row['identifier'], 0, 1);
				$upgrade = false;
				if (!empty($pluginarray)) {
					$newver = !empty($pluginarray['plugin']['version']) ? $pluginarray['plugin']['version'] : 0;
					if ($newver > $row['version']) {
						$upgrade = true;
						$nowarray[] = '<a href="' . ADMINSCRIPT . '?action=plugins&operation=upgrade&pluginid=' . $row['pluginid'] . '&formhash=' . FORMHASH . '">' . $plugins[$row['identifier']] . ' -> ' . $newver . '</a>';
					}
				}
			}
		}else{
			cpmsg('plugin_not_found', '', 'error');
		}
	}
	foreach ($result as $id => $row) {
		if ($row['result'] == 0) {
			$errarray[] = '<a href="' . ADMINSCRIPT . '?action=cloudaddons&id=' . $id . '.plugin" target="_blank">' . $plugins[$id] . '</a>';
		} elseif ($row['result'] == 2) {
			$newarray[] = '<a href="' . ADMINSCRIPT . '?action=cloudaddons&id=' . $id . '.plugin" target="_blank">' . $plugins[$id] . ($row['newver'] ? ' -> ' . $row['newver'] : '') . '</a>';
		}
	}
	shownav('plugin');
	showsubmenu('nav_plugins', $submenu);
	if (!$nowarray && !$newarray && !$errarray) {
		echo '<div class="infobox"><h4 class="marginbot normal" style="font-size: 30px;color: red;">'.cplang('plugins_validator_noupdate').'</h4></div>';
		exit;
	} else {
		showtableheader();
		if ($nowarray) {
			showtitle('plugins_validator_nowupgrade');
			foreach ($nowarray as $row) {
				showtablerow('class="hover"', array(), array($row));
			}
		}
		if ($newarray) {
			showtitle('plugins_validator_newversion');
			foreach ($newarray as $row) {
				showtablerow('class="hover"', array(), array($row));
			}
		}
		if ($errarray) {
			showtitle('plugins_validator_error');
			foreach ($errarray as $row) {
				showtablerow('class="hover"', array(), array($row));
			}
		}
		showtablefooter();
	}
} elseif ($operation == 'cat') {
	loadcache('plugin');
	shownav('plugin');
	showsubmenu('nav_plugins', $submenu);
	if (!submitcheck('catsubmit')) {
		echo <<<EOF
		<script type="text/JavaScript">
			var rowtypedata = [
			[
			[1, '', 'td25'],
			[1, '<input type="text" class="txt" name="newdisplayorder[]" size="1">', 'td30'],
			[1, '<input type="text" class="txt" name="newcatname[]" value="">', 'td30'],
			[1, '<input type="text" class="txt" name="newcatcode[]" value="">', 'td30'],
			[1, '<input type="checkbox" class="checkbox" name="newcatstatus[]" value="1" checked="checked">', ''],
			],
			];
		</script>
EOF;

		$allcats = C::t('common_plugincat')->fetch_all();
		foreach ($allcats as $list) {
			$clist .= showtablerow('', array('', 'class="td30"', 'class="td30"', 'class="td30"'), array(
			    '<input class="checkbox" type="checkbox" name="delete[' . $list['catid'] . ']" value="' . $list['catid'] . '">',
			    '<input class="txt" type="text" name="displayordernew[' . $list['catid'] . ']" value="' . $list['displayorder'] . '">',
			    '<input class="txt" type="text" name="catnamenew[' . $list['catid'] . ']" value="' . $list['catname'] . '">',
			    '<input class="txt" type="text" name="catcodenew[' . $list['catid'] . ']" value="' . $list['catcode'] . '">',
			    '<input class="checkbox" type="checkbox" name="catstatusnew[' . $list['catid'] . ']" value="1" ' . ($list['status'] ? 'checked="checked" ' : '') . '>',
				), TRUE);
		}
		showformheader('plugins&operation=cat');
		showtips(cplang('plugins_cat_tips'));
		showtableheader('', 'fixpadding', '');
		showsubtitle(array('', cplang('setting_profile_group_displayorder'), cplang('plugins_cat_catname'), cplang('plugins_cat_catcode'), cplang('plugins_cat_status')), 'header', array('', 'class="td24"', 'class="td24"', 'class="td24"'));
		echo $clist;
		echo '<tr><td>&nbsp;</td><td colspan="8"><div><a href="javascript:;" onclick="addrow(this, 0)" class="addtr">' . cplang('plugins_cat_add') . '</a></div></td></tr>';
		showsubmit('catsubmit', $lang['submit'], 'del');
		showtablefooter();
		showformfooter();
	} else {
		if (is_array($_GET['delete'])) {
			foreach ($_GET['delete'] as $id) {
				C::t("common_plugincat")->delete(intval($id));
				C::t("common_plugin")->delete_by_catid(intval($id));
			}
		}
		if (is_array($_GET['catnamenew'])) {
			foreach ($_GET['catnamenew'] as $id => $value) {
				if ($value) {
					$data = array(
					    'displayorder' => intval($_GET['displayordernew'][$id]),
					    'catcode' => dhtmlspecialchars(trim(addslashes($_GET['catcodenew'][$id]))),
					    'catname' => dhtmlspecialchars(trim(addslashes($value))),
					    'status' => intval($_GET['catstatusnew'][$id])
					);
					if (!ispluginkey($data['catcode'])) {
						cpmsg('plugins_cat_code_invalid', '', 'error');
					}
					C::t("common_plugincat")->update(intval($id), $data);
				}
			}
		}
		if (is_array($_GET['newcatname'])) {
			$ig = $done = 0;
			foreach ($_GET['newcatname'] as $id => $value) {
				$newdata = array(
				    'displayorder' => intval($_GET['newdisplayorder'][$id]),
				    'catcode' => dhtmlspecialchars(trim(addslashes($_GET['newcatcode'][$id]))),
				    'catname' => dhtmlspecialchars(trim(addslashes($value))),
				    'status' => intval($_GET['newcatstatus'][$id])
				);
				if (C::t("common_plugincat")->fetch_by_catcode($newdata['catcode']) || !$value || !ispluginkey($newdata['catcode'])) {
					$ig++;
				} else {
					C::t("common_plugincat")->insert($newdata);
					$done++;
				}
			}
		}
		updatecache(array('plugin', 'setting', 'styles'));
		updatemenu('plugin');
		cpmsg((($ig || $done) ? cplang('plugins_cat_success_add', array('done' => $done, 'ig' => $ig)) : cplang('plugins_cat_success')), "action=plugins&operation=cat&formhash=" . FORMHASH, 'succeed');
	}
}