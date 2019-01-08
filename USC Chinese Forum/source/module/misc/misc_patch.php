<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: misc_patch.php 33690 2013-08-02 09:07:22Z nemohou $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

if($_GET['action'] == 'checkpatch') {

	header('Content-Type: text/javascript');

	exit;

} elseif($_GET['action'] == 'patchnotice') {

	$patchlist = '';
	include template('common/header_ajax');
	echo $patchlist;
	include template('common/footer_ajax');
	exit;

} elseif($_GET['action'] == 'pluginnotice') {
	include template('common/header_ajax');
	include template('common/footer_ajax');
	exit;
} elseif($_GET['action'] == 'ipnotice') {
	require_once libfile('function/misc');
	include template('common/header_ajax');
	if($_G['cookie']['lip'] && $_G['cookie']['lip'] != ',' && $_G['uid'] && $_G['setting']['disableipnotice'] != 1) {
		$status = C::t('common_member_status')->fetch($_G['uid']);
		$lip = explode(',', $_G['cookie']['lip']);
		$lastipConvert = convertip($lip[0]);
		$lastipDate = dgmdate($lip[1]);
		$nowipConvert = convertip($status['lastip']);

		$lastipConvert = process_ipnotice($lastipConvert);
		$nowipConvert = process_ipnotice($nowipConvert);

		if($lastipConvert != $nowipConvert && stripos($lastipConvert, $nowipConvert) == false && stripos($nowipConvert, $lastipConvert) == false) {
			$lang = lang('forum/misc');
			include template('common/ipnotice');
		}else{
			dsetcookie('lip', '', -1);
		}
	}else{
		dsetcookie('lip', '', -1);
	}
	include template('common/footer_ajax');
	exit;
}



?>