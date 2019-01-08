<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: admin.php 34285 2013-12-13 03:39:35Z hypowang $
 */

define('IN_ADMINCP', TRUE);
define('NOROBOT', TRUE);
define('ADMINSCRIPT', basename(__FILE__));
define('CURSCRIPT', 'admin');
define('HOOKTYPE', 'hookscript');
define('APPTYPEID', 0);


require './source/class/class_core.php';
require './source/function/function_misc.php';
require './source/function/function_forum.php';
require './source/function/function_admincp.php';
require './source/function/function_cache.php';

$discuz = C::app();
$discuz->init();

if(ADMINSCRIPT == 'admin.php' && $_SERVER['REMOTE_ADDR'] != '127.0.0.1'){
	showmessage('adminfile_edit', '', 'error');
}

if(!$_G['uid'] && !empty($_GET['auth'])) {
		$auth = daddslashes(explode("\t", authcode($_GET['auth'], 'DECODE', $_G['config']['security']['authkey'])));
		list($discuz_pw, $discuz_uid) = empty($auth) || count($auth) < 2 ? array('', '') : $auth;

		if($discuz_uid) {
			$member = getuserbyuid($discuz_uid, 1);
			if(!empty($member) && $member['password'] == $discuz_pw) {
				include_once libfile('function/member');
				setloginstatus($member, 1296000);
			}
		}
}

if($_G['config']['admincp']['forceadmin'] && (!$_G['uid'] || !getstatus($_G['member']['allowadmincp'], 1))) {
	header('HTTP/1.1 404 Not Found');
	header('status: 404 Not Found');
	if(file_exists(DISCUZ_ROOT.'./404.html')){
			$contents = file_get_contents(DISCUZ_ROOT.'./404.html');
			$contents = str_replace('{siteurl}', $_G['siteurl'], $contents);
			echo $contents;
	}
	exit();
}

$admincp = new discuz_admincp();
$admincp->core  = & $discuz;
$admincp->init();


$admincp_actions_founder = array('templates', 'db', 'founder', 'postsplit', 'threadsplit', 'cloudaddons', 'upgrade', 'patch', 'optimizer');
$admincp_actions_normal = array('index', 'setting', 'members', 'admingroup', 'usergroups', 'usertag',
	'forums', 'threadtypes', 'threads', 'moderate', 'attach', 'smilies', 'recyclebin', 'recyclebinpost', 'prune', 'grid',
	'styles', 'addons', 'plugins', 'packs', 'tasks', 'magics', 'medals', 'google', 'announce', 'faq', 'ec',
	'tradelog', 'jswizard', 'project', 'counter', 'misc', 'adv', 'logs', 'tools', 'portalperm', 'blogrecyclebin',
	'checktools', 'search', 'article', 'block', 'blockstyle', 'blockxml', 'portalcategory', 'blogcategory', 'albumcategory', 'topic', 'credits',
	'doing', 'group', 'blog', 'feed', 'album', 'pic', 'comment', 'share', 'click', 'specialuser', 'postsplit', 'threadsplit', 'report',
	'district', 'diytemplate', 'verify', 'nav', 'domain', 'postcomment', 'tag', 'connect', 'card', 'portalpermission', 'collection', 'membersplit', 'makehtml');

$action = preg_replace('/[^\[A-Za-z0-9_\]]/', '', getgpc('action'));

if(!in_array($action, array('plugins', 'cloudaddons')) && !$_G['isHTTPS'] && $_G['setting']['httpsoptimize']){
	$query = array();
	parse_str($_SERVER['QUERY_STRING'], $query);
	$query['auth'] = authcode(authcode(getglobal('auth', 'cookie'), 'DECODE'), 'ENCODE', $_G['config']['security']['authkey'], 3600);
	$query_sting_tmp = http_build_query($query);
	echo '<script type="text/javascript">parent.location.href=\''.str_replace('http://', 'https://', $_G['siteurl']).ADMINSCRIPT . '?' . $query_sting_tmp.'\';</script>';
	exit;
}


$operation = preg_replace('/[^\[A-Za-z0-9_\]]/', '', getgpc('operation'));
$do = preg_replace('/[^\[A-Za-z0-9_\]]/', '', getgpc('do'));
$frames = preg_replace('/[^\[A-Za-z0-9_\]]/', '', getgpc('frames'));
lang('admincp');
$lang = & $_G['lang']['admincp'];
$page = max(1, intval(getgpc('page')));
$isfounder = $admincp->isfounder;

if(empty($action) || $frames != null) {
	$admincp->show_admincp_main();
} elseif($action == 'logout') {
	$admincp->do_admin_logout();
	dheader("Location: ./index.php");
} elseif(in_array($action, $admincp_actions_normal) || ($admincp->isfounder && in_array($action, $admincp_actions_founder))) {
	if($admincp->allow($action, $operation, $do) || $action == 'index') {
		require $admincp->admincpfile($action);
	} else {
		cpheader();
		cpmsg('action_noaccess', '', 'error');
	}
} else {
	cpheader();
	cpmsg('action_noaccess', '', 'error');
}
?>