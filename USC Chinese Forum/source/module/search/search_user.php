<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: search_user.php 25889 2011-11-24 09:52:20Z monkey $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

define('NOROBOT', TRUE);

$url = '';
if($_G['setting']['domain']['app']['home'] || $_G['setting']['domain']['app']['default']) {
	if(empty($_SERVER['SERVER_PORT'])){
		$port = '';
	}elseif($_SERVER['SERVER_PORT'] == '80' && $_G['scheme'] == 'http'){
		$port = '';
	}elseif($_SERVER['SERVER_PORT'] == '433' && $_G['scheme'] == 'https'){
		$port = '';
	}else{
		$port = ':'.$_SERVER['SERVER_PORT'];
	}
	$domain = '';
	if($_G['setting']['domain']['app']['home']) {
		$domain = $_G['setting']['domain']['app']['home'];
	} else {
		$domain = $_G['setting']['domain']['app']['default'];
	}
	$url = $_G['scheme'].'://'.$domain.$port.'/';
}
$url .= 'home.php?mod=spacecp&ac=search';
if($_GET['srchtxt']) {
	$url .= '&username='.$_GET['srchtxt'].'&searchsubmit=yes';
}

dheader('Location: '.$url);

?>