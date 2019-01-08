<?php

/**
 *      [Discuz!] (C)2001-2099 Comsenz Inc.
 *      This is NOT a freeware, use is subject to license terms
 *
 *      $Id: spacecp_space.php 25510 2011-11-14 02:22:26Z yexinhao $
 */

if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}

if($_GET['op'] == 'delete') {
	$delid = $_GET['type'] == 'profilelink'? 'profilelink_'.$_GET['appid'] : $_GET['appid'];
}
$actives = array($ac => ' class="active"');

include_once template("home/spacecp_space");

?>