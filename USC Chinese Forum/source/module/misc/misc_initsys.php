<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: misc_initsys.php 36323 2016-12-20 09:49:00Z nemohou $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

if(file_exists(DISCUZ_ROOT.'./data/install.lock')) {
	exit('Access Denied');
}

if(!($_G['adminid'] == 1 && $_GET['formhash'] == formhash()) && $_G['setting']) {
	exit('Access Denied');
}

require_once libfile('function/cache');
updatecache();

require_once libfile('function/block');
blockclass_cache();

if($_G['config']['output']['tplrefresh']) {
	cleartemplatecache();
}

@touch(DISCUZ_ROOT.'./data/install.lock');



?>