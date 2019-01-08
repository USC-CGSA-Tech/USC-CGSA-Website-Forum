
DROP TABLE IF EXISTS pre_common_admincp_cmenu;
CREATE TABLE pre_common_admincp_cmenu (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '菜单名称',
  `url` varchar(255) NOT NULL COMMENT '菜单地址',
  `sort` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型,备用',
  `displayorder` tinyint(3) NOT NULL COMMENT '显示顺序',
  `clicks` smallint(6) unsigned NOT NULL DEFAULT '1' COMMENT '点击数,备用',
  `uid` int(10) unsigned NOT NULL COMMENT '添加用户',
  `dateline` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MYISAM COMMENT='后台菜单收藏表';

DROP TABLE IF EXISTS pre_common_admingroup;
CREATE TABLE pre_common_admingroup (
  admingid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '所属管理员分组ID',
  alloweditpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑帖子',
  alloweditpoll tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑投票',
  allowstickthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许置顶主题',
  allowmodpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许审核帖子',
  allowdelpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许删除帖子',
  allowmassprune tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许批量删帖',
  allowrefund tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许强制退款',
  allowcensorword tinyint(1) NOT NULL DEFAULT '0' COMMENT '兼容性字段',
  allowviewip tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许查看IP',
  allowbanip tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许禁止IP',
  allowedituser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑用户',
  allowmoduser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许审核用户',
  allowbanuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许禁止用户发言',
  allowbanvisituser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许禁止用户访问',
  allowpostannounce tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许发布站点公告',
  allowviewlog tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许查看管理日志',
  allowbanpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许屏蔽帖子',
  supe_allowpushthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '兼容性字段',
  allowhighlightthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许高亮主题',
  allowlivethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许直播主题',
  allowdigestthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许精华主题',
  allowrecommendthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许推荐主题',
  allowbumpthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许提升主题',
  allowclosethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许关闭主题',
  allowmovethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许移动主题',
  allowedittypethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑主题分类',
  allowstampthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许添加主题图章',
  allowstamplist tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许添加主题图标',
  allowcopythread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许复制主题',
  allowmergethread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许合并主题',
  allowsplitthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许分割主题',
  allowrepairthread tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许修复主题',
  allowwarnpost tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许警告帖子',
  allowviewreport tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许查看用户报告',
  alloweditforum tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑版块',
  allowremovereward tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许移除悬赏',
  allowedittrade tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许编辑商品',
  alloweditactivity tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理活动报名者',
  allowstickreply tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许置顶回帖',
  allowmanagearticle tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理所有文章',
  allowaddtopic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许创建专题',
  allowmanagetopic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理专题',
  allowdiy tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许DIY',
  allowclearrecycle tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许删除回收站的帖子',
  allowmanagetag tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理标签',
  alloweditusertag tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理用户标签',
  managefeed tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理动态(feed)',
  managedoing tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理记录',
  manageshare tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理分享',
  manageblog tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理日志',
  managealbum tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理相册',
  managecomment tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理评论',
  managemagiclog tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理道具记录',
  managereport tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理举报',
  managehotuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理推荐成员',
  managedefaultuser tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理推荐好友',
  managevideophoto tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理视频认证',
  managemagic tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理道具',
  manageclick tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理表态动作',
  allowmanagecollection tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否允许管理淘专辑',
  allowmakehtml tinyint(1) NOT NULL default '0' COMMENT '允许生成HTML',
  PRIMARY KEY (admingid)
) ENGINE=MyISAM COMMENT='管理组表';

DROP TABLE IF EXISTS pre_common_adminnote;
CREATE TABLE pre_common_adminnote (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '后台留言id',
  admin varchar(15) NOT NULL default '' COMMENT '管理员姓名',
  access tinyint(3) NOT NULL default '0' COMMENT '哪组可以看到信息',
  adminid tinyint(3) NOT NULL default '0' COMMENT '管理员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表时间',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '过期时间',
  message text NOT NULL COMMENT '消息',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='后台留言表';

DROP TABLE IF EXISTS pre_common_advertisement;
CREATE TABLE pre_common_advertisement (
  advid mediumint(8) unsigned NOT NULL auto_increment COMMENT '广告id',
  available tinyint(1) NOT NULL default '0' COMMENT '是否启用',
  `type` varchar(50) NOT NULL default '0' COMMENT '类型',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  title varchar(255) NOT NULL default '' COMMENT '广告标题',
  targets text NOT NULL COMMENT '投放范围',
  parameters text NOT NULL COMMENT '参数\n序列化存放的数组数据',
  `code` text NOT NULL COMMENT '代码',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '结束时间',
  PRIMARY KEY  (advid)
) ENGINE=MyISAM COMMENT='广告数据表';

DROP TABLE IF EXISTS pre_common_advertisement_custom;
CREATE TABLE pre_common_advertisement_custom (
  `id` smallint(5) unsigned NOT NULL auto_increment COMMENT '自定义广告类型id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM COMMENT='自定义广告数据表';

DROP TABLE IF EXISTS pre_common_banned;
CREATE TABLE pre_common_banned (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '禁止id',
  ip1 smallint(3) NOT NULL default '0' COMMENT 'IP分段1',
  ip2 smallint(3) NOT NULL default '0' COMMENT 'IP分段2',
  ip3 smallint(3) NOT NULL default '0' COMMENT 'IP分段3',
  ip4 smallint(3) NOT NULL default '0' COMMENT 'IP分段4',
  admin varchar(15) NOT NULL default '' COMMENT '管理员姓名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '禁止时间',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '过期时间',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='禁止访问表';

DROP TABLE IF EXISTS pre_common_cache;
CREATE TABLE pre_common_cache (
  cachekey varchar(255) NOT NULL default '',
  cachevalue mediumblob NOT NULL,
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (cachekey)
) ENGINE=MyISAM COMMENT='通用缓存表';

DROP TABLE IF EXISTS pre_common_card;
CREATE TABLE pre_common_card (
  id char(255) NOT NULL default '' COMMENT '生成的卡片号码',
  typeid smallint(6) unsigned NOT NULL default '1' COMMENT '卡片分类',
  maketype tinyint(1) NOT NULL default '0' COMMENT '卡片生成的方法',
  makeruid int(10) unsigned NOT NULL default '0' COMMENT '卡片生成者uid',
  `price` mediumint(8) unsigned NOT NULL default '0' COMMENT '卡片面值',
  `extcreditskey` tinyint(1) NOT NULL default '0' COMMENT '充值积分种类',
  `extcreditsval` int(10) NOT NULL default '0' COMMENT '积分数额',
  `status` tinyint(1) unsigned NOT NULL default '1' COMMENT '卡片状态(位与):1:可用,2:已用',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '卡片生成时间',
  cleardateline int(10) unsigned NOT NULL default '0' COMMENT '卡片清理时间',
  useddateline int(10) unsigned NOT NULL default '0' COMMENT '使用时间',
  uid int(10)  unsigned NOT NULL default '0' COMMENT '使用者',
  PRIMARY KEY  (id),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='充值卡密表';
DROP TABLE IF EXISTS pre_common_card_log;
CREATE TABLE pre_common_card_log (
  id smallint(6) NOT NULL auto_increment COMMENT '生成的卡片号码',
  `uid` INT(10) NOT NULL default '0' COMMENT '卡片生成者',
  `username` varchar(20) NOT NULL default '' COMMENT '卡片生成者',
  cardrule varchar(255) NOT NULL default '' COMMENT '卡片生成规则',
  `info` text NOT NULL COMMENT '卡片生成log',
  dateline INT(10) unsigned NOT NULL default '0' COMMENT '本次log生成时间',
  description mediumtext NOT NULL COMMENT '卡片描述',
  operation tinyint(1) NOT NULL default '0' COMMENT '操作动作(位与):1:生成,2:任务生成,4:删除,9:卡片过期',
  PRIMARY KEY  (id),
  KEY `dateline` (`dateline`),
  KEY `operation_dateline` (`operation`, `dateline`)
) ENGINE=MyISAM COMMENT='充值卡密表';

DROP TABLE IF EXISTS pre_common_card_type;
CREATE TABLE pre_common_card_type (
  id smallint(6) NOT NULL auto_increment COMMENT '卡片分类ID',
  typename char(20) NOT NULL default '' COMMENT '分类名称',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='卡片分类表';

DROP TABLE IF EXISTS pre_common_credit_log;
CREATE TABLE pre_common_credit_log (
  `logid` mediumint(8) unsigned NOT NULL auto_increment COMMENT 'id',
  `uid` INT(10) unsigned NOT NULL default '0' COMMENT '所属用户uid',
  `operation` char(3) NOT NULL default '' COMMENT '操作类型',
  `relatedid` int(10) unsigned NOT NULL COMMENT '操作相关ID',
  `dateline` int(10) unsigned NOT NULL COMMENT '记录时间',
  `extcredits1` int(10) NOT NULL COMMENT '积分1变化值',
  `extcredits2` int(10) NOT NULL COMMENT '积分2变化值',
  `extcredits3` int(10) NOT NULL COMMENT '积分3变化值',
  `extcredits4` int(10) NOT NULL COMMENT '积分4变化值',
  `extcredits5` int(10) NOT NULL COMMENT '积分5变化值',
  `extcredits6` int(10) NOT NULL COMMENT '积分6变化值',
  `extcredits7` int(10) NOT NULL COMMENT '积分7变化值',
  `extcredits8` int(10) NOT NULL COMMENT '积分8变化值',
  PRIMARY KEY  (logid),
  KEY `uid` (`uid`),
  KEY `operation` (`operation`),
  KEY `relatedid` (`relatedid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='积分日志表';

DROP TABLE IF EXISTS pre_common_credit_log_field;
CREATE TABLE pre_common_credit_log_field (
  `logid` mediumint(8) unsigned NOT NULL COMMENT 'id',
  `title` varchar(100) NOT NULL COMMENT '记录标题',
  `text` text NOT NULL COMMENT '记录说明',
  KEY logid (logid)
) ENGINE=MyISAM COMMENT='积分日志详情';

DROP TABLE IF EXISTS pre_common_credit_rule_log;
CREATE TABLE pre_common_credit_rule_log (
  clid mediumint(8) unsigned NOT NULL auto_increment COMMENT '策略日志ID',
  uid int(10) unsigned NOT NULL default '0' COMMENT '策略日志所有者uid',
  rid mediumint(8) unsigned NOT NULL default '0' COMMENT '策略ID',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块ID',
  total mediumint(8) unsigned NOT NULL default '0' COMMENT '策略被执行总次数',
  cyclenum mediumint(8) unsigned NOT NULL default '0' COMMENT '周期被执行次数',
  extcredits1 int(10) NOT NULL default '0' COMMENT '扩展1',
  extcredits2 int(10) NOT NULL default '0' COMMENT '扩展2',
  extcredits3 int(10) NOT NULL default '0' COMMENT '扩展3',
  extcredits4 int(10) NOT NULL default '0' COMMENT '扩展4',
  extcredits5 int(10) NOT NULL default '0' COMMENT '扩展5',
  extcredits6 int(10) NOT NULL default '0' COMMENT '扩展6',
  extcredits7 int(10) NOT NULL default '0' COMMENT '扩展7',
  extcredits8 int(10) NOT NULL default '0' COMMENT '扩展8',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '周期开始时间',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '策略最后执行时间',
  PRIMARY KEY  (clid),
  KEY uid (uid,rid, fid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='积分规则日志表';

DROP TABLE IF EXISTS pre_common_credit_rule_log_field;
CREATE TABLE pre_common_credit_rule_log_field (
  clid mediumint(8) unsigned NOT NULL default '0' COMMENT '策略日志ID',
  uid int(10) unsigned NOT NULL default '0' COMMENT '策略日志所有者uid',
  info text NOT NULL COMMENT '记录信息防重',
  `user` text NOT NULL COMMENT '记录用户防重',
  app text NOT NULL COMMENT '记录应用防重',
  PRIMARY KEY  (uid, clid)
) ENGINE=MyISAM COMMENT='积分规则日志扩展表';

DROP TABLE IF EXISTS pre_common_credit_rule;
CREATE TABLE pre_common_credit_rule (
  rid mediumint(8) unsigned NOT NULL auto_increment COMMENT '规则ID',
  rulename varchar(20) NOT NULL default '' COMMENT '规则名称',
  `action` varchar(20) NOT NULL default '' COMMENT '规则action唯一KEY',
  cycletype tinyint(1) NOT NULL default '0' COMMENT '奖励周期0:一次;1:每天;2:整点;3:间隔分钟;4:不限;',
  cycletime int(10) NOT NULL default '0' COMMENT '间隔时间',
  rewardnum tinyint(2) NOT NULL default '1' COMMENT '奖励次数',
  norepeat tinyint(1) NOT NULL default '0' COMMENT '是否去重1：去重;0：不去重',
  extcredits1 int(10) NOT NULL default '0' COMMENT '扩展1',
  extcredits2 int(10) NOT NULL default '0' COMMENT '扩展2',
  extcredits3 int(10) NOT NULL default '0' COMMENT '扩展3',
  extcredits4 int(10) NOT NULL default '0' COMMENT '扩展4',
  extcredits5 int(10) NOT NULL default '0' COMMENT '扩展5',
  extcredits6 int(10) NOT NULL default '0' COMMENT '扩展6',
  extcredits7 int(10) NOT NULL default '0' COMMENT '扩展7',
  extcredits8 int(10) NOT NULL default '0' COMMENT '扩展8',
  fids text NOT NULL COMMENT '记录自定义策略版块ID',
  PRIMARY KEY  (rid),
  UNIQUE KEY `action` (`action`)
) ENGINE=MyISAM COMMENT='积分规则表';

DROP TABLE IF EXISTS pre_common_cron;
CREATE TABLE pre_common_cron (
  cronid smallint(6) unsigned NOT NULL auto_increment COMMENT '计划任务id',
  available tinyint(1) NOT NULL default '0' COMMENT '是否启用',
  `type` enum('user','system','plugin') NOT NULL default 'user' COMMENT '类型',
  `name` char(50) NOT NULL default '' COMMENT '名称',
  filename char(50) NOT NULL default '' COMMENT '对应文件',
  lastrun int(10) unsigned NOT NULL default '0' COMMENT '上次执行时间',
  nextrun int(10) unsigned NOT NULL default '0' COMMENT '下次执行时间',
  weekday tinyint(1) NOT NULL default '0' COMMENT '周计划',
  `day` tinyint(2) NOT NULL default '0' COMMENT '日计划',
  `hour` tinyint(2) NOT NULL default '0' COMMENT '小时计划',
  `minute` char(36) NOT NULL default '' COMMENT '分计划',
  PRIMARY KEY  (cronid),
  KEY nextrun (available,nextrun)
) ENGINE=MyISAM COMMENT='计划任务表';

DROP TABLE IF EXISTS pre_common_domain;
CREATE TABLE pre_common_domain (
  domain char(30) NOT NULL default '' COMMENT '域名前缀',
  domainroot char(60) NOT NULL default '' COMMENT '二级域名后缀',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '对应对象id',
  idtype char(15) NOT NULL default '' COMMENT '对应对象类型subarea:分区、forum:版块、home:个人空间、group:群组、topic:专题、channel:频道、plugin:插件',
  PRIMARY KEY (id, idtype),
  KEY domain (domain, domainroot),
  KEY idtype (idtype)
) ENGINE=MyISAM COMMENT='二级域名表';

DROP TABLE IF EXISTS pre_common_failedlogin;
CREATE TABLE pre_common_failedlogin (
  ip char(15) NOT NULL default '' COMMENT '失败IP',
  username char(32) NOT NULL default '' COMMENT '失败时的用户名',
  count tinyint(1) unsigned NOT NULL default '0' COMMENT '尝试次数',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '最后一次尝试时间',
  PRIMARY KEY  (ip,username)
) ENGINE=MyISAM COMMENT='失败登录表';

DROP TABLE IF EXISTS pre_common_failedip;
CREATE TABLE pre_common_failedip (
  ip char(7) NOT NULL default '' COMMENT '失败IP',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '最后一次尝试时间',
  count tinyint(1) unsigned NOT NULL default '0' COMMENT '尝试次数',
  PRIMARY KEY  (ip, lastupdate),
  KEY lastupdate (lastupdate)
) ENGINE=MyISAM COMMENT='IP段记录表';

DROP TABLE IF EXISTS pre_common_friendlink;
CREATE TABLE pre_common_friendlink (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT 'id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序，正序',
  `name` varchar(100) NOT NULL default '' COMMENT '名称',
  url varchar(255) NOT NULL default '' COMMENT 'url',
  description mediumtext NOT NULL COMMENT '解释说明',
  logo varchar(255) NOT NULL default '' COMMENT 'logo',
  `type` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='友情链接表';

DROP TABLE IF EXISTS pre_common_relatedlink;
CREATE TABLE pre_common_relatedlink (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` varchar(100) NOT NULL default '' COMMENT '名称',
  url varchar(255) NOT NULL default '' COMMENT 'url',
  `extent` tinyint(3) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='关联链接表';

DROP TABLE IF EXISTS pre_common_invite;
CREATE TABLE pre_common_invite (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT 'ID',
  uid int(10) unsigned NOT NULL default '0' COMMENT '邀请人',
  `code` char(20) NOT NULL default '' COMMENT '邀请码',
  fuid int(10) unsigned NOT NULL default '0' COMMENT '受邀人UID',
  fusername char(20) NOT NULL default '' COMMENT '受邀人姓名',
  `type` tinyint(1) NOT NULL default '0' COMMENT '邮件邀请 1是0否',
  email char(40) NOT NULL default '' COMMENT '邀请Email',
  inviteip char(15) NOT NULL default '' COMMENT '邀请IP',
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT '应用ID',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '邀请码生成时间',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '邀请码结束时间',
  regdateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邀请码状态',
  orderid char(32) NOT NULL default '' COMMENT '购买邀请码的订单号id',
  PRIMARY KEY (id),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='邀请表';

DROP TABLE IF EXISTS pre_common_mailcron;
CREATE TABLE pre_common_mailcron (
  cid mediumint(8) unsigned NOT NULL auto_increment,
  touid int(10) unsigned NOT NULL default '0',
  email varchar(100) NOT NULL default '',
  sendtime int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (cid),
  KEY sendtime (sendtime)
) ENGINE=MyISAM COMMENT='邮件计划任务表';

DROP TABLE IF EXISTS pre_common_mailqueue;
CREATE TABLE pre_common_mailqueue (
  qid mediumint(8) unsigned NOT NULL auto_increment,
  cid mediumint(8) unsigned NOT NULL default '0',
  `subject` text NOT NULL,
  message text NOT NULL,
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (qid),
  KEY mcid (cid,dateline)
) ENGINE=MyISAM COMMENT='邮件队列表';

DROP TABLE IF EXISTS pre_common_member;
CREATE TABLE pre_common_member (
  uid int(10) unsigned NOT NULL auto_increment COMMENT '会员id',
  email char(40) NOT NULL default '' COMMENT '邮箱',
  username char(15) NOT NULL default '' COMMENT '用户名',
  `password` char(32) NOT NULL default '' COMMENT '密码',
  `status` tinyint(1) NOT NULL default '0' COMMENT '判断用户是否已经删除 需要discuz程序加判断，并增加整体清理的功能。原home字段为flag',
  emailstatus tinyint(1) NOT NULL default '0' COMMENT 'email是否经过验证 home字段为emailcheck',
  avatarstatus tinyint(1) NOT NULL default '0' COMMENT '是否有头像 home字段为avatar',
  videophotostatus tinyint(1) NOT NULL default '0' COMMENT '视频认证状态 home',
  adminid tinyint(1) NOT NULL default '0' COMMENT '管理员id',
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '会员组id',
  groupexpiry int(10) unsigned NOT NULL default '0' COMMENT '用户组有效期',
  extgroupids char(20) NOT NULL default '' COMMENT '扩展用户组',
  regdate int(10) unsigned NOT NULL default '0' COMMENT '注册时间',
  credits int(10) NOT NULL default '0' COMMENT '总积分',
  notifysound tinyint(1) NOT NULL default '0' COMMENT '短信声音',
  timeoffset char(4) NOT NULL default '' COMMENT '时区校正',
  newpm smallint(6) unsigned NOT NULL default '0' COMMENT '新短消息数量',
  newprompt smallint(6) unsigned NOT NULL default '0' COMMENT '新提醒数目',
  accessmasks tinyint(1) NOT NULL default '0' COMMENT '标志',
  allowadmincp tinyint(1) NOT NULL default '0' COMMENT '标志',
  onlyacceptfriendpm tinyint(1) NOT NULL default '0' COMMENT '是否只接收好友短消息',
  conisbind tinyint(1) unsigned NOT NULL default '0' COMMENT '用户是否绑定QC',
  freeze tinyint(1) NOT NULL default '0' COMMENT '是否冻结',
  PRIMARY KEY  (uid),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `conisbind` (`conisbind`),
  KEY `regdate` (`regdate`)
) ENGINE=MyISAM COMMENT='用户主表';

DROP TABLE IF EXISTS pre_common_member_archive;
CREATE TABLE pre_common_member_archive (
  uid int(10) unsigned NOT NULL auto_increment COMMENT '会员id',
  email char(40) NOT NULL default '' COMMENT '邮箱',
  username char(15) NOT NULL default '' COMMENT '用户名',
  `password` char(32) NOT NULL default '' COMMENT '密码',
  `status` tinyint(1) NOT NULL default '0' COMMENT '判断用户是否已经删除 需要discuz程序加判断，并增加整体清理的功能。原home字段为flag',
  emailstatus tinyint(1) NOT NULL default '0' COMMENT 'email是否经过验证 home字段为emailcheck',
  avatarstatus tinyint(1) NOT NULL default '0' COMMENT '是否有头像 home字段为avatar',
  videophotostatus tinyint(1) NOT NULL default '0' COMMENT '视频认证状态 home',
  adminid tinyint(1) NOT NULL default '0' COMMENT '管理员id',
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '会员组id',
  groupexpiry int(10) unsigned NOT NULL default '0' COMMENT '用户组有效期',
  extgroupids char(20) NOT NULL default '' COMMENT '扩展用户组',
  regdate int(10) unsigned NOT NULL default '0' COMMENT '注册时间',
  credits int(10) NOT NULL default '0' COMMENT '总积分',
  notifysound tinyint(1) NOT NULL default '0' COMMENT '短信声音',
  timeoffset char(4) NOT NULL default '' COMMENT '时区校正',
  newpm smallint(6) unsigned NOT NULL default '0' COMMENT '新短消息数量',
  newprompt smallint(6) unsigned NOT NULL default '0' COMMENT '新提醒数目',
  accessmasks tinyint(1) NOT NULL default '0' COMMENT '标志',
  allowadmincp tinyint(1) NOT NULL default '0' COMMENT '标志',
  onlyacceptfriendpm tinyint(1) NOT NULL default '0' COMMENT '是否只接收好友短消息',
  conisbind tinyint(1) unsigned NOT NULL default '0' COMMENT '用户是否绑定QC',
  freeze tinyint(1) NOT NULL default '0' COMMENT '是否冻结',
  PRIMARY KEY  (uid),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `groupid` (`groupid`),
  KEY `conisbind` (`conisbind`),
  KEY `regdate` (`regdate`)
) ENGINE=MyISAM COMMENT='用户主表存档';

DROP TABLE IF EXISTS pre_common_member_secwhite;
CREATE TABLE pre_common_member_secwhite (
  `uid` int(10) NOT NULL COMMENT '会员id',
  `dateline` int(10) NOT NULL COMMENT '时间',
  PRIMARY KEY (`uid`)
) ENGINE=MEMORY COMMENT='验证码用户白名单表';

DROP TABLE IF EXISTS pre_common_member_newprompt;
CREATE TABLE pre_common_member_newprompt (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  `data` varchar(255) NOT NULL default '' COMMENT 'array(提醒类型=>数量)',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='用户新提醒数量表';

DROP TABLE IF EXISTS pre_common_member_count;
CREATE TABLE pre_common_member_count (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  extcredits1 int(10) NOT NULL default '0' COMMENT '声望',
  extcredits2 int(10) NOT NULL default '0' COMMENT '金钱',
  extcredits3 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits4 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits5 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits6 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits7 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits8 int(10) NOT NULL default '0' COMMENT '扩展',
  friends smallint(6) unsigned NOT NULL default '0' COMMENT '好友个数 home',
  posts mediumint(8) unsigned NOT NULL default '0' COMMENT '帖子数',
  threads mediumint(8) unsigned NOT NULL default '0' COMMENT '主题数',
  digestposts smallint(6) unsigned NOT NULL default '0' COMMENT '精华数',
  doings smallint(6) unsigned NOT NULL default '0' COMMENT '记录数',
  blogs smallint(6) unsigned NOT NULL default '0' COMMENT '日志数',
  albums smallint(6) unsigned NOT NULL default '0' COMMENT '相册数',
  sharings smallint(6) unsigned NOT NULL default '0' COMMENT '分享数',
  attachsize int(10) unsigned NOT NULL default '0' COMMENT '上传附件占用的空间 home',
  views mediumint(8) unsigned NOT NULL default '0' COMMENT '空间查看数',
  oltime smallint(6) unsigned NOT NULL default '0' COMMENT '在线时间',
  todayattachs smallint(6) unsigned NOT NULL default '0' COMMENT '当天上传附件数',
  todayattachsize int(10) unsigned NOT NULL default '0' COMMENT '当天上传附件容量',
  feeds mediumint(8) unsigned NOT NULL default '0' COMMENT '广播数',
  follower mediumint(8) unsigned NOT NULL default '0' COMMENT '听众数量',
  following mediumint(8) unsigned NOT NULL default '0' COMMENT '收听数量',
  newfollower mediumint(8) unsigned NOT NULL default '0' COMMENT '新增听众数量',
  blacklist mediumint(8) unsigned NOT NULL default '0' COMMENT '拉黑用户数',
  PRIMARY KEY  (uid),
  KEY posts (posts)
) ENGINE=MyISAM COMMENT='用户统计表';

DROP TABLE IF EXISTS pre_common_member_count_archive;
CREATE TABLE pre_common_member_count_archive (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  extcredits1 int(10) NOT NULL default '0' COMMENT '声望',
  extcredits2 int(10) NOT NULL default '0' COMMENT '金钱',
  extcredits3 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits4 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits5 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits6 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits7 int(10) NOT NULL default '0' COMMENT '扩展',
  extcredits8 int(10) NOT NULL default '0' COMMENT '扩展',
  friends smallint(6) unsigned NOT NULL default '0' COMMENT '好友个数 home',
  posts mediumint(8) unsigned NOT NULL default '0' COMMENT '帖子数',
  threads mediumint(8) unsigned NOT NULL default '0' COMMENT '主题数',
  digestposts smallint(6) unsigned NOT NULL default '0' COMMENT '精华数',
  doings smallint(6) unsigned NOT NULL default '0' COMMENT '记录数',
  blogs smallint(6) unsigned NOT NULL default '0' COMMENT '日志数',
  albums smallint(6) unsigned NOT NULL default '0' COMMENT '相册数',
  sharings smallint(6) unsigned NOT NULL default '0' COMMENT '分享数',
  attachsize int(10) unsigned NOT NULL default '0' COMMENT '上传附件占用的空间 home',
  views mediumint(8) unsigned NOT NULL default '0' COMMENT '空间查看数',
  oltime smallint(6) unsigned NOT NULL default '0' COMMENT '在线时间',
  todayattachs smallint(6) unsigned NOT NULL default '0' COMMENT '当天上传附件数',
  todayattachsize int(10) unsigned NOT NULL default '0' COMMENT '当天上传附件容量',
  feeds mediumint(8) unsigned NOT NULL default '0' COMMENT '广播数',
  follower mediumint(8) unsigned NOT NULL default '0' COMMENT '听众数量',
  following mediumint(8) unsigned NOT NULL default '0' COMMENT '收听数量',
  newfollower mediumint(8) unsigned NOT NULL default '0' COMMENT '新增听众数量',
  blacklist mediumint(8) unsigned NOT NULL default '0' COMMENT '拉黑用户数',
  PRIMARY KEY  (uid),
  KEY posts (posts)
) ENGINE=MyISAM COMMENT='用户统计表存档';

DROP TABLE IF EXISTS pre_common_member_login;
CREATE TABLE pre_common_member_login (
  `uid` int(10) NOT NULL COMMENT '会员id',
  loginname char(20) NOT NULL default '' COMMENT '登录名',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `loginname` (`loginname`)
) ENGINE=MyISAM COMMENT='用户登录名表';

DROP TABLE IF EXISTS pre_common_member_field_forum;
CREATE TABLE pre_common_member_field_forum (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  publishfeed tinyint(3) NOT NULL default '0' COMMENT '用户自定义发送哪些类型的feed(原字段为customaddfeed)',
  customshow tinyint(1) unsigned NOT NULL default '26' COMMENT '自定义帖子显示模式',
  customstatus varchar(30) NOT NULL default '' COMMENT '自定义头衔',
  medals text NOT NULL COMMENT '勋章信息',
  sightml text NOT NULL COMMENT '签名',
  groupterms text NOT NULL COMMENT '公共用户组',
  authstr varchar(20) NOT NULL default '' COMMENT '找回密码验证串',
  groups mediumtext NOT NULL COMMENT '用户所有群组',
  attentiongroup varchar(255) NOT NULL default '' COMMENT '用户偏好',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='用户论坛字段表';

DROP TABLE IF EXISTS pre_common_member_field_forum_archive;
CREATE TABLE pre_common_member_field_forum_archive (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  publishfeed tinyint(3) NOT NULL default '0' COMMENT '用户自定义发送哪些类型的feed(原字段为customaddfeed)',
  customshow tinyint(1) unsigned NOT NULL default '26' COMMENT '自定义帖子显示模式',
  customstatus varchar(30) NOT NULL default '' COMMENT '自定义头衔',
  medals text NOT NULL COMMENT '勋章信息',
  sightml text NOT NULL COMMENT '签名',
  groupterms text NOT NULL COMMENT '公共用户组',
  authstr varchar(20) NOT NULL default '' COMMENT '找回密码验证串',
  groups mediumtext NOT NULL COMMENT '用户所有群组',
  attentiongroup varchar(255) NOT NULL default '' COMMENT '用户偏好',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='用户论坛字段表存档';

DROP TABLE IF EXISTS pre_common_member_field_home;
CREATE TABLE pre_common_member_field_home (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  videophoto varchar(255) NOT NULL default '' COMMENT '视频认证照片地址 home',
  spacename varchar(255) NOT NULL default '' COMMENT '空间名称',
  spacedescription varchar(255) NOT NULL default '' COMMENT '空间简介',
  `domain` char(15) NOT NULL default '' COMMENT '空间绑定二级域名 home',
  addsize int(10) unsigned NOT NULL default '0' COMMENT '额外授予的上传空间 home',
  addfriend smallint(6) unsigned NOT NULL default '0' COMMENT '额外允许增加的好友数 home',
  menunum smallint(6) unsigned NOT NULL default '0' COMMENT '应用显示个数',
  theme varchar(20) NOT NULL default '' COMMENT '空间风格主题 home',
  spacecss text NOT NULL COMMENT '个人空间自定义css home',
  blockposition text NOT NULL COMMENT '个人空间自定义模块位置及相关参数 home',
  recentnote text NOT NULL COMMENT '最近一次行为记录',
  spacenote text NOT NULL COMMENT '最近一次twitter',
  privacy text NOT NULL COMMENT 'home隐私设置(注意要和论坛发feed等开关的设置结合)',
  feedfriend mediumtext NOT NULL COMMENT '接受feed的好友缓存',
  acceptemail text NOT NULL COMMENT '接受新通知邮件及设置邮件接收参数',
  magicgift text NOT NULL COMMENT '道具红包卡相关信息',
  stickblogs text NOT NULL COMMENT '置顶的日志ID',
  PRIMARY KEY  (uid),
  KEY domain (domain)
) ENGINE=MyISAM COMMENT='用户家园字段表';

DROP TABLE IF EXISTS pre_common_member_field_home_archive;
CREATE TABLE pre_common_member_field_home_archive (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  videophoto varchar(255) NOT NULL default '' COMMENT '视频认证照片地址 home',
  spacename varchar(255) NOT NULL default '' COMMENT '空间名称',
  spacedescription varchar(255) NOT NULL default '' COMMENT '空间简介',
  `domain` char(15) NOT NULL default '' COMMENT '空间绑定二级域名 home',
  addsize int(10) unsigned NOT NULL default '0' COMMENT '额外授予的上传空间 home',
  addfriend smallint(6) unsigned NOT NULL default '0' COMMENT '额外允许增加的好友数 home',
  menunum smallint(6) unsigned NOT NULL default '0' COMMENT '应用显示个数',
  theme varchar(20) NOT NULL default '' COMMENT '空间风格主题 home',
  spacecss text NOT NULL COMMENT '个人空间自定义css home',
  blockposition text NOT NULL COMMENT '个人空间自定义模块位置及相关参数 home',
  recentnote text NOT NULL COMMENT '最近一次行为记录',
  spacenote text NOT NULL COMMENT '最近一次twitter',
  privacy text NOT NULL COMMENT 'home隐私设置(注意要和论坛发feed等开关的设置结合)',
  feedfriend mediumtext NOT NULL COMMENT '接受feed的好友缓存',
  acceptemail text NOT NULL COMMENT '接受新通知邮件及设置邮件接收参数',
  magicgift text NOT NULL COMMENT '道具红包卡相关信息',
  stickblogs text NOT NULL COMMENT '置顶的日志ID',
  PRIMARY KEY  (uid),
  KEY domain (domain)
) ENGINE=MyISAM COMMENT='用户家园字段表存档';

DROP TABLE IF EXISTS pre_common_member_profile;
CREATE TABLE pre_common_member_profile (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  realname varchar(255) NOT NULL default '' COMMENT '实名',
  gender tinyint(1) NOT NULL default '0' COMMENT '性别\n(0:保密 1:男 2:女)',
  birthyear smallint(6) unsigned NOT NULL default '0',
  birthmonth tinyint(3) unsigned NOT NULL default '0',
  birthday tinyint(3) unsigned NOT NULL default '0',
  constellation varchar(255) NOT NULL default '' COMMENT '星座(根据生日自动计算)',
  zodiac varchar(255) NOT NULL default '' COMMENT '生肖(根据生日自动计算)',
  telephone varchar(255) NOT NULL default '' COMMENT '固定电话',
  mobile varchar(255) NOT NULL default '' COMMENT '手机',
  idcardtype varchar(255) NOT NULL default '' COMMENT '证件类型：身份证 护照 军官证等',
  idcard varchar(255) NOT NULL default '' COMMENT '证件号码',
  address varchar(255) NOT NULL default '' COMMENT '邮寄地址',
  zipcode varchar(255) NOT NULL default '' COMMENT '邮编',
  nationality varchar(255) NOT NULL default '' COMMENT '国籍',
  birthprovince varchar(255) NOT NULL default '' COMMENT '出生省份',
  birthcity varchar(255) NOT NULL default '' COMMENT '出生城市',
  birthdist varchar(20) NOT NULL default '' COMMENT '出生行政区/县',
  birthcommunity varchar(255) NOT NULL default '' COMMENT '出生小区',
  resideprovince varchar(255) NOT NULL default '' COMMENT '居住省份',
  residecity varchar(255) NOT NULL default '' COMMENT '居住城市',
  residedist varchar(20) NOT NULL default '' COMMENT '居住行政区/县',
  residecommunity varchar(255) NOT NULL default '' COMMENT '居住小区',
  residesuite varchar(255) NOT NULL default '' COMMENT '小区、写字楼门牌号',
  graduateschool varchar(255) NOT NULL default '' COMMENT '毕业学校',
  company varchar(255) NOT NULL default '' COMMENT ' 公司',
  education varchar(255) NOT NULL default '' COMMENT ' 学历',
  occupation varchar(255) NOT NULL default '' COMMENT ' 职业',
  `position` varchar(255) NOT NULL default '' COMMENT '职位',
  revenue varchar(255) NOT NULL default '' COMMENT ' 年收入',
  affectivestatus varchar(255) NOT NULL default '' COMMENT ' 情感状态',
  lookingfor varchar(255) NOT NULL default '' COMMENT ' 交友目的（交友类型）',
  bloodtype varchar(255) NOT NULL default '' COMMENT '血型',
  height varchar(255) NOT NULL default '' COMMENT ' 身高',
  weight varchar(255) NOT NULL default '' COMMENT ' 体重',
  alipay varchar(255) NOT NULL default '' COMMENT '支付宝帐号',
  icq varchar(255) NOT NULL default '' COMMENT 'ICQ',
  qq varchar(255) NOT NULL default '' COMMENT 'QQ',
  yahoo varchar(255) NOT NULL default '' COMMENT 'YAHOO',
  msn varchar(255) NOT NULL default '' COMMENT 'MSN',
  taobao varchar(255) NOT NULL default '' COMMENT '阿里旺旺',
  site varchar(255) NOT NULL default '' COMMENT '主页',
  bio text NOT NULL COMMENT '自我介绍 来自论坛bio字段',
  interest text NOT NULL COMMENT '兴趣爱好',
  field1 text NOT NULL COMMENT '自定义字段1',
  field2 text NOT NULL COMMENT '自定义字段2',
  field3 text NOT NULL COMMENT '自定义字段3',
  field4 text NOT NULL COMMENT '自定义字段4',
  field5 text NOT NULL COMMENT '自定义字段5',
  field6 text NOT NULL COMMENT '自定义字段6',
  field7 text NOT NULL COMMENT '自定义字段7',
  field8 text NOT NULL COMMENT '自定义字段8',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='用户栏目表';

DROP TABLE IF EXISTS pre_common_member_status;
CREATE TABLE pre_common_member_status (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  regip char(15) NOT NULL default '' COMMENT '注册IP',
  lastip char(15) NOT NULL default '' COMMENT '最后登录IP',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '最后登录端口号',
  lastvisit int(10) unsigned NOT NULL default '0' COMMENT '最后访问',
  lastactivity int(10) unsigned NOT NULL default '0' COMMENT '最后活动',
  lastpost int(10) unsigned NOT NULL default '0' COMMENT '最后发表',
  lastsendmail int(10) unsigned NOT NULL default '0' COMMENT '上次发送email时间 home原字段为lastsend',
  invisible tinyint(1) NOT NULL default '0' COMMENT '是否隐身登录',
  buyercredit smallint(6) NOT NULL default '0' COMMENT '买家信用等级及积分',
  sellercredit smallint(6) NOT NULL default '0' COMMENT '卖家信用等级及积分',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '个人空间收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '个人空间分享次数',
  profileprogress tinyint(2) unsigned NOT NULL default '0' COMMENT '个人资料完成度',
  PRIMARY KEY  (uid),
  KEY lastactivity (lastactivity, invisible)
) ENGINE=MyISAM COMMENT='用户状态表';

DROP TABLE IF EXISTS pre_common_member_status_archive;
CREATE TABLE pre_common_member_status_archive (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  regip char(15) NOT NULL default '' COMMENT '注册IP',
  lastip char(15) NOT NULL default '' COMMENT '最后登录IP',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '最后登录端口号',
  lastvisit int(10) unsigned NOT NULL default '0' COMMENT '最后访问',
  lastactivity int(10) unsigned NOT NULL default '0' COMMENT '最后活动',
  lastpost int(10) unsigned NOT NULL default '0' COMMENT '最后发表',
  lastsendmail int(10) unsigned NOT NULL default '0' COMMENT '上次发送email时间 home原字段为lastsend',
  invisible tinyint(1) NOT NULL default '0' COMMENT '是否隐身登录',
  buyercredit smallint(6) NOT NULL default '0' COMMENT '买家信用等级及积分',
  sellercredit smallint(6) NOT NULL default '0' COMMENT '卖家信用等级及积分',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '个人空间收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '个人空间分享次数',
  profileprogress tinyint(2) unsigned NOT NULL default '0' COMMENT '个人资料完成度',
  PRIMARY KEY  (uid),
  KEY lastactivity (lastactivity, invisible)
) ENGINE=MyISAM COMMENT='用户状态表存档';

DROP TABLE IF EXISTS pre_common_member_stat_field;
CREATE TABLE pre_common_member_stat_field (
  optionid  mediumint(8) unsigned NOT NULL auto_increment COMMENT '资料统计项 id',
  fieldid varchar(255) NOT NULL default '' COMMENT '资料项字段标志符',
  fieldvalue varchar(255) NOT NULL default '' COMMENT '字段值' ,
  hash varchar(255) NOT NULL default '' COMMENT '由fieldid和fieldvalue生成的hash',
  users mediumint(8) unsigned NOT NULL default '0' COMMENT '对应用户数',
  updatetime int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  PRIMARY KEY (optionid),
  KEY fieldid (fieldid)
) ENGINE=MyISAM COMMENT='用户资料统计项';

DROP TABLE IF EXISTS pre_common_member_action_log;
CREATE TABLE pre_common_member_action_log (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '记录id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
  `action` tinyint(5) NOT NULL default '0' COMMENT '操作代码',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY dateline (dateline, `action`, uid)
) ENGINE=MyISAM COMMENT='用户操作日志表';

DROP TABLE IF EXISTS pre_common_member_forum_buylog;
CREATE TABLE pre_common_member_forum_buylog (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  `credits` int(10) unsigned NOT NULL default '0' COMMENT '已付金额',
  PRIMARY KEY  (uid, fid),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='用户版块积分付费记录';

DROP TABLE IF EXISTS pre_common_visit;
CREATE TABLE pre_common_visit (
  `ip` int(10) unsigned NOT NULL default '0' COMMENT '用户IP',
  `view` int(10) unsigned NOT NULL default '0' COMMENT '访问次数',
  PRIMARY KEY  (ip),
  KEY `ip` (`ip`, `view`)
) ENGINE=MEMORY COMMENT='用户访问日志表';

DROP TABLE IF EXISTS pre_home_follow;
CREATE TABLE pre_home_follow (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
  username char(15) NOT NULL default '' COMMENT '用户名',
  followuid int(10) unsigned NOT NULL default '0' COMMENT '被关注用户ID',
  fusername char(15) NOT NULL default '' COMMENT '被关注用户名称',
  bkname varchar(255) NOT NULL default '' COMMENT '用户备注',
  `status` tinyint(1) NOT NULL default '0' COMMENT '0:正常 1:特殊关注 -1:不能再关注此人',
  mutual tinyint(1) NOT NULL default '0' COMMENT '0:单向 1:已互相关注',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (uid, followuid)
) ENGINE=MyISAM COMMENT='用户关注关系表';

DROP TABLE IF EXISTS pre_home_follow_feed;
CREATE TABLE pre_home_follow_feed (
  feedid mediumint(8) unsigned NOT NULL auto_increment COMMENT '自增id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '被关注者ID',
  username varchar(15) NOT NULL default '' COMMENT '被关注用户名',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '帖子tid',
  note text NOT NULL COMMENT '转发理由',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (feedid),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='被关注者事件表';

DROP TABLE IF EXISTS pre_home_follow_feed_archiver;
CREATE TABLE pre_home_follow_feed_archiver (
  feedid mediumint(8) unsigned NOT NULL auto_increment COMMENT '自增id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '被关注者ID',
  username varchar(15) NOT NULL default '' COMMENT '被关注用户名',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '帖子tid',
  note text NOT NULL COMMENT '转发理由',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (feedid),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='被关注者事件存档';

DROP TABLE IF EXISTS pre_common_member_log;
CREATE TABLE pre_common_member_log (
  uid int(10) unsigned NOT NULL default '0',
  `action` char(10) NOT NULL default '' COMMENT 'add,update,delete',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (uid)
) ENGINE=MyISAM COMMENT='漫游用户日志表';

DROP TABLE IF EXISTS pre_common_member_verify;
CREATE TABLE pre_common_member_verify (
  uid int(10) unsigned NOT NULL COMMENT '会员id',
  verify1 tinyint(1) NOT NULL default '0' COMMENT '认证1: -1:被拒绝 0:待审核 1:审核通过',
  verify2 tinyint(1) NOT NULL default '0' COMMENT '认证2: -1:被拒绝 0:待审核 1:审核通过',
  verify3 tinyint(1) NOT NULL default '0' COMMENT '认证3: -1:被拒绝 0:待审核 1:审核通过',
  verify4 tinyint(1) NOT NULL default '0' COMMENT '认证4: -1:被拒绝 0:待审核 1:审核通过',
  verify5 tinyint(1) NOT NULL default '0' COMMENT '认证5: -1:被拒绝 0:待审核 1:审核通过',
  verify6 tinyint(1) NOT NULL default '0' COMMENT '实名认证: -1:被拒绝 0:待审核 1:审核通过',
  verify7 tinyint(1) NOT NULL default '0' COMMENT '视频认证: -1:被拒绝 0:待审核 1:审核通过',
  PRIMARY KEY (uid),
  KEY verify1 (verify1),
  KEY verify2 (verify2),
  KEY verify3 (verify3),
  KEY verify4 (verify4),
  KEY verify5 (verify5),
  KEY verify6 (verify6),
  KEY verify7 (verify7)
) ENGINE=MyISAM COMMENT='用户认证表';

DROP TABLE IF EXISTS pre_common_member_verify_info;
CREATE TABLE pre_common_member_verify_info (
  vid mediumint(8) unsigned NOT NULL auto_increment COMMENT '审核id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username varchar(30) NOT NULL default '' COMMENT '用户名',
  verifytype tinyint(1) NOT NULL default '0' COMMENT '审核类型0:资料审核, 1:认证1, 2:认证2, 3:认证3, 4:认证4, 5:认证5',
  flag tinyint(1) NOT NULL default '0' COMMENT '-1:被拒绝 0:待审核 1:审核通过',
  field text NOT NULL COMMENT '序列化存储变化值',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '提交日期',
  PRIMARY KEY (vid),
  KEY verifytype (verifytype, flag),
  KEY uid (uid, verifytype, dateline)
) ENGINE=MyISAM COMMENT='个人信息修改审核';

DROP TABLE IF EXISTS pre_common_member_profile_setting;
CREATE TABLE pre_common_member_profile_setting (
  fieldid varchar(255) NOT NULL default '' COMMENT 'profile字段标志符',
  available tinyint(1) NOT NULL default '0' COMMENT '是否可用',
  invisible tinyint(1) NOT NULL default '0' COMMENT '是否隐藏',
  needverify tinyint(1) NOT NULL default '0' COMMENT '是否需要审核',
  title varchar(255) NOT NULL default '' COMMENT '栏目标题',
  description varchar(255) NOT NULL default '' COMMENT '解释说明',
  displayorder smallint(6) unsigned NOT NULL default '0' COMMENT '显示顺序',
  required tinyint(1) NOT NULL default '0' COMMENT '是否必填内容',
  unchangeable tinyint(1) NOT NULL default '0' COMMENT '不可修改',
  showincard tinyint(1) NOT NULL default '0' COMMENT '在名片中显示',
  showinthread tinyint(1) NOT NULL default '0' COMMENT '在帖子中显示',
  showinregister tinyint(1) NOT NULL default '0' COMMENT '是否在注册页面显示',
  allowsearch tinyint(1) NOT NULL default '0' COMMENT '是否可搜索',
  formtype varchar(255) NOT NULL COMMENT '表单元素类型',
  size smallint(6) unsigned NOT NULL default '0' COMMENT '内容最大长度',
  choices text NOT NULL COMMENT '选填内容',
  validate text NOT NULL COMMENT '验证数据的正则表达式',
  PRIMARY KEY  (fieldid)
) ENGINE=MyISAM  COMMENT='个人信息扩展表';

DROP TABLE IF EXISTS pre_common_member_profile_setting_archive;
CREATE TABLE pre_common_member_profile_setting_archive (
  fieldid varchar(255) NOT NULL default '' COMMENT 'profile字段标志符',
  available tinyint(1) NOT NULL default '0' COMMENT '是否可用',
  invisible tinyint(1) NOT NULL default '0' COMMENT '是否隐藏',
  needverify tinyint(1) NOT NULL default '0' COMMENT '是否需要审核',
  title varchar(255) NOT NULL default '' COMMENT '栏目标题',
  description varchar(255) NOT NULL default '' COMMENT '解释说明',
  displayorder smallint(6) unsigned NOT NULL default '0' COMMENT '显示顺序',
  required tinyint(1) NOT NULL default '0' COMMENT '是否必填内容',
  unchangeable tinyint(1) NOT NULL default '0' COMMENT '不可修改',
  showincard tinyint(1) NOT NULL default '0' COMMENT '在名片中显示',
  showinthread tinyint(1) NOT NULL default '0' COMMENT '在帖子中显示',
  showinregister tinyint(1) NOT NULL default '0' COMMENT '是否在注册页面显示',
  allowsearch tinyint(1) NOT NULL default '0' COMMENT '是否可搜索',
  formtype varchar(255) NOT NULL COMMENT '表单元素类型',
  size smallint(6) unsigned NOT NULL default '0' COMMENT '内容最大长度',
  choices text NOT NULL COMMENT '选填内容',
  validate text NOT NULL COMMENT '验证数据的正则表达式',
  PRIMARY KEY  (fieldid)
) ENGINE=MyISAM  COMMENT='个人信息扩展表存档';

DROP TABLE IF EXISTS pre_common_member_security;
CREATE TABLE pre_common_member_security (
  securityid mediumint(8) unsigned NOT NULL auto_increment COMMENT '审核项id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username varchar(255) NOT NULL default '' COMMENT '用户名',
  fieldid varchar(255) NOT NULL default '' COMMENT 'profile字段标志符',
  oldvalue text NOT NULL COMMENT '旧的profile字段值',
  newvalue text NOT NULL COMMENT '新的profile字段值',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '提交日期',
  PRIMARY KEY  (securityid),
  KEY uid (uid, fieldid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='个人信息修改审核';

DROP TABLE IF EXISTS pre_common_member_validate;
CREATE TABLE pre_common_member_validate (
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  submitdate int(10) unsigned NOT NULL default '0' COMMENT '提交日期',
  moddate int(10) unsigned NOT NULL default '0' COMMENT '审核日期',
  admin varchar(15) NOT NULL default '' COMMENT '管理员名',
  submittimes tinyint(3) unsigned NOT NULL default '0' COMMENT '提交的次数',
  `status` tinyint(1) NOT NULL default '0' COMMENT '状态',
  message text NOT NULL COMMENT '注册原因',
  remark text NOT NULL COMMENT '管理员留言',
  PRIMARY KEY  (uid),
  KEY `status` (`status`)
) ENGINE=MyISAM COMMENT='用户审核表';

DROP TABLE IF EXISTS pre_common_member_crime;
CREATE TABLE pre_common_member_crime (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '自增id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '被惩罚操作的用户id',
  operatorid mediumint(8) unsigned NOT NULL default '0' COMMENT '进行惩罚操作的用户id',
  operator varchar(15) NOT NULL COMMENT '进行惩罚操作的用户名',
  `action` tinyint(5) NOT NULL COMMENT '惩罚行为',
  reason text NOT NULL COMMENT '惩罚理由',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '惩罚操作时间',
  PRIMARY KEY  (cid),
  KEY uid (uid,`action`,dateline)
) ENGINE=MyISAM COMMENT='用户惩罚操作表';

DROP TABLE IF EXISTS pre_common_member_grouppm;
CREATE TABLE pre_common_member_grouppm (
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  gpmid smallint(6) unsigned NOT NULL auto_increment COMMENT '消息id',
  status tinyint(1) NOT NULL default '0' COMMENT '0=未读 1=已读 -1=删除',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '阅读时间',
  PRIMARY KEY  (uid, gpmid)
) ENGINE=MyISAM COMMENT='群发短消息用户记录表';

DROP TABLE IF EXISTS pre_common_grouppm;
CREATE TABLE pre_common_grouppm (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '消息id',
  authorid int(10) unsigned NOT NULL default '0' COMMENT '作者id',
  author varchar(15) NOT NULL default '' COMMENT '作者姓名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '时间',
  message text NOT NULL COMMENT '消息',
  numbers mediumint(8) unsigned NOT NULL default '0' COMMENT '数量',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='群发短消息表';

DROP TABLE IF EXISTS pre_common_myinvite;
CREATE TABLE pre_common_myinvite (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '邀请id',
  typename varchar(100) NOT NULL default '' COMMENT '邀请名称',
  appid mediumint(8) NOT NULL default '0' COMMENT '应用id',
  `type` tinyint(1) NOT NULL default '0' COMMENT '类型(request 邀请/invite 请求)',
  fromuid int(10) unsigned NOT NULL default '0' COMMENT '邀请者id',
  touid int(10) unsigned NOT NULL default '0' COMMENT '接收者id',
  myml text NOT NULL COMMENT '邀请内容',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发送邀请的时间戳',
  `hash` int(10) unsigned NOT NULL default '0' COMMENT 'hash标记',
  PRIMARY KEY  (id),
  KEY `hash` (`hash`),
  KEY uid (touid,dateline)
) ENGINE=MyISAM COMMENT='用户邀请表';

DROP TABLE IF EXISTS pre_common_nav;
CREATE TABLE pre_common_nav (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '项目id',
  parentid smallint(6) unsigned NOT NULL default '0' COMMENT '父 id(navtype=0)',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  title varchar(255) NOT NULL COMMENT '导航说明',
  url varchar(255) NOT NULL COMMENT '导航链接',
  identifier varchar(255) NOT NULL COMMENT '链接标识/相关ID',
  target tinyint(1) NOT NULL default '0' COMMENT '目标框架\n(0:本窗口 1:新窗口)',
  `type` tinyint(1) NOT NULL default '0' COMMENT '类型 0 系统  1 自定义 3 插件 4 频道 5 版块',
  available tinyint(1) NOT NULL default '0' COMMENT '是否可用',
  displayorder tinyint(3) NOT NULL COMMENT '显示顺序',
  highlight tinyint(1) NOT NULL default '0' COMMENT '样式(navtype=0)',
  `level` tinyint(1) NOT NULL default '0' COMMENT '使用等级\n(0:游客 1:会员 2:版主 3:管理员)',
  `subtype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '二级导航样式(navtype=0) 顶部导航位置(navtype=4)',
  `subcols` tinyint(1) NOT NULL DEFAULT '0' COMMENT '横排一行显示的条目数(navtype=0)',
  `icon` varchar(255) NOT NULL COMMENT '图标地址(navtype=1、3)',
  `subname` varchar(255) NOT NULL COMMENT '副导航名称(navtype=1)',
  `suburl` varchar(255) NOT NULL COMMENT '副导航地址(navtype=1)',
  `navtype` tinyint(1) NOT NULL default '0' COMMENT '导航类型\n(0:主导航 1:底部导航 2:家园导航 3:快捷导航 4:顶部导航)',
  logo varchar(255) NOT NULL COMMENT '自定义 Logo',
  PRIMARY KEY  (id),
  KEY `navtype` (`navtype`)
) ENGINE=MyISAM COMMENT='自定义导航栏表';

DROP TABLE IF EXISTS pre_common_onlinetime;
CREATE TABLE pre_common_onlinetime (
  uid int(10) unsigned NOT NULL DEFAULT '0',
  thismonth smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '本月在线时间',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总在线时间',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (uid)
) ENGINE=MyISAM COMMENT='在线时间表';

DROP TABLE IF EXISTS pre_common_regip;
CREATE TABLE pre_common_regip (
  ip char(15) NOT NULL default '' COMMENT 'IP地址',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '限制时间',
  count smallint(6) NOT NULL default '0' COMMENT '限制数量',
  KEY ip (ip)
) ENGINE=MyISAM COMMENT='注册IP限制表';

DROP TABLE IF EXISTS pre_common_secquestion;
CREATE TABLE pre_common_secquestion (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '验证问题id',
  `type` tinyint(1) unsigned NOT NULL COMMENT '验证问题类型',
  question text NOT NULL COMMENT '验证问题',
  answer varchar(255) NOT NULL COMMENT '问题答案',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='验证问题数据表';

DROP TABLE IF EXISTS pre_common_session;
CREATE TABLE pre_common_session (
  sid char(6) NOT NULL default '' COMMENT 'sid',
  ip1 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP段',
  ip2 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP段',
  ip3 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP段',
  ip4 tinyint(3) unsigned NOT NULL default '0' COMMENT 'IP段',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username char(15) NOT NULL default '' COMMENT '会员名',
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '会员组',
  invisible tinyint(1) NOT NULL default '0' COMMENT '是否隐身登录',
  `action` tinyint(1) unsigned NOT NULL default '0' COMMENT '当前动作',
  lastactivity int(10) unsigned NOT NULL default '0' COMMENT '最后活动时间',
  lastolupdate int(10) unsigned NOT NULL default '0' COMMENT '在线时间最后更新',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  UNIQUE KEY sid (sid),
  KEY uid (uid)
) ENGINE=MEMORY COMMENT='会员认证表';

DROP TABLE IF EXISTS pre_common_setting;
CREATE TABLE pre_common_setting (
  skey varchar(255) NOT NULL default '' COMMENT '变量名',
  svalue text NOT NULL COMMENT '值',
  PRIMARY KEY  (skey)
) ENGINE=MyISAM COMMENT='设置表';

DROP TABLE IF EXISTS pre_common_smiley;
CREATE TABLE pre_common_smiley (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '表情id',
  typeid smallint(6) unsigned NOT NULL COMMENT '表情分类 id',
  displayorder tinyint(1) NOT NULL default '0' COMMENT '显示顺序',
  `type` enum('smiley','stamp','stamplist') NOT NULL default 'smiley' COMMENT '类型',
  `code` varchar(30) NOT NULL default '' COMMENT '标记',
  url varchar(30) NOT NULL default '' COMMENT '路径',
  PRIMARY KEY  (id),
  KEY `type` (`type`, displayorder)
) ENGINE=MyISAM COMMENT='表情表';

DROP TABLE IF EXISTS pre_common_stat;
CREATE TABLE pre_common_stat (
  daytime int(10) unsigned NOT NULL default '0' COMMENT '时间',
  login int(10) unsigned NOT NULL default '0' COMMENT '登陆',
  mobilelogin int(10) unsigned NOT NULL default '0' COMMENT '手机登陆',
  connectlogin int(10) unsigned NOT NULL default '0' COMMENT 'QQConnect登陆',
  register int(10) unsigned NOT NULL default '0' COMMENT '注册',
  invite int(10) unsigned NOT NULL default '0' COMMENT '邀请',
  appinvite int(10) unsigned NOT NULL default '0' COMMENT '应用邀请',
  doing int(10) unsigned NOT NULL default '0' COMMENT '记录',
  blog int(10) unsigned NOT NULL default '0' COMMENT '日志',
  pic int(10) unsigned NOT NULL default '0' COMMENT '图片',
  poll int(10) unsigned NOT NULL default '0' COMMENT '投票',
  activity int(10) unsigned NOT NULL default '0' COMMENT '活动',
  `share` int(10) unsigned NOT NULL default '0' COMMENT '分享',
  thread int(10) unsigned NOT NULL default '0' COMMENT '主题',
  docomment int(10) unsigned NOT NULL default '0' COMMENT '记录评论',
  blogcomment int(10) unsigned NOT NULL default '0' COMMENT '日志评论',
  piccomment int(10) unsigned NOT NULL default '0' COMMENT '图片评论',
  sharecomment int(10) unsigned NOT NULL default '0' COMMENT '分享评论',
  reward int(10) unsigned NOT NULL default '0' COMMENT '悬赏',
  debate int(10) unsigned NOT NULL default '0' COMMENT '辩论',
  trade int(10) unsigned NOT NULL default '0' COMMENT '商品',
  `group` int(10) unsigned NOT NULL default '0' COMMENT '群组',
  groupjoin int(10) unsigned NOT NULL default '0' COMMENT '参与群组',
  groupthread int(10) unsigned NOT NULL default '0' COMMENT '群组主题',
  grouppost int(10) unsigned NOT NULL default '0' COMMENT '群组回复',
  post int(10) unsigned NOT NULL default '0' COMMENT '主题回复',
  wall int(10) unsigned NOT NULL default '0' COMMENT '留言',
  poke int(10) unsigned NOT NULL default '0' COMMENT '打招呼',
  click int(10) unsigned NOT NULL default '0' COMMENT '表态',
  sendpm int(10) unsigned NOT NULL default '0' COMMENT '发送PM',
  friend int(10) unsigned NOT NULL default '0' COMMENT '成为好友',
  addfriend int(10) unsigned NOT NULL default '0' COMMENT '好友请求',
  PRIMARY KEY  (daytime)
) ENGINE=MyISAM COMMENT='趋势统计';

DROP TABLE IF EXISTS pre_common_statuser;
CREATE TABLE pre_common_statuser (
  uid int(10) unsigned NOT NULL default '0',
  daytime int(10) unsigned NOT NULL default '0',
  `type` char(20) NOT NULL default '' COMMENT '各种用户行为如：invite、register、login...',
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='统计用户表';

DROP TABLE IF EXISTS pre_common_style;
CREATE TABLE pre_common_style (
  styleid smallint(6) unsigned NOT NULL auto_increment COMMENT '风格id',
  `name` varchar(20) NOT NULL default '' COMMENT '风格名称',
  available tinyint(1) NOT NULL default '1' COMMENT '风格是否可用',
  templateid smallint(6) unsigned NOT NULL default '0' COMMENT '对应模板id',
  extstyle varchar(255) NOT NULL default '' COMMENT '配色',
  PRIMARY KEY  (styleid)
) ENGINE=MyISAM COMMENT='风格表';

DROP TABLE IF EXISTS pre_common_stylevar;
CREATE TABLE pre_common_stylevar (
  stylevarid smallint(6) unsigned NOT NULL auto_increment COMMENT '风格变量id',
  styleid smallint(6) unsigned NOT NULL default '0' COMMENT '风格id',
  variable text NOT NULL COMMENT '变量名',
  substitute text NOT NULL COMMENT '变量赋值',
  PRIMARY KEY  (stylevarid),
  KEY styleid (styleid)
) ENGINE=MyISAM COMMENT='风格变量表';

DROP TABLE IF EXISTS pre_common_syscache;
CREATE TABLE pre_common_syscache (
  cname varchar(32) NOT NULL COMMENT '缓存名称',
  `ctype` tinyint(3) unsigned NOT NULL COMMENT '缓存类型 0=value, serialize=1',
  dateline int(10) unsigned NOT NULL COMMENT '缓存生成时间',
  `data` mediumblob NOT NULL COMMENT '缓存数据',
  PRIMARY KEY  (cname)
) ENGINE=MyISAM COMMENT='缓存数据表';

DROP TABLE IF EXISTS pre_common_template;
CREATE TABLE pre_common_template (
  templateid smallint(6) unsigned NOT NULL auto_increment COMMENT '模板id',
  `name` varchar(30) NOT NULL default '' COMMENT '名称',
  `directory` varchar(100) NOT NULL default '' COMMENT '目录',
  copyright varchar(100) NOT NULL default '' COMMENT '版权',
  PRIMARY KEY  (templateid)
) ENGINE=MyISAM COMMENT='模板表';

DROP TABLE IF EXISTS pre_common_usergroup;
CREATE TABLE pre_common_usergroup (
  groupid smallint(6) unsigned NOT NULL auto_increment COMMENT '会员组id',
  radminid tinyint(3) NOT NULL default '0' COMMENT '关联关管理组',
  `type` enum('system','special','member') NOT NULL default 'member' COMMENT '类型',
  system varchar(255) NOT NULL default 'private' COMMENT '会员是否可以自由进出',
  grouptitle varchar(255) NOT NULL default '' COMMENT '组头衔',
  creditshigher int(10) NOT NULL default '0' COMMENT '该组的积分上限',
  creditslower int(10) NOT NULL default '0' COMMENT '该组的积分下限',
  stars tinyint(3) NOT NULL default '0' COMMENT '星星数量',
  color varchar(255) NOT NULL default '' COMMENT '组头衔颜色',
  icon varchar(255) NOT NULL default '',
  allowvisit tinyint(1) NOT NULL default '0' COMMENT '允许访问',
  allowsendpm tinyint(1) NOT NULL default '1' COMMENT '是否允许发送短信息',
  allowinvite tinyint(1) NOT NULL default '0' COMMENT '允许使用邀请注册',
  allowmailinvite tinyint(1) NOT NULL default '0' COMMENT '允许通过论坛邮件系统发送邀请码',
  maxinvitenum tinyint(3) unsigned NOT NULL default '0' COMMENT '最大邀请码拥有数量',
  inviteprice smallint(6) unsigned NOT NULL default '0' COMMENT '邀请码购买价格',
  maxinviteday smallint(6) unsigned NOT NULL default '0' COMMENT '邀请码有效期',
  PRIMARY KEY  (groupid),
  KEY creditsrange (creditshigher,creditslower)
) ENGINE=MyISAM COMMENT='用户组表';

DROP TABLE IF EXISTS pre_common_usergroup_field;
CREATE TABLE pre_common_usergroup_field (
  groupid smallint(6) unsigned NOT NULL COMMENT '会员组id',
  readaccess tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  allowpost tinyint(1) NOT NULL default '0' COMMENT '允许发帖',
  allowreply tinyint(1) NOT NULL default '0' COMMENT '允许回复',
  allowpostpoll tinyint(1) NOT NULL default '0' COMMENT '允许发表投票',
  allowpostreward tinyint(1) NOT NULL default '0' COMMENT '允许发表悬赏',
  allowposttrade tinyint(1) NOT NULL default '0' COMMENT '允许发表交易',
  allowpostactivity tinyint(1) NOT NULL default '0' COMMENT '允许发表活动',
  allowdirectpost tinyint(1) NOT NULL default '0' COMMENT '是否需要审核',
  allowgetattach tinyint(1) NOT NULL default '0' COMMENT '允许下载附件',
  allowgetimage tinyint(1) NOT NULL default '0' COMMENT '允许查看图片',
  allowpostattach tinyint(1) NOT NULL default '0' COMMENT '允许上传附件',
  allowpostimage tinyint(1) NOT NULL default '0' COMMENT '允许上传图片',
  allowvote tinyint(1) NOT NULL default '0' COMMENT '允许参与投票',
  allowsearch tinyint(1) NOT NULL default '0' COMMENT '允许搜索',
  allowcstatus tinyint(1) NOT NULL default '0' COMMENT '允许自定义头衔',
  allowinvisible tinyint(1) NOT NULL default '0' COMMENT '允许隐身登录',
  allowtransfer tinyint(1) NOT NULL default '0' COMMENT '允许积分转帐',
  allowsetreadperm tinyint(1) NOT NULL default '0' COMMENT '允许设置阅读权限',
  allowsetattachperm tinyint(1) NOT NULL default '0' COMMENT '允许设置附件权限',
  allowposttag tinyint(1) NOT NULL default '0' COMMENT '允许使用标签',
  allowhidecode tinyint(1) NOT NULL default '0' COMMENT '允许使用hide代码',
  allowhtml tinyint(1) NOT NULL default '0' COMMENT '允许使用html',
  allowanonymous tinyint(1) NOT NULL default '0' COMMENT '允许匿名发帖',
  allowsigbbcode tinyint(1) NOT NULL default '0' COMMENT '允许签名使用bbcode',
  allowsigimgcode tinyint(1) NOT NULL default '0' COMMENT '允许使用img',
  allowmagics tinyint(1) unsigned NOT NULL COMMENT '允许使用道具',
  disableperiodctrl tinyint(1) NOT NULL default '0' COMMENT '不受时间段限制',
  reasonpm tinyint(1) NOT NULL default '0' COMMENT '操作理由短信通知作者',
  maxprice smallint(6) unsigned NOT NULL default '0' COMMENT '主题最大售价',
  maxsigsize smallint(6) unsigned NOT NULL default '0' COMMENT '最大签名尺寸',
  maxattachsize int(10) unsigned NOT NULL default '0' COMMENT '最大附件尺寸',
  maxsizeperday int(10) unsigned NOT NULL default '0' COMMENT '每天最大附件总尺寸',
  maxthreadsperhour tinyint(3) unsigned NOT NULL default '0' COMMENT '每小时发主题数限制',
  maxpostsperhour tinyint(3) unsigned NOT NULL default '0' COMMENT '每小时发回帖数限制',
  attachextensions char(100) NOT NULL default '' COMMENT '允许发表的附件类型',
  raterange char(150) NOT NULL default '' COMMENT '评分范围',
  loginreward char(150) NOT NULL default '' COMMENT '每日打卡奖励',
  mintradeprice smallint(6) unsigned NOT NULL default '1' COMMENT '交易最小积分',
  maxtradeprice smallint(6) unsigned NOT NULL default '0' COMMENT '交易最大积分',
  minrewardprice smallint(6) unsigned NOT NULL default '1' COMMENT '悬赏最小积分',
  maxrewardprice smallint(6) unsigned NOT NULL default '0' COMMENT '悬赏最大积分',
  magicsdiscount tinyint(1) NOT NULL COMMENT '道具折扣',
  maxmagicsweight smallint(6) unsigned NOT NULL COMMENT '道具负载最大值',
  allowpostdebate tinyint(1) NOT NULL default '0' COMMENT '允许发表辩论',
  tradestick tinyint(1) unsigned NOT NULL COMMENT '可商品推荐数',
  exempt tinyint(1) unsigned NOT NULL COMMENT '用户组表达式',
  maxattachnum smallint(6) NOT NULL default '0' COMMENT '最大每天附件数量',
  allowposturl tinyint(1) NOT NULL default '3' COMMENT '是否允许发送含 url 内容',
  allowrecommend tinyint(1) unsigned NOT NULL default '1' COMMENT '是否允许评价主题',
  allowpostrushreply TINYINT(1) NOT NULL DEFAULT '0' COMMENT '允许发表抢楼帖',
  maxfriendnum smallint(6) unsigned NOT NULL default '0' COMMENT '最多好友数',
  maxspacesize int(10) unsigned NOT NULL default '0' COMMENT '空间大小',
  allowcomment tinyint(1) NOT NULL default '0' COMMENT '发表留言/评论',
  allowcommentarticle smallint(6) NOT NULL default '0' COMMENT '发表文章的评论',
  searchinterval smallint(6) unsigned NOT NULL default '0' COMMENT '两次搜索操作间隔',
  searchignore tinyint(1) NOT NULL default '0' COMMENT '是否免费搜索',
  allowblog tinyint(1) NOT NULL default '0' COMMENT '发表日志',
  allowdoing tinyint(1) NOT NULL default '0' COMMENT '发表记录',
  allowupload tinyint(1) NOT NULL default '0' COMMENT '上传图片',
  allowshare tinyint(1) NOT NULL default '0' COMMENT '发布分享',
  allowblogmod tinyint(1) unsigned NOT NULL default '0' COMMENT '发表日志需要审核',
  allowdoingmod tinyint(1) unsigned NOT NULL default '0' COMMENT '发表记录需要审核',
  allowuploadmod tinyint(1) unsigned NOT NULL default '0' COMMENT '上传图片需要审核',
  allowsharemod tinyint(1) unsigned NOT NULL default '0' COMMENT '发布分享需要审核',
  allowcss tinyint(1) NOT NULL default '0' COMMENT '允许自定义CSS',
  allowpoke tinyint(1) NOT NULL default '0' COMMENT '允许打招呼',
  allowfriend tinyint(1) NOT NULL default '0' COMMENT '允许加好友',
  allowclick tinyint(1) NOT NULL default '0' COMMENT '允许表态',
  allowmagic tinyint(1) NOT NULL default '0' COMMENT '允许使用道具',
  allowstat tinyint(1) NOT NULL default '0' COMMENT '允许查看趋势统计',
  allowstatdata tinyint(1) NOT NULL default '0' COMMENT '允许查看统计数据报表',
  videophotoignore tinyint(1) NOT NULL default '0' COMMENT '视频认证限制',
  allowviewvideophoto tinyint(1) NOT NULL default '0' COMMENT '允许查看视频认证',
  allowmyop tinyint(1) NOT NULL default '0' COMMENT '允许使用应用',
  magicdiscount tinyint(1) NOT NULL default '0' COMMENT '购买道具折扣',
  domainlength smallint(6) unsigned NOT NULL default '0' COMMENT '二级域名最短长度',
  seccode tinyint(1) NOT NULL default '1' COMMENT '发布操作需填验证码',
  disablepostctrl tinyint(1) NOT NULL DEFAULT '0' COMMENT '发表是否受防灌水限制',
  allowbuildgroup tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许建立群组，0为不允许',
  allowgroupdirectpost tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许直接在群组中发帖',
  allowgroupposturl tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否允许在群组中发站外URL',
  edittimelimit smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '编辑帖子时间限制',
  allowpostarticle tinyint(1) NOT NULL default '0' COMMENT '允许发布文章',
  allowdownlocalimg tinyint(1) NOT NULL default '0' COMMENT '允许下载本地图片',
  allowdownremoteimg tinyint(1) NOT NULL default '0' COMMENT '允许下载远程图片',
  allowpostarticlemod tinyint(1) unsigned NOT NULL default '0' COMMENT '发布文章是否需要审核',
  allowspacediyhtml tinyint(1) NOT NULL default '0' COMMENT '允许自定义模块使用HTML',
  allowspacediybbcode tinyint(1) NOT NULL default '0' COMMENT '允许自定义模块使用BBCODE',
  allowspacediyimgcode tinyint(1) NOT NULL default '0' COMMENT '允许自定义模块使用[img]',
  allowcommentpost tinyint(1) NOT NULL default '2' COMMENT '允许帖子点评 0:禁止 1:楼主 2:回复 3:All',
  allowcommentitem tinyint(1) NOT NULL default '0' COMMENT '允许发表点评观点',
  allowcommentreply tinyint(1) NOT NULL default '0' COMMENT '允许发表回复点评',
  allowreplycredit tinyint(1) NOT NULL default '0' COMMENT '允许设置回帖奖励',
  ignorecensor tinyint(1) unsigned NOT NULL default '0' COMMENT '是否忽略要审核的关键字',
  allowsendallpm tinyint(1) unsigned NOT NULL default '0' COMMENT '是否不受“只接收好友短消息”设置的限制',
  allowsendpmmaxnum smallint(6) unsigned NOT NULL default '0' COMMENT '24小时内允许发短消息的数量',
  maximagesize mediumint(8) unsigned NOT NULL default '0' COMMENT '相册中允许最大图片大小',
  allowmediacode tinyint(1) NOT NULL default '0' COMMENT '允许使用多媒体代码',
  allowbegincode tinyint(1) unsigned NOT NULL default '0' COMMENT '允许使用开头动画代码',
  allowat smallint(6) unsigned NOT NULL default '0' COMMENT '允许@用户 0：禁止 n:发帖时@的数量',
  allowsetpublishdate tinyint(1) unsigned NOT NULL default '0' COMMENT '允许定时发布主题',
  allowfollowcollection tinyint(1) unsigned NOT NULL default '0' COMMENT '允许关注淘专辑数',
  allowcommentcollection tinyint(1) unsigned NOT NULL default '0' COMMENT '允许评论淘专辑',
  allowcreatecollection smallint(6) unsigned NOT NULL default '0' COMMENT '允许创建淘专辑数',
  forcesecques tinyint(1) unsigned NOT NULL default '0' COMMENT '强制设置安全提问才能进入后台管理',
  forcelogin tinyint(1) unsigned NOT NULL default '0' COMMENT '强制登录方式',
  closead tinyint(1) unsigned NOT NULL default '0' COMMENT '是否展示广告',
  buildgroupcredits smallint(6) unsigned NOT NULL default '0' COMMENT '创建群组需要消耗的积分',
  allowimgcontent tinyint(1) unsigned NOT NULL default '0' COMMENT '允许主题内容生成图片',
  PRIMARY KEY  (groupid)
) ENGINE=MyISAM COMMENT='会员用户组权限表';

DROP TABLE IF EXISTS pre_common_word;
CREATE TABLE pre_common_word (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '词汇id',
  admin varchar(15) NOT NULL default '' COMMENT '管理员名',
  type smallint(6) NOT NULL default '1' COMMENT '关键词分类',
  find varchar(255) NOT NULL default '' COMMENT '不良词语',
  replacement varchar(255) NOT NULL default '' COMMENT '替换内容',
  extra varchar(255) NOT NULL default '',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='词语过滤表';

DROP TABLE IF EXISTS pre_common_word_type;
CREATE TABLE pre_common_word_type (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '词语过滤分类id',
  typename varchar(15) NOT NULL default '' COMMENT '分类名称',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='词语过滤分类';

DROP TABLE IF EXISTS pre_common_tag;
CREATE TABLE pre_common_tag (
  tagid mediumint(8) unsigned NOT NULL auto_increment COMMENT '标签id',
  tagname char(20) NOT NULL default '' COMMENT '标签名',
  status tinyint(1) NOT NULL default '0' COMMENT '显示状态\n(0:正常 1:关闭 2:推荐 3:用户标签)',
  PRIMARY KEY  (tagid),
  KEY tagname (tagname),
  KEY status (status, tagid)
) ENGINE=MyISAM COMMENT='标签表';

DROP TABLE IF EXISTS pre_common_tagitem;
CREATE TABLE pre_common_tagitem (
  tagid mediumint(8) unsigned NOT NULL default '0' COMMENT '标签id',
  itemid mediumint(8) unsigned NOT NULL default '0' COMMENT 'itemid',
  idtype char(10) NOT NULL default '' COMMENT '内容类型',
  UNIQUE KEY item (tagid, itemid, idtype),
  KEY idtype (idtype, itemid)
) ENGINE=MyISAM COMMENT='标签内容表';

DROP TABLE IF EXISTS pre_forum_access;
CREATE TABLE pre_forum_access (
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  allowview tinyint(1) NOT NULL default '0' COMMENT '允许浏览',
  allowpost tinyint(1) NOT NULL default '0' COMMENT '允许发表',
  allowreply tinyint(1) NOT NULL default '0' COMMENT '允许回复',
  allowgetattach tinyint(1) NOT NULL default '0' COMMENT '允许下载附件',
  allowgetimage tinyint(1) NOT NULL default '0' COMMENT '允许查看图片',
  allowpostattach tinyint(1) NOT NULL default '0' COMMENT '允许上传附件',
  allowpostimage tinyint(1) NOT NULL default '0' COMMENT '允许上传图片',
  adminuser mediumint(8) unsigned NOT NULL default '0' COMMENT '管理员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '时间',
  PRIMARY KEY  (uid,fid),
  KEY listorder (fid,dateline)
) ENGINE=MyISAM COMMENT='访问权限表';

DROP TABLE IF EXISTS pre_forum_activity;
CREATE TABLE pre_forum_activity (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题图片id',
  cost mediumint(8) unsigned NOT NULL default '0' COMMENT '每人花销',
  starttimefrom int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  starttimeto int(10) unsigned NOT NULL default '0' COMMENT '结束时间',
  place varchar(255) NOT NULL default '' COMMENT '地点',
  class varchar(255) NOT NULL default '' COMMENT '类别',
  gender tinyint(1) NOT NULL default '0' COMMENT '性别',
  number smallint(5) unsigned NOT NULL default '0' COMMENT '人数',
  applynumber smallint(5) unsigned NOT NULL default '0' COMMENT '已参加人数',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '报名截止日期',
  ufield TEXT NOT NULL COMMENT '用户定制项目',
  credit smallint(6) unsigned NOT NULL default '0' COMMENT '需消耗的积分',
  PRIMARY KEY  (tid),
  KEY uid (uid,starttimefrom),
  KEY starttimefrom (starttimefrom),
  KEY expiration (expiration),
  KEY applynumber (applynumber)
) ENGINE=MyISAM COMMENT='活动表';

DROP TABLE IF EXISTS pre_forum_activityapply;
CREATE TABLE pre_forum_activityapply (
  applyid int(10) unsigned NOT NULL auto_increment COMMENT '申请id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  username varchar(255) NOT NULL default '' COMMENT '用户名',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  message varchar(255) NOT NULL default '' COMMENT '消息',
  verified tinyint(1) NOT NULL default '0' COMMENT '是否审核通过\n(0:N 1:Y 2:需完善资料)',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '申请时间',
  payment mediumint(8) NOT NULL default '0' COMMENT '每人花销',
  ufielddata TEXT NOT NULL COMMENT '用户定制项目数据',
  PRIMARY KEY  (applyid),
  KEY uid (uid),
  KEY tid (tid),
  KEY dateline (tid,dateline)
) ENGINE=MyISAM COMMENT='活动申请表';

DROP TABLE IF EXISTS pre_forum_announcement;
CREATE TABLE pre_forum_announcement (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '公告id',
  author varchar(15) NOT NULL default '' COMMENT '作者姓名',
  `subject` varchar(255) NOT NULL default '' COMMENT '公告标题',
  `type` tinyint(1) NOT NULL default '0' COMMENT '公告类型\n(0:文字公告 1:网址链接)',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '结束时间',
  message text NOT NULL COMMENT '消息',
  groups text NOT NULL COMMENT '接受用户组',
  PRIMARY KEY  (id),
  KEY timespan (starttime,endtime)
) ENGINE=MyISAM COMMENT='公告表';

DROP TABLE IF EXISTS pre_forum_threadimage;
CREATE TABLE pre_forum_threadimage (
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  KEY tid (tid)
) ENGINE=MyISAM COMMENT='主题图片表';

DROP TABLE IF EXISTS pre_forum_attachment;
CREATE TABLE pre_forum_attachment (
  aid mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  tableid tinyint(1) unsigned NOT NULL default '0' COMMENT '附件表id',
  downloads mediumint(8) NOT NULL default '0' COMMENT '下载次数',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件索引表';

DROP TABLE IF EXISTS pre_forum_attachment_exif;
CREATE TABLE pre_forum_attachment_exif (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  exif text NOT NULL COMMENT 'exif信息',
  PRIMARY KEY (aid)
) ENGINE=MyISAM COMMENT='Exif缓存表';

DROP TABLE IF EXISTS pre_forum_attachment_unused;
CREATE TABLE pre_forum_attachment_unused (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  PRIMARY KEY (aid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='未使用附件表';

DROP TABLE IF EXISTS pre_forum_attachment_0;
CREATE TABLE pre_forum_attachment_0 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_1;
CREATE TABLE pre_forum_attachment_1 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_2;
CREATE TABLE pre_forum_attachment_2 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_3;
CREATE TABLE pre_forum_attachment_3 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_4;
CREATE TABLE pre_forum_attachment_4 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_5;
CREATE TABLE pre_forum_attachment_5 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_6;
CREATE TABLE pre_forum_attachment_6 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_7;
CREATE TABLE pre_forum_attachment_7 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_8;
CREATE TABLE pre_forum_attachment_8 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachment_9;
CREATE TABLE pre_forum_attachment_9 (
  aid mediumint(8) unsigned NOT NULL COMMENT '附件id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  description varchar(255) NOT NULL COMMENT '说明',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) unsigned NOT NULL default '0' COMMENT '附件价格',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  picid mediumint(8) NOT NULL default '0' COMMENT '相册图片ID ',
  PRIMARY KEY (aid),
  KEY tid (tid),
  KEY pid (pid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='附件表';

DROP TABLE IF EXISTS pre_forum_attachtype;
CREATE TABLE pre_forum_attachtype (
  id smallint(6) unsigned NOT NULL auto_increment COMMENT '类型id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  extension char(12) NOT NULL default '' COMMENT '扩展名',
  maxsize int(10) unsigned NOT NULL default '0' COMMENT '允许上传最大值',
  PRIMARY KEY  (id),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='附件类型表';

DROP TABLE IF EXISTS pre_forum_bbcode;
CREATE TABLE pre_forum_bbcode (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '代码id',
  available tinyint(1) NOT NULL default '0' COMMENT '是否启用\n(0:不启用 1:启用但不显示 2:启用并显示)',
  tag varchar(100) NOT NULL default '' COMMENT '标签',
  icon varchar(255) NOT NULL COMMENT '图标',
  replacement text NOT NULL COMMENT '替换内容',
  example varchar(255) NOT NULL default '' COMMENT '例子',
  explanation text NOT NULL COMMENT '解释说明',
  params tinyint(1) unsigned NOT NULL default '1' COMMENT '参数个数',
  prompt text NOT NULL COMMENT '标签描述',
  nest tinyint(3) unsigned NOT NULL default '1' COMMENT '嵌套层次',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  perm text NOT NULL COMMENT '有权使用的用户组',
  PRIMARY KEY  (id)
) ENGINE=MyISAM COMMENT='Discuz! 代码表';

DROP TABLE IF EXISTS pre_forum_creditslog;
CREATE TABLE pre_forum_creditslog (
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  fromto char(15) NOT NULL default '' COMMENT '来自/到',
  sendcredits tinyint(1) NOT NULL default '0' COMMENT '转出积分字段',
  receivecredits tinyint(1) NOT NULL default '0' COMMENT '接受积分字段',
  send int(10) unsigned NOT NULL default '0' COMMENT '转出积分',
  receive int(10) unsigned NOT NULL default '0' COMMENT '接受积分',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '转帐日期',
  operation char(3) NOT NULL default '' COMMENT '操作',
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='转帐记录表';

DROP TABLE IF EXISTS pre_forum_debate;
CREATE TABLE pre_forum_debate (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '发起人id',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '结束时间',
  affirmdebaters mediumint(8) unsigned NOT NULL default '0' COMMENT '正方辩论人数',
  negadebaters mediumint(8) unsigned NOT NULL default '0' COMMENT '反方辩论人数',
  affirmvotes mediumint(8) unsigned NOT NULL default '0' COMMENT '正方得票数',
  negavotes mediumint(8) unsigned NOT NULL default '0' COMMENT '反方得票数',
  umpire varchar(15) NOT NULL default '' COMMENT '裁判用户名',
  winner tinyint(1) NOT NULL default '0' COMMENT '获胜方\n(0:平局 1:为正方 2:为反方)\n裁判评判结果',
  bestdebater varchar(50) NOT NULL default '' COMMENT '最佳辩手用户名',
  affirmpoint text NOT NULL COMMENT '正方观点',
  negapoint text NOT NULL COMMENT '反方观点',
  umpirepoint text NOT NULL COMMENT '裁判观点，裁判结束辩论时填写',
  affirmvoterids text NOT NULL COMMENT '正方投票人的 id 集合',
  negavoterids text NOT NULL COMMENT '反方投票人的 id 集合',
  affirmreplies mediumint(8) unsigned NOT NULL COMMENT '正方回复次数，用来翻页',
  negareplies mediumint(8) unsigned NOT NULL COMMENT '反方回复次数，用来翻页',
  PRIMARY KEY  (tid),
  KEY uid (uid,starttime)
) ENGINE=MyISAM COMMENT='辩论主题表';

DROP TABLE IF EXISTS pre_forum_debatepost;
CREATE TABLE pre_forum_debatepost (
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  stand tinyint(1) NOT NULL default '0' COMMENT '立场\n(0:中立 1:正方 2:为反方)',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '发起人id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表的时间',
  voters mediumint(10) unsigned NOT NULL default '0' COMMENT '投票人数',
  voterids text NOT NULL COMMENT '投票人的 id 集合',
  PRIMARY KEY  (pid),
  KEY pid (pid,stand),
  KEY tid (tid,uid)
) ENGINE=MyISAM COMMENT='辩论帖子表';

DROP TABLE IF EXISTS pre_forum_faq;
CREATE TABLE pre_forum_faq (
  id smallint(6) NOT NULL auto_increment COMMENT '帮助id',
  fpid smallint(6) unsigned NOT NULL default '0' COMMENT '帮助父id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '排序',
  identifier varchar(20) NOT NULL COMMENT '帮助标识',
  keyword varchar(50) NOT NULL COMMENT '帮助关键词',
  title varchar(50) NOT NULL COMMENT '帮助标题',
  message text NOT NULL COMMENT '帮助内容',
  PRIMARY KEY  (id),
  KEY displayplay (displayorder)
) ENGINE=MyISAM COMMENT='论坛帮助表';

DROP TABLE IF EXISTS pre_forum_postcache;
CREATE TABLE pre_forum_postcache (
  pid int(10) unsigned NOT NULL,
  comment text NOT NULL COMMENT '点评内容缓存',
  rate text NOT NULL COMMENT '评分情况缓存',
  dateline int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='论坛帖子缓存表';

DROP TABLE IF EXISTS pre_home_favorite;
CREATE TABLE pre_home_favorite (
  favid mediumint(8) unsigned NOT NULL auto_increment COMMENT '收藏id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  id mediumint(8) unsigned NOT NULL default '0',
  idtype varchar(255) NOT NULL default '',
  spaceuid int(10) unsigned NOT NULL default '0' COMMENT '空间会员id',
  title varchar(255) NOT NULL default '' COMMENT '标题',
  description text NOT NULL COMMENT '简介',
  dateline int(10) unsigned NOT NULL default '0',
  PRIMARY KEY (favid),
  KEY idtype (id,idtype),
  KEY uid (uid,idtype,dateline)
) ENGINE=MyISAM COMMENT='收藏表';

DROP TABLE IF EXISTS pre_forum_forum;
CREATE TABLE pre_forum_forum (
  fid mediumint(8) unsigned NOT NULL auto_increment COMMENT '论坛id',
  fup mediumint(8) unsigned NOT NULL default '0' COMMENT '上级论坛id',
  `type` enum('group','forum','sub') NOT NULL default 'forum' COMMENT '类型\n(group:分类 forum:普通论坛 sub:子论坛)',
  `name` char(50) NOT NULL default '' COMMENT '名称',
  `status` tinyint(1) NOT NULL default '0' COMMENT '显示状态\n(0:隐藏 1:正常 3:群组)',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  styleid smallint(6) unsigned NOT NULL default '0' COMMENT '风格id',
  threads mediumint(8) unsigned NOT NULL default '0' COMMENT '主题数量',
  posts mediumint(8) unsigned NOT NULL default '0' COMMENT '帖子数量',
  todayposts mediumint(8) unsigned NOT NULL default '0' COMMENT '今日发帖数量',
  yesterdayposts mediumint(8) unsigned NOT NULL default '0' COMMENT '昨日发帖数量',
  rank smallint(6) unsigned NOT NULL default '0' COMMENT '排名',
  oldrank smallint(6) unsigned NOT NULL default '0' COMMENT '前天排名',
  lastpost char(110) NOT NULL default '' COMMENT '最后发表',
  `domain` char(15) NOT NULL default '' COMMENT '绑定的二级域名',
  allowsmilies tinyint(1) NOT NULL default '0' COMMENT '允许使用表情',
  allowhtml tinyint(1) NOT NULL default '0' COMMENT '允许使用html',
  allowbbcode tinyint(1) NOT NULL default '0' COMMENT '允许bbcode',
  allowimgcode tinyint(1) NOT NULL default '0' COMMENT '允许img',
  allowmediacode tinyint(1) NOT NULL default '0' COMMENT '允许使用多媒体代码',
  allowanonymous tinyint(1) NOT NULL default '0' COMMENT '允许匿名',
  allowpostspecial smallint(6) unsigned NOT NULL default '0' COMMENT '允许发表特殊主题',
  allowspecialonly tinyint(1) unsigned NOT NULL default '0' COMMENT '只允许发表特殊主题',
  allowappend tinyint(1) unsigned NOT NULL default '0' COMMENT '是否开启帖子补充',
  alloweditrules tinyint(1) NOT NULL default '0' COMMENT '允许版主修改论坛规则',
  allowfeed tinyint(1) NOT NULL default '1' COMMENT '允许推送动态,默认推送广播',
  allowside tinyint(1) NOT NULL default '0' COMMENT '显示边栏',
  recyclebin tinyint(1) NOT NULL default '0' COMMENT '是否启用回收站',
  modnewposts tinyint(1) NOT NULL default '0' COMMENT '是否审核发帖',
  jammer tinyint(1) NOT NULL default '0' COMMENT '是否启用干扰码',
  disablewatermark tinyint(1) NOT NULL default '0' COMMENT '是否图片附件增加水印',
  inheritedmod tinyint(1) NOT NULL default '0' COMMENT '本论坛或分类版主的权力继承到下级论坛',
  autoclose smallint(6) NOT NULL default '0' COMMENT '自动关闭主题',
  forumcolumns tinyint(3) unsigned NOT NULL default '0' COMMENT '增加论坛水平横排设置',
  catforumcolumns tinyint(3) unsigned NOT NULL default '0' COMMENT '增加分区版块水平横排设置',
  threadcaches tinyint(1) NOT NULL default '0' COMMENT '主题缓存功能设置',
  alloweditpost tinyint(1) unsigned NOT NULL default '1' COMMENT '允许编辑帖子',
  `simple` tinyint(1) unsigned NOT NULL default '0' COMMENT '只显示子版块',
  modworks tinyint(1) unsigned NOT NULL default '0' COMMENT '本版有待处理的管理事项',
  allowglobalstick tinyint(1) NOT NULL default '1' COMMENT '是否显示全局置顶',
  `level` smallint(6) NOT NULL default '0' COMMENT '群组等级',
  commoncredits int(10) unsigned NOT NULL default '0' COMMENT '群组公共积分',
  `archive` tinyint(1) NOT NULL default '0' COMMENT '是否有存档表',
  recommend smallint(6) unsigned NOT NULL default '0' COMMENT '推荐到的版块',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '版块或群组的收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '版块或群组的分享次数',
  disablethumb tinyint(1) NOT NULL default '0' COMMENT '是否添加缩略图',
  disablecollect tinyint(1) NOT NULL default '0' COMMENT '禁止淘帖',
  PRIMARY KEY  (fid),
  KEY forum (`status`,`type`,displayorder),
  KEY fup_type (`fup`,`type`,displayorder),
  KEY fup (fup)
) ENGINE=MyISAM COMMENT='版块表';

DROP TABLE IF EXISTS pre_forum_forumfield;
CREATE TABLE pre_forum_forumfield (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块id',
  description text NOT NULL COMMENT '解释说明',
  `password` varchar(12) NOT NULL default '' COMMENT '私密论坛密码',
  icon varchar(255) NOT NULL default '' COMMENT '图标',
  redirect varchar(255) NOT NULL default '' COMMENT 'URL转发',
  attachextensions varchar(255) NOT NULL default '' COMMENT '允许上传附件类型',
  creditspolicy mediumtext NOT NULL COMMENT '版块积分策略',
  formulaperm text NOT NULL COMMENT '版块权限表达式',
  moderators text NOT NULL COMMENT '版主列表，格式:admin',
  rules text NOT NULL COMMENT '版块规则',
  threadtypes text NOT NULL COMMENT '主题分类，序列化存放的设置，格式为一个数组',
  threadsorts text NOT NULL COMMENT '分类信息，序列化存放的设置，格式为一个数组',
  viewperm text NOT NULL COMMENT '阅读权限, 格式:	1	4	5',
  postperm text NOT NULL COMMENT '发表权限, 格式:	1	4	5',
  replyperm text NOT NULL COMMENT '回复权限, 格式:	1	4	5',
  getattachperm text NOT NULL COMMENT '下载附件权限, 格式:	1	4	5',
  postattachperm text NOT NULL COMMENT '上传附件权限, 格式:	1	4	5',
  postimageperm text NOT NULL COMMENT '上传图片权限, 格式:	1	4	5',
  spviewperm text NOT NULL COMMENT '不受限于版权权限表达式, 格式:	1	4	5',
  seotitle text NOT NULL COMMENT '版块seo标题',
  keywords text NOT NULL COMMENT '版块seo关键词',
  seodescription text NOT NULL COMMENT '版块seo描述',
  supe_pushsetting text NOT NULL COMMENT 'supe推送设置，序列化存放设置数据，格式为一个数组。',
  modrecommend text NOT NULL COMMENT '版主推荐规则',
  threadplugin text NOT NULL COMMENT '特殊主题插件数据',
  replybg text NOT NULL COMMENT '回复框背景',
  extra TEXT NOT NULL,
  jointype tinyint(1) NOT NULL default '0' COMMENT '加入群组方式 -1为关闭，0为公开， 2邀请',
  gviewperm tinyint(1) unsigned NOT NULL default '0' COMMENT '群组浏览权限 0:仅成员 1:所有用户',
  membernum smallint(6) unsigned NOT NULL default '0' COMMENT '群组成员数',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '群组创建时间',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '群组最后更新时间',
  activity int(10) unsigned NOT NULL default '0' COMMENT '群组活跃度',
  founderuid int(10) unsigned NOT NULL default '0' COMMENT '群组创始人UID',
  foundername varchar(255) NOT NULL default '' COMMENT '群组创始人名称',
  banner varchar(255) NOT NULL default '' COMMENT '群组头图片',
  groupnum smallint(6) unsigned NOT NULL default '0' COMMENT '分类下的群组数量',
  commentitem TEXT NOT NULL,
  relatedgroup TEXT NOT NULL,
  picstyle tinyint(1) NOT NULL default '0' COMMENT '帖子列表是否以图片形式显示 0:否 1:是',
  widthauto tinyint(1) NOT NULL default '0' COMMENT '默认是否宽屏 0:全局 -1:宽屏 1:窄屏',
  noantitheft tinyint(1) NOT NULL default '0' COMMENT '禁止防采集',
  noforumhidewater tinyint(1) NOT NULL default '0' COMMENT '禁止隐藏水帖',
  noforumrecommend tinyint(1) NOT NULL default '0' COMMENT '禁止推荐回复',
  livetid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块直播帖tid',
  price mediumint(8) unsigned NOT NULL default '0' COMMENT '进入版块所需支付的积分',
  PRIMARY KEY  (fid),
  KEY membernum (membernum),
  KEY dateline (dateline),
  KEY lastupdate (lastupdate),
  KEY activity (activity)
) ENGINE=MyISAM COMMENT='版块扩展表';

DROP TABLE IF EXISTS pre_forum_forum_threadtable;
CREATE TABLE pre_forum_forum_threadtable (
  `fid` smallint(6) unsigned NOT NULL COMMENT '版块id',
  `threadtableid` smallint(6) unsigned NOT NULL COMMENT 'thread分区id',
  `threads` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  `posts` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '帖子数',
  PRIMARY KEY (`fid`,`threadtableid`)
) ENGINE=MyISAM COMMENT='版块存档信息';

DROP TABLE IF EXISTS pre_forum_forumrecommend;
CREATE TABLE pre_forum_forumrecommend (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块id',
  tid mediumint(8) unsigned NOT NULL COMMENT '帖子id',
  typeid smallint(6) NOT NULL COMMENT '是否含有附件图片',
  displayorder tinyint(1) NOT NULL COMMENT '推荐顺序',
  `subject` char(80) NOT NULL COMMENT '推荐主题标题',
  author char(15) NOT NULL COMMENT '推荐主题作者',
  authorid int(10) NOT NULL COMMENT '推荐主题作者id',
  moderatorid mediumint(8) NOT NULL COMMENT '推荐管理人员id',
  expiration int(10) unsigned NOT NULL COMMENT '推荐主题有效期',
  position tinyint(1) NOT NULL default '0' COMMENT '显示位置',
  highlight tinyint(1) NOT NULL default '0' COMMENT '高亮颜色',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '附件ID',
  filename char(100) NOT NULL default '' COMMENT '附件文件',
  PRIMARY KEY  (tid),
  KEY displayorder (fid,displayorder),
  KEY position (position)
) ENGINE=MyISAM COMMENT='版主推荐表';

DROP TABLE IF EXISTS pre_forum_imagetype;
CREATE TABLE pre_forum_imagetype (
  typeid smallint(6) unsigned NOT NULL auto_increment COMMENT '分类id',
  available tinyint(1) NOT NULL default '0' COMMENT '是否启用',
  `name` char(20) NOT NULL COMMENT '分类名称',
  `type` enum('smiley','icon','avatar') NOT NULL default 'smiley' COMMENT '分类类型\n(smiley:表情 icon:图标 avatar:头像)',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '分类顺序',
  `directory` char(100) NOT NULL COMMENT '图片目录',
  PRIMARY KEY  (typeid)
) ENGINE=MyISAM COMMENT='图片 表情 头像等 分类';

DROP TABLE IF EXISTS pre_forum_medal;
CREATE TABLE pre_forum_medal (
  medalid smallint(6) unsigned NOT NULL auto_increment COMMENT '勋章id',
  `name` varchar(50) NOT NULL default '' COMMENT '勋章名称',
  available tinyint(1) NOT NULL default '0' COMMENT '是否启用',
  image varchar(255) NOT NULL default '' COMMENT '勋章图片',
  `type` tinyint(1) NOT NULL default '0' COMMENT '勋章类型',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '勋章显示顺序',
  description varchar(255) NOT NULL COMMENT '勋章描述',
  expiration smallint(6) unsigned NOT NULL default '0' COMMENT '勋章有效期',
  permission mediumtext NOT NULL COMMENT '勋章获得条件表达式',
  `credit` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '勋章购买使用积分',
  `price` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '勋章价格',
  PRIMARY KEY  (medalid),
  KEY displayorder (displayorder),
  KEY `available` (`available`,`displayorder`)
) ENGINE=MyISAM COMMENT='勋章表';

DROP TABLE IF EXISTS pre_forum_medallog;
CREATE TABLE pre_forum_medallog (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '记录id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '勋章拥有着用户id',
  medalid smallint(6) unsigned NOT NULL default '0' COMMENT '勋章id',
  `type` tinyint(1) NOT NULL default '0' COMMENT '勋章类型id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '颁发时间id',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '有效期id',
  `status` tinyint(1) NOT NULL default '0' COMMENT '勋章状态id',
  PRIMARY KEY  (id),
  KEY `type` (`type`),
  KEY `status` (`status`,expiration),
  KEY uid (uid,medalid,`type`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='勋章日志表';

DROP TABLE IF EXISTS pre_common_member_magic;
CREATE TABLE pre_common_member_magic (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户uid',
  magicid smallint(6) unsigned NOT NULL default '0' COMMENT '道具id',
  num smallint(6) unsigned NOT NULL default '0' COMMENT '拥有数量',
   PRIMARY KEY (uid,magicid)
) ENGINE=MyISAM COMMENT='用户道具数据表';

DROP TABLE IF EXISTS pre_common_member_medal;
CREATE TABLE pre_common_member_medal (
  uid int(10) unsigned NOT NULL,
  medalid smallint(6) unsigned NOT NULL,
  PRIMARY KEY (uid,medalid)
) ENGINE=MyISAM COMMENT='用户勋章数据表';

DROP TABLE IF EXISTS pre_forum_memberrecommend;
CREATE TABLE pre_forum_memberrecommend (
  tid mediumint(8) unsigned NOT NULL COMMENT '主题ID',
  recommenduid int(10) unsigned NOT NULL COMMENT '推荐会员ID',
  dateline int(10) unsigned NOT NULL COMMENT '推荐时间',
  KEY tid (tid),
  KEY uid (recommenduid)
) ENGINE=MyISAM COMMENT='用户推荐表';

DROP TABLE IF EXISTS pre_forum_moderator;
CREATE TABLE pre_forum_moderator (
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  inherited tinyint(1) NOT NULL default '0' COMMENT '是否继承',
  PRIMARY KEY  (uid,fid)
) ENGINE=MyISAM COMMENT='版主表';

DROP TABLE IF EXISTS pre_forum_modwork;
CREATE TABLE pre_forum_modwork (
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  modaction char(3) NOT NULL default '' COMMENT '动作',
  dateline date NOT NULL default '2006-01-01' COMMENT '时间段',
  count smallint(6) unsigned NOT NULL default '0' COMMENT '登录次数',
  posts smallint(6) unsigned NOT NULL default '0' COMMENT '发表数',
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='论坛管理统计表';

DROP TABLE IF EXISTS pre_common_mytask;
CREATE TABLE pre_common_mytask (
  uid int(10) unsigned NOT NULL COMMENT '用户Uid',
  username char(15) NOT NULL default '' COMMENT '用户名',
  taskid smallint(6) unsigned NOT NULL COMMENT '任务id',
  `status` tinyint(1) NOT NULL default '0' COMMENT '任务状态\n(-1:失败 0:进行中 1:已完成)',
  csc char(255) NOT NULL default '' COMMENT '任务进度',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '申请任务时间',
  PRIMARY KEY  (uid,taskid),
  KEY parter (taskid,dateline)
) ENGINE=MyISAM COMMENT='我的任务表';

DROP TABLE IF EXISTS pre_forum_onlinelist;
CREATE TABLE pre_forum_onlinelist (
  groupid smallint(6) unsigned NOT NULL default '0' COMMENT '会员组id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  title varchar(30) NOT NULL default '' COMMENT '组名称',
  url varchar(30) NOT NULL default '' COMMENT '图例URL'
) ENGINE=MyISAM COMMENT='在线列表定制';

DROP TABLE IF EXISTS pre_forum_order;
CREATE TABLE pre_forum_order (
  orderid char(32) NOT NULL default '' COMMENT '订单号id',
  `status` char(3) NOT NULL default '' COMMENT '状态',
  buyer char(50) NOT NULL default '' COMMENT '购买者姓名',
  admin char(15) NOT NULL default '' COMMENT '补单管理员姓名',
  uid int(10) unsigned NOT NULL default '0' COMMENT '购买者id',
  amount int(10) unsigned NOT NULL default '0' COMMENT '数量',
  price float(7,2) unsigned NOT NULL default '0.00' COMMENT '价格',
  submitdate int(10) unsigned NOT NULL default '0' COMMENT '提交日期',
  confirmdate int(10) unsigned NOT NULL default '0' COMMENT '确认日期',
  email char(40) NOT NULL default '' COMMENT '购买时的Email',
  ip char(15) NOT NULL default '' COMMENT '购买时的IP',
  UNIQUE KEY orderid (orderid),
  KEY submitdate (submitdate),
  KEY uid (uid,submitdate)
) ENGINE=MyISAM COMMENT='订单信息表';


DROP TABLE IF EXISTS pre_forum_groupfield;
CREATE TABLE pre_forum_groupfield (
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '群组关联fid',
  privacy tinyint(1) unsigned NOT NULL default '0' COMMENT '群组隐私设置',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '缓存生成时间',
  type varchar(255) NOT NULL COMMENT '缓存类型',
  data text NOT NULL COMMENT '缓存数据',
  UNIQUE KEY types (fid,type),
  KEY fid (fid),
  KEY type (type)
) ENGINE = MyISAM COMMENT='群组扩展信息缓存';

DROP TABLE IF EXISTS pre_forum_groupinvite;
CREATE TABLE pre_forum_groupinvite (
  fid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '群组id',
  uid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '邀请人id',
  inviteuid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '被邀请人id',
  dateline INT( 10 ) UNSIGNED NOT NULL default '0' COMMENT '邀请时间',
  UNIQUE KEY ids (fid,inviteuid),
  KEY dateline (dateline)
) ENGINE = MYISAM COMMENT='群组邀请';

DROP TABLE IF EXISTS pre_forum_groupuser;
CREATE TABLE pre_forum_groupuser (
  fid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '群组关联fid',
  uid MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '成员id',
  username CHAR( 15 ) NOT NULL COMMENT '成员名',
  level TINYINT( 3 ) UNSIGNED NOT NULL default '0' COMMENT '成员等级\n(0:待审核 1:群主 2:副群主 3:明星成员 4:普通成员)',
  threads MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '成员主题数',
  replies MEDIUMINT( 8 ) UNSIGNED NOT NULL default '0' COMMENT '成员回复数',
  joindateline INT( 10 ) UNSIGNED NOT NULL default '0' COMMENT '成员加入群组时间',
  lastupdate INT( 10 ) UNSIGNED NOT NULL default '0' COMMENT '成员最后活动时间',
  privacy TINYINT( 1 ) UNSIGNED NOT NULL default '0' COMMENT '成员隐私设置',
  PRIMARY KEY (fid,uid),
  KEY uid_lastupdate (uid,lastupdate),
  KEY userlist (fid,level,lastupdate)
) ENGINE = MYISAM COMMENT='群组成员';

DROP TABLE IF EXISTS pre_common_plugin;
CREATE TABLE pre_common_plugin (
  `pluginid` smallint(6) unsigned NOT NULL auto_increment COMMENT '插件id',
  `catid` smallint(6) NOT NULL DEFAULT '0' COMMENT '分类id',
  `available` tinyint(1) NOT NULL default '0' COMMENT '是否启用',
  `adminid` tinyint(1) unsigned NOT NULL default '0' COMMENT '管理员id',
  `name` varchar(40) NOT NULL default '' COMMENT '名称',
  `identifier` varchar(40) NOT NULL default '' COMMENT '唯一标识符',
  `description` varchar(255) NOT NULL default '' COMMENT '解释说明',
  `copyright` varchar(100) NOT NULL default '' COMMENT '版权信息',
  `modules` text NOT NULL COMMENT '插件信息',
  `tempcat` text NOT NULL COMMENT '原始分类信息',
  `version` varchar(20) NOT NULL default '' COMMENT '插件版本',
  `way` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '安装方式',
  `displayorder` int(10) NOT NULL DEFAULT '0' COMMENT '后台显示顺序',
  PRIMARY KEY  (`pluginid`),
  UNIQUE KEY `identifier` (`identifier`),
  KEY `catid` (`catid`),
  KEY `displayorder` (`displayorder`)
) ENGINE=MyISAM COMMENT='插件表';

DROP TABLE IF EXISTS pre_common_plugincat;
CREATE TABLE pre_common_plugincat (
  `catid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序',
  `catcode` varchar(40) NOT NULL COMMENT '分类唯一标识符',
  `catname` varchar(50) NOT NULL COMMENT '分类名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用',
  PRIMARY KEY (`catid`),
  KEY `status` (`status`),
  KEY `catecode` (`catcode`)
) ENGINE=MyISAM COMMENT='插件分类表';

DROP TABLE IF EXISTS pre_common_pluginvar;
CREATE TABLE pre_common_pluginvar (
  pluginvarid mediumint(8) unsigned NOT NULL auto_increment COMMENT '插件变量id',
  pluginid smallint(6) unsigned NOT NULL default '0' COMMENT '插件id',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  title varchar(100) NOT NULL default '' COMMENT '名称',
  description varchar(255) NOT NULL default '' COMMENT '解释说明',
  variable varchar(40) NOT NULL default '' COMMENT '变量名',
  `type` varchar(20) NOT NULL default 'text' COMMENT '类型',
  `value` text NOT NULL COMMENT '值',
  extra text NOT NULL COMMENT '附加',
  PRIMARY KEY  (pluginvarid),
  KEY pluginid (pluginid)
) ENGINE=MyISAM COMMENT='插件变量表';

DROP TABLE IF EXISTS pre_common_remote_port;
CREATE TABLE pre_common_remote_port (
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '对象id',
  idtype char(15) NOT NULL default '' COMMENT '对象类型post:帖子、blog:日志、pic:相册',
  useip char(15) NOT NULL default '' COMMENT 'IP地址',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  PRIMARY KEY (id, idtype)
) ENGINE=MyISAM COMMENT='帖时的端口号';

DROP TABLE IF EXISTS pre_forum_thread_moderate;
CREATE TABLE pre_forum_thread_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='主题审核数据表';

DROP TABLE IF EXISTS pre_forum_post_moderate;
CREATE TABLE pre_forum_post_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='帖子审核数据表';

DROP TABLE IF EXISTS pre_home_blog_moderate;
CREATE TABLE pre_home_blog_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='日志审核数据表';

DROP TABLE IF EXISTS pre_home_pic_moderate;
CREATE TABLE pre_home_pic_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='图片审核数据表';

DROP TABLE IF EXISTS pre_home_doing_moderate;
CREATE TABLE pre_home_doing_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='记录审核数据表';

DROP TABLE IF EXISTS pre_home_share_moderate;
CREATE TABLE pre_home_share_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='分享审核数据表';

DROP TABLE IF EXISTS pre_portal_article_moderate;
CREATE TABLE pre_portal_article_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY status (status, dateline)
) ENGINE=MyISAM COMMENT='文章审核数据表';

DROP TABLE IF EXISTS pre_home_comment_moderate;
CREATE TABLE pre_home_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  idtype varchar(15) NOT NULL default '' COMMENT 'ID类型',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY idtype (idtype, status, dateline)
) ENGINE=MyISAM COMMENT='家园评论审核数据表';

DROP TABLE IF EXISTS pre_portal_comment_moderate;
CREATE TABLE pre_portal_comment_moderate (
  id int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ID',
  idtype varchar(15) NOT NULL default '' COMMENT 'ID类型',
  status tinyint(3) NOT NULL default '0' COMMENT '状态 0 审核中，1 已忽略',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY  (id),
  KEY idtype (idtype, status, dateline)
) ENGINE=MyISAM COMMENT='文章/专题评论审核数据表';

DROP TABLE IF EXISTS pre_forum_postlog;
CREATE TABLE pre_forum_postlog (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `uid` INT(10) unsigned NOT NULL DEFAULT '0',
  `action` char(10) NOT NULL DEFAULT '',
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (pid, tid),
  KEY fid (fid),
  KEY uid (uid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='漫游帖子日志';

DROP TABLE IF EXISTS pre_forum_threadlog;
CREATE TABLE pre_forum_threadlog (
 `tid` mediumint(8) unsigned NOT NULL DEFAULT '0',
 `fid` smallint(6) unsigned NOT NULL DEFAULT '0',
 `uid` INT(10) unsigned NOT NULL DEFAULT '0',
 `otherid` smallint(6) unsigned NOT NULL DEFAULT '0',
 `action` char(10) NOT NULL,
 `expiry` int(10) unsigned NOT NULL DEFAULT '0',
 `dateline` int(10) unsigned NOT NULL DEFAULT '0',
 PRIMARY KEY (tid,fid,uid),
 KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='漫游主题日志';

DROP TABLE IF EXISTS pre_forum_threadpreview;
CREATE TABLE pre_forum_threadpreview (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  relay int(10) unsigned NOT NULL default '0' COMMENT '转播次数',
  content text NOT NULL COMMENT '主题内容预览',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='服务于广播';

DROP TABLE IF EXISTS pre_forum_threadhidelog;
CREATE TABLE pre_forum_threadhidelog (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  `uid` INT(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  UNIQUE KEY uid (tid,uid)
) ENGINE=MyISAM COMMENT='主题隐藏记录';

DROP TABLE IF EXISTS pre_forum_poll;
CREATE TABLE pre_forum_poll (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  overt tinyint(1) NOT NULL default '0' COMMENT '是否公开投票参与人',
  multiple tinyint(1) NOT NULL default '0' COMMENT '是否多选',
  visible tinyint(1) NOT NULL default '0' COMMENT '是否投票后可见',
  maxchoices tinyint(3) unsigned NOT NULL default '0' COMMENT '最大可选项数',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否为图片投票0: 普通投票; 1:图片投票',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '过期时间',
  pollpreview varchar(255) NOT NULL default '' COMMENT '选项内容前两项预览',
  voters mediumint(8) unsigned NOT NULL default '0' COMMENT '投票人数',
  PRIMARY KEY  (tid)
) ENGINE=MyISAM COMMENT='投票表';

DROP TABLE IF EXISTS pre_forum_pollvoter;
CREATE TABLE pre_forum_pollvoter (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username varchar(15) NOT NULL default '' COMMENT '会员名',
  `options` text NOT NULL COMMENT '选项 \t 分隔',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表时间',
  KEY tid (tid),
  KEY uid (uid, dateline)
) ENGINE=MyISAM COMMENT='投票用户表';

DROP TABLE IF EXISTS pre_forum_polloption;
CREATE TABLE pre_forum_polloption (
  polloptionid int(10) unsigned NOT NULL auto_increment COMMENT '选项id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  votes mediumint(8) unsigned NOT NULL default '0' COMMENT '票数',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '显示顺序',
  polloption varchar(80) NOT NULL default '' COMMENT '选项内容',
  voterids mediumtext NOT NULL COMMENT '投票人id',
  PRIMARY KEY  (polloptionid),
  KEY tid (tid,displayorder)
) ENGINE=MyISAM COMMENT='投票选项表';

DROP TABLE IF EXISTS pre_forum_polloption_image;
CREATE TABLE pre_forum_polloption_image (
  aid int(10) unsigned NOT NULL auto_increment COMMENT '图片附件id',
  poid int(10) unsigned NOT NULL default '0' COMMENT '选项id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  width smallint(6) unsigned NOT NULL default '0' COMMENT '附件宽度',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否有缩略率图',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  PRIMARY KEY (aid),
  KEY poid (poid),
  KEY tid (tid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='投票选项图片';

DROP TABLE IF EXISTS pre_forum_post;
CREATE TABLE pre_forum_post (
  pid int(10) unsigned NOT NULL COMMENT '帖子id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  `first` tinyint(1) NOT NULL default '0' COMMENT '是否是首贴',
  author varchar(15) NOT NULL default '' COMMENT '作者姓名',
  authorid int(10) unsigned NOT NULL default '0' COMMENT '作者id',
  `subject` varchar(80) NOT NULL default '' COMMENT '标题',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表时间',
  message mediumtext NOT NULL COMMENT '消息',
  useip varchar(15) NOT NULL default '' COMMENT '发帖者IP',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  invisible tinyint(1) NOT NULL default '0' COMMENT '是否通过审核',
  anonymous tinyint(1) NOT NULL default '0' COMMENT '是否匿名',
  usesig tinyint(1) NOT NULL default '0' COMMENT '是否启用签名',
  htmlon tinyint(1) NOT NULL default '0' COMMENT '是否允许HTML',
  bbcodeoff tinyint(1) NOT NULL default '0' COMMENT '是否关闭BBCODE',
  smileyoff tinyint(1) NOT NULL default '0' COMMENT '是否关闭表情',
  parseurloff tinyint(1) NOT NULL default '0' COMMENT '是否允许粘贴URL',
  attachment tinyint(1) NOT NULL default '0' COMMENT '附件',
  rate smallint(6) NOT NULL default '0' COMMENT '评分分数',
  ratetimes tinyint(3) unsigned NOT NULL default '0' COMMENT '评分次数',
  `status` int(10) NOT NULL default '0' COMMENT '帖子状态',
  tags varchar(255) NOT NULL default '0' COMMENT '新增字段，用于存放tag',
  `comment` tinyint(1) NOT NULL default '0' COMMENT '是否存在点评',
  replycredit int(10) NOT NULL default '0' COMMENT '回帖获得积分记录',
  `position` int(8) unsigned NOT NULL auto_increment COMMENT '帖子位置信息',
  PRIMARY KEY  (tid, `position`),
  KEY fid (fid),
  KEY authorid (authorid,invisible),
  KEY dateline (dateline),
  KEY invisible (invisible),
  KEY displayorder (tid,invisible,dateline),
  KEY `first` (tid,`first`),
  UNIQUE KEY pid (pid)
) ENGINE=MyISAM COMMENT='帖子表';

DROP TABLE IF EXISTS pre_forum_postcomment;
CREATE TABLE pre_forum_postcomment (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tid` mediumint(8) unsigned NOT NULL default '0' COMMENT '主题ID',
  `pid` int(10) unsigned NOT NULL default '0' COMMENT '帖子ID',
  `author` varchar(15) NOT NULL default '' COMMENT '作者',
  `authorid` int(10) NOT NULL default '0' COMMENT '作者ID x1.5以后：0为游客　-1为观点',
  `dateline` int(10) unsigned NOT NULL default '0' COMMENT '时间',
  `comment` varchar(255) NOT NULL default '' COMMENT '点评内容',
  `score` tinyint(1) NOT NULL default '0' COMMENT '是否包含点评观点',
  `useip` varchar(15) NOT NULL default '' COMMENT '发帖者IP',
  `port` smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  `rpid` int(10) unsigned NOT NULL default '0' COMMENT '关联的帖子ID',
  PRIMARY KEY (`id`),
  KEY `tid` (`tid`),
  KEY authorid (authorid),
  KEY score (score),
  KEY rpid (rpid),
  KEY `pid` (`pid`,`dateline`)
) ENGINE=MyISAM COMMENT='点评帖子表';

DROP TABLE IF EXISTS pre_forum_post_location;
CREATE TABLE pre_forum_post_location (
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `tid` mediumint(8) unsigned DEFAULT '0',
  `uid` INT(10) unsigned DEFAULT '0',
  `mapx` varchar(255) NOT NULL,
  `mapy` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `tid` (`tid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM COMMENT='帖子地理位置表';

DROP TABLE IF EXISTS pre_forum_post_tableid;
CREATE TABLE pre_forum_post_tableid (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Post ID',
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM  COMMENT='post分表协调表';

DROP TABLE IF EXISTS pre_forum_poststick;
CREATE TABLE pre_forum_poststick (
  `tid` mediumint(8) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL,
  `position` int(10) unsigned NOT NULL,
  `dateline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`tid`,`pid`),
  KEY `dateline` (`tid`,`dateline`)
) ENGINE=MyISAM COMMENT='回帖置顶表';

DROP TABLE IF EXISTS pre_forum_promotion;
CREATE TABLE pre_forum_promotion (
  ip char(15) NOT NULL default '' COMMENT 'IP地址',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username char(15) NOT NULL default '' COMMENT '会员名',
  PRIMARY KEY  (ip)
) ENGINE=MyISAM COMMENT='论坛推广';

DROP TABLE IF EXISTS pre_forum_ratelog;
CREATE TABLE pre_forum_ratelog (
  pid int(10) unsigned NOT NULL default '0' COMMENT '帖子id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username char(15) NOT NULL default '' COMMENT '会员名',
  extcredits tinyint(1) unsigned NOT NULL default '0' COMMENT '评分字段',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '评分时间',
  score smallint(6) NOT NULL default '0' COMMENT '分数',
  reason char(40) NOT NULL default '' COMMENT '操作理由',
  KEY pid (pid,dateline),
  KEY dateline (dateline),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='帖子评分记录表';

DROP TABLE IF EXISTS pre_forum_relatedthread;
CREATE TABLE pre_forum_relatedthread (
  tid mediumint(8) NOT NULL default '0' COMMENT '主题id',
  `type` enum('general','trade') NOT NULL default 'general' COMMENT '关键词类型',
  expiration int(10) NOT NULL default '0' COMMENT '过期时间',
  keywords varchar(255) NOT NULL default '' COMMENT '关键字',
  relatedthreads text NOT NULL COMMENT '相关主题序列',
  PRIMARY KEY  (tid,`type`)
) ENGINE=MyISAM COMMENT='相关主题表';

DROP TABLE IF EXISTS pre_forum_rsscache;
CREATE TABLE pre_forum_rsscache (
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '最后更新时间',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表时间',
  forum char(50) NOT NULL default '' COMMENT '论坛名称',
  author char(15) NOT NULL default '' COMMENT '作者',
  `subject` char(80) NOT NULL default '' COMMENT '标题',
  description char(255) NOT NULL default '' COMMENT '解释说明',
  guidetype char(10) NOT NULL default '' COMMENT '导读中的类型',
  UNIQUE KEY tid (tid),
  KEY fid (fid,dateline)
) ENGINE=MyISAM COMMENT='rss缓存表';

DROP TABLE IF EXISTS pre_forum_replycredit;
CREATE TABLE pre_forum_replycredit (
  tid mediumint(6) unsigned NOT NULL COMMENT '主题tid',
  extcredits mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '单次回复奖励额度',
  extcreditstype tinyint(1) NOT NULL DEFAULT '0' COMMENT '本规则下奖励积分的类型',
  times smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '回复奖励次数',
  membertimes smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '单个用户参与次数',
  random tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户设置的回帖奖励几率',
  PRIMARY KEY  (tid)
) ENGINE=MyISAM COMMENT='主题回帖获得积分规则表';

DROP TABLE IF EXISTS pre_common_searchindex;
CREATE TABLE pre_common_searchindex (
  searchid int(10) unsigned NOT NULL auto_increment COMMENT '缓存id',
  srchmod tinyint(3) unsigned NOT NULL COMMENT 'mod模块',
  keywords varchar(255) NOT NULL default '' COMMENT '关键字',
  searchstring text NOT NULL COMMENT '查找字符串',
  useip varchar(15) NOT NULL default '' COMMENT '搜索人IP',
  uid mediumint(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '搜索时间',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '过期时间',
  threadsortid smallint(6) unsigned NOT NULL default '0' COMMENT '分类信息id',
  num smallint(6) unsigned NOT NULL default '0' COMMENT '主题数量',
  ids text NOT NULL COMMENT '主题id序列',
  PRIMARY KEY  (searchid),
  KEY srchmod (srchmod)
) ENGINE=MyISAM COMMENT='搜索缓存表';

DROP TABLE IF EXISTS pre_common_sphinxcounter;
CREATE TABLE pre_common_sphinxcounter (
  `indexid` tinyint(1) NOT NULL,
  `maxid` int(10) NOT NULL,
  PRIMARY KEY  (`indexid`)
) ENGINE=MyISAM COMMENT='Sphinx 增量索引记录表';

DROP TABLE IF EXISTS pre_forum_spacecache;
CREATE TABLE pre_forum_spacecache (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户 uid',
  variable varchar(20) NOT NULL COMMENT '缓存变量的名称',
  `value` text NOT NULL COMMENT '缓存变量的值',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '过期时间',
  PRIMARY KEY  (uid,variable)
) ENGINE=MyISAM COMMENT='minispace缓存表';

DROP TABLE IF EXISTS pre_forum_statlog;
CREATE TABLE pre_forum_statlog (
  `logdate` date NOT NULL COMMENT '日志日期',
  `fid` mediumint(8) unsigned NOT NULL COMMENT '版块ID',
  `type` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '记录类型',
  `value` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '记录值',
  PRIMARY KEY (`logdate`,`fid`)
) ENGINE=MyISAM COMMENT='版块统计日志表';

DROP TABLE IF EXISTS pre_common_task;
CREATE TABLE pre_common_task (
  taskid smallint(6) unsigned NOT NULL auto_increment COMMENT '任务id',
  relatedtaskid smallint(6) unsigned NOT NULL default '0' COMMENT '依存任务id\n必须完成依存任务才能申请该任务',
  available tinyint(1) NOT NULL default '0' COMMENT '是否启用',
  `name` varchar(50) NOT NULL default '' COMMENT '任务名称',
  description text NOT NULL COMMENT '任务描述',
  icon varchar(150) NOT NULL default '' COMMENT '任务图标',
  applicants mediumint(8) unsigned NOT NULL default '0' COMMENT '已申请任务人次',
  achievers mediumint(8) unsigned NOT NULL default '0' COMMENT '已完成任务人次',
  tasklimits mediumint(8) unsigned NOT NULL default '0' COMMENT '允许申请并完成该任务的人次上限',
  applyperm text NOT NULL COMMENT '允许申请任务的用户组id, 格式:	1	2	3',
  scriptname varchar(50) NOT NULL default '' COMMENT '任务脚本文件名',
  starttime int(10) unsigned NOT NULL default '0' COMMENT '任务上线时间',
  endtime int(10) unsigned NOT NULL default '0' COMMENT '任务下线时间',
  period int(10) unsigned NOT NULL default '0' COMMENT '任务周期 单位：小时 默认为0表示一次性任务 设置为24即1天表示日常任务',
  periodtype tinyint(1) NOT NULL default '0' COMMENT '任务间隔周期单位 0:小时 1:天 2:周 3:月',
  reward enum('credit','magic','medal','invite','group') NOT NULL default 'credit' COMMENT '奖励类型\n(credit:积分 magic:道具 medal:勋章 invite:邀请码 group:特殊用户组)',
  prize varchar(15) NOT NULL default '' COMMENT '奖品: 哪一个扩展积分, 道具id, 勋章id,邀请码有效期， 特殊用户组id',
  bonus int(10) NOT NULL default '0' COMMENT '奖品数量/有效期: \n积分数量, 道具数量, 勋章有效期, 邀请码数量，特殊用户组有效期',
  displayorder smallint(6) unsigned NOT NULL default '0' COMMENT '显示顺序',
  version varchar(15) NOT NULL default '' COMMENT '任务脚本版本号',
  PRIMARY KEY  (taskid)
) ENGINE=MyISAM COMMENT='论坛任务表';

DROP TABLE IF EXISTS pre_common_taskvar;
CREATE TABLE pre_common_taskvar (
  taskvarid mediumint(8) unsigned NOT NULL auto_increment COMMENT '任务变量id',
  taskid smallint(6) unsigned NOT NULL default '0' COMMENT '任务id',
  sort enum('apply','complete') NOT NULL default 'complete' COMMENT '变量类别\n(apply:申请任务条件 complete:完成任务条件)',
  `name` varchar(100) NOT NULL default '' COMMENT '变量名称',
  description varchar(255) NOT NULL default '' COMMENT '变量描述',
  variable varchar(40) NOT NULL default '' COMMENT '变量名',
  `type` varchar(20) NOT NULL default 'text' COMMENT '变量类型',
  `value` text NOT NULL COMMENT '变量值',
  PRIMARY KEY  (taskvarid),
  KEY taskid (taskid)
) ENGINE=MyISAM COMMENT='论坛任务设置表';

DROP TABLE IF EXISTS pre_forum_thread;
CREATE TABLE pre_forum_thread (
  tid mediumint(8) unsigned NOT NULL auto_increment COMMENT '主题id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '上级论坛',
  posttableid smallint(6) unsigned NOT NULL default '0' COMMENT '帖子表ID',
  typeid smallint(6) unsigned NOT NULL default '0' COMMENT '主题分类id',
  sortid smallint(6) unsigned NOT NULL default '0' COMMENT '分类信息id',
  readperm tinyint(3) unsigned NOT NULL default '0' COMMENT '阅读权限',
  price smallint(6) NOT NULL default '0' COMMENT '价格',
  author char(15) NOT NULL default '' COMMENT '会员名',
  authorid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  `subject` char(80) NOT NULL default '' COMMENT '标题',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表时间',
  lastpost int(10) unsigned NOT NULL default '0' COMMENT '最后发表',
  lastposter char(15) NOT NULL default '' COMMENT '最后发表人id',
  views int(10) unsigned NOT NULL default '0' COMMENT '浏览次数',
  replies mediumint(8) unsigned NOT NULL default '0' COMMENT '回复次数',
  displayorder tinyint(1) NOT NULL default '0' COMMENT '显示顺序',
  highlight tinyint(1) NOT NULL default '0' COMMENT '是否高亮',
  digest tinyint(1) NOT NULL default '0' COMMENT '是否精华',
  rate tinyint(1) NOT NULL default '0' COMMENT '是否评分',
  special tinyint(1) NOT NULL default '0' COMMENT '特殊主题,1:投票;2:商品;3:悬赏;4:活动;5:辩论贴;127:插件相关',
  attachment tinyint(1) NOT NULL default '0' COMMENT '附件,0无附件 1普通附件 2有图片附件',
  moderated tinyint(1) NOT NULL default '0' COMMENT '是否被管理员改动',
  closed mediumint(8) unsigned NOT NULL default '0' COMMENT '是否关闭',
  stickreply tinyint(1) unsigned NOT NULL default '0' COMMENT '是否有回帖置顶',
  recommends smallint(6) NOT NULL default '0' COMMENT '推荐指数',
  recommend_add smallint(6) NOT NULL default '0' COMMENT '支持人数',
  recommend_sub smallint(6) NOT NULL default '0' COMMENT '反对人数',
  heats int(10) unsigned NOT NULL default '0' COMMENT '主题热度值',
  status smallint(6) unsigned NOT NULL default '0' ,
  isgroup tinyint(1) NOT NULL default '0' COMMENT '是否为群组帖子',
  favtimes mediumint(8) NOT NULL default '0' COMMENT '主题收藏次数',
  sharetimes mediumint(8) NOT NULL default '0' COMMENT '主题分享次数',
  `stamp` tinyint(3) NOT NULL default '-1' COMMENT '主题图章',
  `icon` tinyint(3) NOT NULL default '-1' COMMENT '主题图标',
  pushedaid mediumint(8) NOT NULL default '0' COMMENT '被推送到的文章aid',
  cover smallint(6) NOT NULL default '0' COMMENT '主题封面  负数:远程　正数:本地 0:无封面',
  replycredit smallint(6) NOT NULL default '0' COMMENT '回帖奖励积分主题记录积分值',
  relatebytag char(255) NOT NULL default '0' COMMENT '根据帖子标签取的相关主题id (time /t tid,...)',
  maxposition int(8) unsigned NOT NULL default '0' COMMENT '最大回帖位置信息',
  bgcolor char(8) NOT NULL default '' COMMENT '保存高亮背景色',
  comments int(10) unsigned NOT NULL default '0' COMMENT '点评数',
  hidden smallint(6) unsigned NOT NULL default '0' COMMENT '是否隐藏',
  PRIMARY KEY  (tid),
  KEY digest (digest),
  KEY sortid (sortid),
  KEY displayorder (fid,displayorder,lastpost),
  KEY typeid (fid,typeid,displayorder,lastpost),
  KEY recommends (recommends),
  KEY heats (heats),
  KEY authorid (authorid),
  KEY isgroup (isgroup, lastpost),
  KEY special (special)
) ENGINE=MyISAM COMMENT='主题表';

DROP TABLE IF EXISTS pre_forum_threadaddviews;
CREATE TABLE pre_forum_threadaddviews (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  addviews int(10) unsigned NOT NULL default '0' COMMENT '浏览次数',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='主题查看数延时更新表';

DROP TABLE IF EXISTS pre_forum_threadcalendar;
CREATE TABLE pre_forum_threadcalendar (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '帖子日历ID',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块ID',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '日期',
  hotnum int(10) unsigned NOT NULL default '0' COMMENT '热帖总数',
  PRIMARY KEY (cid),
  KEY fid (fid,dateline)
) ENGINE=MyISAM COMMENT='热帖日历表';

DROP TABLE IF EXISTS pre_forum_threadhot;
CREATE TABLE pre_forum_threadhot (
  cid mediumint(8) unsigned NOT NULL default '0' COMMENT '帖子日历ID',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块ID',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题ID',
  PRIMARY KEY (cid, tid),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='热帖日历数据表';

DROP TABLE IF EXISTS pre_forum_threaddisablepos;
CREATE TABLE pre_forum_threaddisablepos (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  PRIMARY KEY (tid)
) ENGINE=MEMORY COMMENT='主题有楼层不准确时不使用position查询';

DROP TABLE IF EXISTS pre_forum_threadclosed;
CREATE TABLE pre_forum_threadclosed (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '对应源主题',
  redirect mediumint(8) unsigned NOT NULL default '0' COMMENT '保留的指向 tid',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='主题转移后保留的指向记录';

DROP TABLE IF EXISTS pre_forum_threadmod;
CREATE TABLE pre_forum_threadmod (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username char(15) NOT NULL default '' COMMENT '会员名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '操作时间',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '有效时间',
  `action` char(5) NOT NULL default '' COMMENT '操作',
  `status` tinyint(1) NOT NULL default '0' COMMENT '状态',
  magicid smallint(6) unsigned NOT NULL COMMENT '使用道具id',
  `stamp` TINYINT(3) NOT NULL COMMENT '主题图章/图标 ID',
  reason char(40) NOT NULL DEFAULT '' COMMENT '操作原因',
  KEY tid (tid,dateline),
  KEY expiration (expiration,`status`)
) ENGINE=MyISAM COMMENT='主题管理记录表';

DROP TABLE IF EXISTS pre_forum_threadpartake;
CREATE TABLE pre_forum_threadpartake (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '参与时间',
  KEY tid (tid,uid)
) ENGINE=MyISAM COMMENT='主题参与者记录表';

DROP TABLE IF EXISTS pre_forum_threadrush;
CREATE TABLE pre_forum_threadrush (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题id',
  stopfloor mediumint(8) unsigned NOT NULL default '0' COMMENT '截止楼层',
  starttimefrom int(10) unsigned NOT NULL default '0' COMMENT '开始时间',
  starttimeto int(10) unsigned NOT NULL default '0' COMMENT '结束时间',
  rewardfloor text NOT NULL default '' COMMENT '奖励楼层',
  creditlimit int(10) NOT NULL default '-996' COMMENT '积分下限',
  replylimit smallint(6) NOT NULL default '0' COMMENT '回帖次数上限',
  PRIMARY KEY  (tid)
) ENGINE=MyISAM COMMENT='抢楼设置表';

DROP TABLE IF EXISTS pre_forum_threadtype;
CREATE TABLE pre_forum_threadtype (
  typeid smallint(6) unsigned NOT NULL auto_increment COMMENT '分类信息id',
  `fid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  `name` varchar(255) NOT NULL default '' COMMENT '名称',
  description varchar(255) NOT NULL default '' COMMENT '解释说明',
  `icon` varchar(255) NOT NULL default '' COMMENT '分类图标URL',
  special smallint(6) NOT NULL default '0' COMMENT '分类状态',
  modelid smallint(6) unsigned NOT NULL default '0' COMMENT '分类模型id',
  expiration tinyint(1) NOT NULL default '0' COMMENT '分类有效期',
  template text NOT NULL COMMENT '分类信息内容模板',
  stemplate text NOT NULL COMMENT '分类信息主题模板',
  ptemplate text NOT NULL COMMENT '分类信息发帖模板',
  btemplate text NOT NULL COMMENT '分类信息模块调用模板',
  PRIMARY KEY (typeid)
) ENGINE=MyISAM COMMENT='分类信息表';

DROP TABLE IF EXISTS pre_forum_trade;
CREATE TABLE pre_forum_trade (
  tid mediumint(8) unsigned NOT NULL COMMENT '主题id',
  pid int(10) unsigned NOT NULL COMMENT '帖子id',
  typeid smallint(6) unsigned NOT NULL COMMENT '主题分类id',
  sellerid mediumint(8) unsigned NOT NULL COMMENT '卖家id',
  seller char(15) NOT NULL COMMENT '卖家名',
  account char(50) NOT NULL COMMENT '卖家帐号',
  tenpayaccount char(20) NOT NULL default '' COMMENT '卖家财付通账号',
  `subject` char(100) NOT NULL COMMENT '标题',
  price decimal(8,2) NOT NULL COMMENT '价格',
  amount smallint(6) unsigned NOT NULL default '1' COMMENT '数量',
  quality tinyint(1) unsigned NOT NULL default '0' COMMENT '成色',
  locus char(20) NOT NULL COMMENT '所在地',
  transport tinyint(1) NOT NULL default '0' COMMENT '物流方式',
  ordinaryfee smallint(4) unsigned NOT NULL default '0' COMMENT '平邮附加费',
  expressfee smallint(4) unsigned NOT NULL default '0' COMMENT '快递附加费',
  emsfee smallint(4) unsigned NOT NULL default '0' COMMENT 'EMS附加费',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '商品类型',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '交易时间',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '过期时间',
  lastbuyer char(15) NOT NULL COMMENT '最后买家用户名',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '最后交易时间',
  totalitems smallint(5) unsigned NOT NULL default '0' COMMENT '总交易量',
  tradesum decimal(8,2) NOT NULL default '0.00' COMMENT '总交易额',
  closed tinyint(1) NOT NULL default '0' COMMENT '是否关闭',
  aid mediumint(8) unsigned NOT NULL COMMENT '商品图片的 Aid',
  displayorder tinyint(1) NOT NULL COMMENT '显示顺序',
  costprice decimal(8,2) NOT NULL COMMENT '商品原价',
  credit int(10) unsigned NOT NULL default '0' COMMENT '积分价格',
  costcredit int(10) unsigned NOT NULL default '0' COMMENT '积分原价',
  credittradesum int(10) unsigned NOT NULL default '0' COMMENT '总积分交易额',
  PRIMARY KEY  (tid,pid),
  KEY pid (pid),
  KEY sellerid (sellerid),
  KEY totalitems (totalitems),
  KEY tradesum (tradesum),
  KEY displayorder (tid,displayorder),
  KEY sellertrades (sellerid,tradesum,totalitems),
  KEY typeid (typeid),
  KEY credittradesum (credittradesum),
  KEY expiration (expiration)
) ENGINE=MyISAM COMMENT='商品数据表';

DROP TABLE IF EXISTS pre_forum_threadclass;
CREATE TABLE pre_forum_threadclass (
  `typeid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `fid` mediumint(8) unsigned NOT NULL COMMENT '所属版块ID',
  `name` varchar(255) NOT NULL COMMENT '分类名称',
  `displayorder` mediumint(9) NOT NULL COMMENT '显示顺序',
  `icon` varchar(255) NOT NULL COMMENT '分类图标URL',
  `moderators` tinyint(1) NOT NULL default '0' COMMENT '仅管理者可用',
  PRIMARY KEY (`typeid`),
  KEY fid (fid, displayorder)
) ENGINE=MyISAM COMMENT='主题分类表';

DROP TABLE IF EXISTS pre_forum_tradecomment;
CREATE TABLE pre_forum_tradecomment (
  id mediumint(8) NOT NULL auto_increment COMMENT 'id',
  orderid char(32) NOT NULL COMMENT '订单 id',
  pid int(10) unsigned NOT NULL COMMENT '帖子 id',
  `type` tinyint(1) NOT NULL COMMENT '类型',
  raterid mediumint(8) unsigned NOT NULL COMMENT '评价方会员id',
  rater char(15) NOT NULL COMMENT '评价方用户名',
  rateeid mediumint(8) unsigned NOT NULL COMMENT '被评价方会员id',
  ratee char(15) NOT NULL COMMENT '被评价方用户名',
  message char(200) NOT NULL COMMENT '评价内容',
  explanation char(200) NOT NULL COMMENT '解释',
  score tinyint(1) NOT NULL COMMENT '评分',
  dateline int(10) unsigned NOT NULL COMMENT '评价时间',
  PRIMARY KEY  (id),
  KEY raterid (raterid,`type`,dateline),
  KEY rateeid (rateeid,`type`,dateline),
  KEY orderid (orderid)
) ENGINE=MyISAM COMMENT='信用评价';

DROP TABLE IF EXISTS pre_forum_tradelog;
CREATE TABLE pre_forum_tradelog (
  tid mediumint(8) unsigned NOT NULL COMMENT '主题id',
  pid int(10) unsigned NOT NULL COMMENT '帖子id',
  orderid varchar(32) NOT NULL COMMENT '订单号id',
  tradeno varchar(32) NOT NULL COMMENT '支付宝订单号',
  paytype tinyint(1) unsigned NOT NULL default '0' COMMENT '在线支付方式',
  `subject` varchar(100) NOT NULL COMMENT '标题',
  price decimal(8,2) NOT NULL default '0.00' COMMENT '价格',
  quality tinyint(1) unsigned NOT NULL default '0' COMMENT '成色',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '商品类型',
  number smallint(5) unsigned NOT NULL default '0' COMMENT '数量',
  tax decimal(6,2) unsigned NOT NULL default '0.00' COMMENT '交易手续费',
  locus varchar(100) NOT NULL COMMENT '物品所在地',
  sellerid mediumint(8) unsigned NOT NULL COMMENT '卖家id',
  seller varchar(15) NOT NULL COMMENT '卖家名',
  selleraccount varchar(50) NOT NULL COMMENT '卖家交易帐号',
  tenpayaccount varchar(20) NOT NULL default '0' COMMENT '卖家财付通账号',
  buyerid mediumint(8) unsigned NOT NULL COMMENT '买家id',
  buyer varchar(15) NOT NULL COMMENT '买家名',
  buyercontact varchar(50) NOT NULL COMMENT '买家联系方式',
  buyercredits smallint(5) unsigned NOT NULL default '0' COMMENT '买家暂扣积分',
  buyermsg varchar(200) default NULL COMMENT '买家留言',
  `status` tinyint(1) NOT NULL default '0' COMMENT '状态',
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '状态最后更新',
  offline tinyint(1) NOT NULL default '0' COMMENT '是否离线交易',
  buyername varchar(50) NOT NULL COMMENT '买家姓名',
  buyerzip varchar(10) NOT NULL COMMENT '买家邮编',
  buyerphone varchar(20) NOT NULL COMMENT '买家电话',
  buyermobile varchar(20) NOT NULL COMMENT '买家手机',
  transport tinyint(1) NOT NULL default '0' COMMENT '运输方式',
  transportfee smallint(6) unsigned NOT NULL default '0' COMMENT '运输费用',
  baseprice decimal(8,2) NOT NULL COMMENT '商品原价',
  discount tinyint(1) NOT NULL default '0' COMMENT '折扣',
  ratestatus tinyint(1) NOT NULL default '0' COMMENT '评价状态',
  message text NOT NULL COMMENT '订单留言',
  credit int(10) unsigned NOT NULL default '0' COMMENT '积分价格',
  basecredit int(10) unsigned NOT NULL default '0' COMMENT '积分原价',
  UNIQUE KEY orderid (orderid),
  KEY sellerid (sellerid),
  KEY buyerid (buyerid),
  KEY `status` (`status`),
  KEY buyerlog (buyerid,`status`,lastupdate),
  KEY sellerlog (sellerid,`status`,lastupdate),
  KEY tid (tid,pid),
  KEY pid (pid)
) ENGINE=MyISAM COMMENT='交易记录表';

DROP TABLE IF EXISTS pre_forum_typeoption;
CREATE TABLE pre_forum_typeoption (
  optionid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类信息项目ID',
  classid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '分类信息上级项目ID',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '分类信息排序',
  expiration tinyint(1) NOT NULL COMMENT '分类信息项目是否受有效期限制',
  protect varchar(255) NOT NULL COMMENT '分类信息项目是否是保护项目',
  title varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目标题',
  description varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目描述',
  identifier varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目标识',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '分类信息项目类型',
  unit varchar(255) NOT NULL COMMENT '分类信息项目单位',
  rules mediumtext NOT NULL COMMENT '分类信息项目规则',
  permprompt mediumtext NOT NULL COMMENT '分类信息项目权限提示',
  PRIMARY KEY (optionid),
  KEY classid (classid)
) ENGINE=MyISAM COMMENT='分类信息设置项目表';

DROP TABLE IF EXISTS pre_forum_typeoptionvar;
CREATE TABLE pre_forum_typeoptionvar (
  sortid smallint(6) unsigned NOT NULL default '0' COMMENT '分类信息id',
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '分类信息数据对应帖子id',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '分类信息数据对应帖子板块id',
  optionid smallint(6) unsigned NOT NULL default '0' COMMENT '分类信息数据对应选项id',
  expiration int(10) unsigned NOT NULL default '0' COMMENT '分类信息数据有效期',
  `value` mediumtext NOT NULL COMMENT '分类信息数据数值',
  KEY sortid (sortid),
  KEY tid (tid),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='分类信息项目数据表';

DROP TABLE IF EXISTS pre_forum_typevar;
CREATE TABLE pre_forum_typevar (
  sortid smallint(6) NOT NULL default '0' COMMENT '分类信息id',
  optionid smallint(6) NOT NULL default '0' COMMENT '分类信息对应项目id',
  available tinyint(1) NOT NULL default '0' COMMENT '分类信息对应项目是否可用',
  required tinyint(1) NOT NULL default '0' COMMENT '分类信息对应项目是否必填',
  unchangeable tinyint(1) NOT NULL default '0' COMMENT '分类信息对应项目是否可修改',
  search tinyint(1) NOT NULL default '0' COMMENT '分类信息对应项目是否可搜索',
  displayorder tinyint(3) NOT NULL default '0' COMMENT '分类信息对应项目顺序',
  subjectshow TINYINT(1) NOT NULL DEFAULT '0',
  UNIQUE KEY optionid (sortid,optionid),
  KEY sortid (sortid)
) ENGINE=MyISAM COMMENT='分类信息对应项目表';


DROP TABLE IF EXISTS pre_forum_warning;
CREATE TABLE pre_forum_warning (
  wid int(10) unsigned NOT NULL auto_increment COMMENT '记录id',
  pid int(10) unsigned NOT NULL COMMENT '帖子 pid',
  operatorid mediumint(8) unsigned NOT NULL COMMENT '警告者 Uid',
  operator char(15) NOT NULL COMMENT '警告者用户名',
  authorid int(10) unsigned NOT NULL COMMENT '被警告者 uid',
  author char(15) NOT NULL COMMENT '被警告者用户名',
  dateline int(10) unsigned NOT NULL COMMENT '警告时间',
  reason char(40) NOT NULL COMMENT '警告原因',
  PRIMARY KEY  (wid),
  UNIQUE KEY pid (pid),
  KEY authorid (authorid)
) ENGINE=MyISAM COMMENT='警告记录表';

DROP TABLE IF EXISTS pre_home_album;
CREATE TABLE pre_home_album (
  albumid mediumint(8) unsigned NOT NULL auto_increment COMMENT '相册ID ',
  albumname varchar(50) NOT NULL default '' COMMENT '相册名字',
  catid smallint(6) unsigned NOT NULL default '0' COMMENT '相册系统分类',
  uid int(10) unsigned NOT NULL default '0' COMMENT '相册用户ID ',
  username varchar(15) NOT NULL default '' COMMENT '相册用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '相册建立时间戳',
  updatetime int(10) unsigned NOT NULL default '0' COMMENT '相册最后修改时间戳',
  picnum smallint(6) unsigned NOT NULL default '0' COMMENT '相册照片数量',
  pic varchar(255) NOT NULL default '' COMMENT '相册封面照片',
  picflag tinyint(1) NOT NULL default '0' COMMENT '相册是否有图片',
  friend tinyint(1) NOT NULL default '0' COMMENT '相册隐私设置:"0"全站用户可见,"1"为全好友可见,"2"为仅指定的好友可见,"3"为仅自己可见,"4"为凭密码查看 ',
  `password` varchar(10) NOT NULL default '' COMMENT '相册密码',
  target_ids text NOT NULL COMMENT '允许查看相册的用户ID,多个用户ID用"m"间隔 ',
  favtimes mediumint(8) unsigned NOT NULL COMMENT '相册收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL COMMENT '相册分享次数',
  depict text NOT NULL COMMENT '相册描述 ',
  PRIMARY KEY  (albumid),
  KEY uid (uid,updatetime),
  KEY updatetime (updatetime)
) ENGINE=MyISAM COMMENT='相册表';

DROP TABLE IF EXISTS pre_home_appcreditlog;
CREATE TABLE pre_home_appcreditlog (
  logid mediumint(8) unsigned NOT NULL auto_increment COMMENT '序列id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户id',
  appid mediumint(8) unsigned NOT NULL default '0' COMMENT '用户名',
  appname varchar(60) NOT NULL default '' COMMENT '应用名称',
  `type` tinyint(1) NOT NULL default '0' COMMENT '积分转入转出类型',
  credit mediumint(8) unsigned NOT NULL default '0' COMMENT '积分数',
  note text NOT NULL COMMENT '备注',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '操作时间',
  PRIMARY KEY  (logid),
  KEY uid (uid,dateline),
  KEY appid (appid)
) ENGINE=MyISAM COMMENT='漫游应用积分操作记录表';

DROP TABLE IF EXISTS pre_home_blacklist;
CREATE TABLE pre_home_blacklist (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID ',
  buid int(10) unsigned NOT NULL default '0' COMMENT '被屏蔽的用户ID ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '被屏蔽的时间戳',
  PRIMARY KEY  (uid,buid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='屏蔽黑名单表';

DROP TABLE IF EXISTS pre_common_block;
CREATE TABLE pre_common_block (
  bid mediumint(8) unsigned NOT NULL auto_increment COMMENT '模块ID',
  blockclass varchar(255) NOT NULL default '0' COMMENT '模块分类 article/pic/member/board/poll',
  blocktype tinyint(1) NOT NULL default '0' COMMENT '调用类型 0为模板调用 1为js调用',
  `name` varchar(255) NOT NULL default '' COMMENT '模块标名称',
  title text NOT NULL COMMENT '模块标题名',
  classname varchar(255) NOT NULL default '' COMMENT '指定样式class',
  summary text NOT NULL COMMENT '模块自定义内容',
  uid int(10) unsigned NOT NULL default '0' COMMENT '创建者用户ID ',
  username varchar(255) NOT NULL default '' COMMENT '创建者用户名',
  styleid smallint(6) unsigned NOT NULL default '0' COMMENT '模块风格ID',
  blockstyle text NOT NULL COMMENT '自定义风格',
  picwidth smallint(6) unsigned NOT NULL default '0' COMMENT '显示图片长度',
  picheight smallint(6) unsigned NOT NULL default '0' COMMENT '显示图片宽度',
  target varchar(255) NOT NULL default '' COMMENT '模块链接打开方式: _blank, _self, _top',
  dateformat varchar(255) NOT NULL default '' COMMENT '时间格式： H:i； u； Y-m-d等',
  dateuformat tinyint(1) NOT NULL default '0' COMMENT '是否使用个性化时间格式',
  script varchar(255) NOT NULL default '' COMMENT '模块获取数据脚本名',
  param text NOT NULL COMMENT '模块参数配置序列化存储',
  shownum smallint(6) unsigned NOT NULL default '0' COMMENT '获取数据数目',
  cachetime int(10) NOT NULL default '0' COMMENT '模块缓存更新时间间隔',
  cachetimerange char(5) NOT NULL default '' COMMENT '模块缓存更新时间区间',
  punctualupdate tinyint(1) NOT NULL default '0' COMMENT '是否严格按照缓存时间更新（忽略优化）',
  hidedisplay tinyint(1) NOT NULL default '0' COMMENT '是否屏蔽输出',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '模块缓存创建时间戳',
  notinherited tinyint(1) NOT NULL default '0' COMMENT '是否继承所在页面权限',
  isblank tinyint(1) NOT NULL default '0' COMMENT '是否为空白模块，只显示准送数据',
  PRIMARY KEY  (bid)
) ENGINE=MyISAM COMMENT='模块表';

DROP TABLE IF EXISTS pre_common_block_style;
CREATE TABLE pre_common_block_style (
  styleid smallint(6) unsigned NOT NULL auto_increment COMMENT '模块样式ID',
  blockclass varchar(255) NOT NULL default '' COMMENT '模块分类',
  `name` varchar(255) NOT NULL default '' COMMENT '样式名称',
  template text NOT NULL COMMENT '样式模板',
  `hash` varchar(255) NOT NULL default '' COMMENT '样式hash（blockclass + template）',
  getpic tinyint(1) NOT NULL default '0' COMMENT '是否需要获取pic数据',
  getsummary tinyint(1) NOT NULL default '0' COMMENT '是否需要获取summary数据',
  makethumb tinyint(1) NOT NULL default '0' COMMENT '是否需要block设置缩略图',
  settarget tinyint(1) NOT NULL default '0' COMMENT '是否需要设置链接打开方式',
  `fields` text NOT NULL COMMENT '模板中用到的模块分类字段',
  moreurl tinyint(1) NOT NULL default '0' COMMENT '是否有更多链接',
  PRIMARY KEY  (styleid),
  KEY `hash` (`hash`),
  KEY `blockclass` (`blockclass`)
) ENGINE=MyISAM COMMENT='模块模板表';

DROP TABLE IF EXISTS pre_common_block_item;
CREATE TABLE pre_common_block_item (
  itemid int(10) unsigned NOT NULL auto_increment COMMENT '信息ID',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块ID',
  id int(10) unsigned NOT NULL default '0' COMMENT '来源ID',
  idtype varchar(255) NOT NULL default '' COMMENT '来源ID TYPE，手工添加数据为rand',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '信息类型 0为自动 1为手工输入 2已编辑',
  title varchar(255) NOT NULL default '' COMMENT '信息标题名',
  url varchar(255) NOT NULL default '' COMMENT '信息链接地址',
  pic varchar(255) NOT NULL default '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL default '0' COMMENT '图片类型 0为url 1为本地 2 为ftp远程',
  makethumb tinyint(1) NOT NULL default '0' COMMENT '是否已生成缩略图  1:生成成功; 2:生成失败',
  thumbpath varchar(255) NOT NULL default '' COMMENT '缩略图地址',
  summary text NOT NULL COMMENT '信息摘要',
  showstyle text NOT NULL COMMENT '显示样式',
  related text NOT NULL COMMENT '相关链接',
  `fields` text NOT NULL COMMENT '信息附属num/author/authorid/dateline',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  startdate int(10) unsigned NOT NULL default '0' COMMENT '开始时间戳',
  enddate int(10) unsigned NOT NULL default '0' COMMENT '结束时间戳',
  PRIMARY KEY  (itemid),
  KEY bid (bid)
) ENGINE=MyISAM COMMENT='模块数据表';

DROP TABLE IF EXISTS pre_common_block_pic;
CREATE TABLE pre_common_block_pic (
  picid int(10) unsigned NOT NULL auto_increment COMMENT '图片ID',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块ID',
  itemid int(10) unsigned NOT NULL default '0' COMMENT '信息ID',
  pic varchar(255) NOT NULL default '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL default '0' COMMENT '图片类型 0为本地 1为ftp远程',
  `type` tinyint(1) NOT NULL default '0' COMMENT '信息类型 0为模块缩略图 1为上传的图',
  PRIMARY KEY  (picid),
  KEY bid (bid,itemid)
) ENGINE=MyISAM COMMENT='模块使用图片表';

DROP TABLE IF EXISTS pre_common_block_item_data;
CREATE TABLE pre_common_block_item_data (
  dataid int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '推荐信息ID',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块ID',
  id int(10) unsigned NOT NULL default '0' COMMENT '来源ID',
  idtype varchar(255) NOT NULL default '' COMMENT '来源ID TYPE',
  itemtype tinyint(1) NOT NULL default '0' COMMENT '信息类型 0为自动 1为手工输入 3推荐数据',
  title varchar(255) NOT NULL default '' COMMENT '信息标题名',
  url varchar(255) NOT NULL default '' COMMENT '信息链接地址',
  pic varchar(255) NOT NULL default '' COMMENT '信息图片',
  picflag tinyint(1) NOT NULL default '0' COMMENT '图片类型 0为url 1为本地 2 为ftp远程',
  makethumb tinyint(1) NOT NULL default '0' COMMENT '是否已生成缩略图',
  summary text NOT NULL COMMENT '信息摘要',
  showstyle text NOT NULL COMMENT '显示样式',
  related text NOT NULL COMMENT '相关链接',
  `fields` text NOT NULL COMMENT '信息附属num/author/authorid/dateline',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  startdate int(10) unsigned NOT NULL default '0' COMMENT '开始时间戳',
  enddate int(10) unsigned NOT NULL default '0' COMMENT '结束时间戳',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐者 UID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '推荐者用户名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推荐日期',
  isverified tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已通过审核',
  verifiedtime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '通过审核日期',
  stickgrade tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '置顶等级： 0～10',
  PRIMARY KEY (dataid),
  KEY bid (bid, stickgrade, displayorder, verifiedtime)
) ENGINE=MyISAM COMMENT='模块推荐信息表';

DROP TABLE IF EXISTS pre_common_block_xml;
CREATE TABLE pre_common_block_xml (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT 'XML扩展 名称',
  `version` varchar(255) NOT NULL COMMENT 'XML扩展 版本',
  `url` varchar(255) NOT NULL COMMENT 'XML扩展 URL',
  `clientid` varchar(255) NOT NULL COMMENT '客户端ID',
  `key` varchar(255) NOT NULL COMMENT '通信密钥',
  `signtype` varchar(255) NOT NULL COMMENT '签名的加密方式：目前只支持MD5方式，空为不使用签名，直接使用通信密钥',
  `data` text NOT NULL COMMENT 'XML扩展 数据',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM COMMENT='模块 XML 扩展类数据表';

DROP TABLE IF EXISTS pre_common_block_favorite;
CREATE TABLE pre_common_block_favorite (
  favid mediumint(8) unsigned NOT NULL auto_increment COMMENT '收藏id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '收藏时间',
  PRIMARY KEY (favid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='模块收藏表';

DROP TABLE IF EXISTS pre_home_blog;
CREATE TABLE pre_home_blog (
  blogid mediumint(8) unsigned NOT NULL auto_increment COMMENT '日志ID',
  uid int(10) unsigned NOT NULL default '0' COMMENT '日志所属用户ID ',
  username char(15) NOT NULL default '' COMMENT '日志所属用户名',
  `subject` char(80) NOT NULL default '' COMMENT '日志标题',
  classid smallint(6) unsigned NOT NULL default '0' COMMENT '个人分类id',
  catid smallint(6) unsigned NOT NULL default '0' COMMENT '系统分类id',
  viewnum mediumint(8) unsigned NOT NULL default '0' COMMENT '日志查看数',
  replynum mediumint(8) unsigned NOT NULL default '0' COMMENT '日志回复数',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '热度',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '日志发布时间',
  picflag tinyint(1) NOT NULL default '0' COMMENT '日志是否有图片',
  noreply tinyint(1) NOT NULL default '0' COMMENT '是否允许评论:"0"为允许,"1"为不允许 ',
  friend tinyint(1) NOT NULL default '0' COMMENT '日志隐私设置:"0"为全站用户可见,"1"为全好友可见,"2"为仅指定的好友可见,"3"为仅自己可见,"4"为凭密码查看 ',
  `password` char(10) NOT NULL default '' COMMENT '日志密码',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '日志收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '日志分享次数',
  `status` tinyint(1) NOT NULL default '0' COMMENT 'blog状态 -1:回收站日志; 0:正常; 1:审核;',
  click1 smallint(6) unsigned NOT NULL default '0' COMMENT '表态1 id',
  click2 smallint(6) unsigned NOT NULL default '0' COMMENT '表态2 id',
  click3 smallint(6) unsigned NOT NULL default '0' COMMENT '表态3 id',
  click4 smallint(6) unsigned NOT NULL default '0' COMMENT '表态4 id',
  click5 smallint(6) unsigned NOT NULL default '0' COMMENT '表态5 id',
  click6 smallint(6) unsigned NOT NULL default '0' COMMENT '表态6 id',
  click7 smallint(6) unsigned NOT NULL default '0' COMMENT '表态7 id',
  click8 smallint(6) unsigned NOT NULL default '0' COMMENT '表态8 id',
  PRIMARY KEY  (blogid),
  KEY uid (uid,dateline),
  KEY hot (hot),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='日志表';

DROP TABLE IF EXISTS pre_home_blogfield;
CREATE TABLE pre_home_blogfield (
  blogid mediumint(8) unsigned NOT NULL default '0' COMMENT '日志id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '日志所属用户ID ',
  pic varchar(255) NOT NULL default '' COMMENT '标题图片',
  tag varchar(255) NOT NULL default '' COMMENT '日志TAG ',
  message mediumtext NOT NULL COMMENT '日志内容',
  postip varchar(255) NOT NULL default '' COMMENT '发表日志的IP ',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  related text NOT NULL COMMENT '相关日志的数据信息',
  relatedtime int(10) unsigned NOT NULL default '0' COMMENT '相关日志产生时间戳',
  target_ids text NOT NULL COMMENT '允许查看日志的用户ID多个ID以","间隔 ',
  hotuser text NOT NULL COMMENT '热点用户',
  magiccolor tinyint(6) NOT NULL default '0' COMMENT '道具彩色灯id',
  magicpaper tinyint(6) NOT NULL default '0' COMMENT '道具信纸id',
  pushedaid mediumint(8) NOT NULL default '0' COMMENT '被推送到的文章aid',
  PRIMARY KEY  (blogid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='日志字段表';

DROP TABLE IF EXISTS pre_home_class;
CREATE TABLE pre_home_class (
  classid mediumint(8) unsigned NOT NULL auto_increment COMMENT '个人分类id',
  classname char(40) NOT NULL default '' COMMENT '分类名称',
  uid int(10) unsigned NOT NULL default '0' COMMENT '分类所属用户ID ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '分类创建时间戳',
  PRIMARY KEY  (classid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='日志个人分类表';

DROP TABLE IF EXISTS pre_home_click;
CREATE TABLE pre_home_click (
  clickid smallint(6) unsigned NOT NULL auto_increment COMMENT '表态ID',
  `name` char(50) NOT NULL default '' COMMENT '表态名称',
  icon char(100) NOT NULL default '' COMMENT '表态图标',
  idtype char(15) NOT NULL default '' COMMENT '表态类型',
  available tinyint(1) unsigned NOT NULL default '0' COMMENT '是否有效',
  displayorder tinyint(6) unsigned NOT NULL default '0' COMMENT '排序',
  PRIMARY KEY (clickid),
  KEY idtype (idtype, displayorder)
) ENGINE=MyISAM COMMENT='表态动作';

DROP TABLE IF EXISTS pre_home_clickuser;
CREATE TABLE pre_home_clickuser (
  uid int(10) unsigned NOT NULL default '0' COMMENT '表态用户id',
  username varchar(15) NOT NULL default '' COMMENT '表态用户名',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '作用对象id',
  idtype varchar(15) NOT NULL default '' COMMENT '作用对象id类型',
  clickid smallint(6) unsigned NOT NULL default '0' COMMENT '表态id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表表态时间戳',
  KEY id (id,idtype,dateline),
  KEY uid (uid,idtype,dateline)
) ENGINE=MyISAM COMMENT='用户表态表';

DROP TABLE IF EXISTS pre_home_comment;
CREATE TABLE pre_home_comment (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '评论id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '发表评论的用户id',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '评论对象id',
  idtype varchar(20) NOT NULL default '' COMMENT '评论对象的id类型：blogid，picid，uid',
  authorid int(10) unsigned NOT NULL default '0' COMMENT '若为回复,回复作者用户ID ',
  author varchar(15) NOT NULL default '' COMMENT '若为回复,回复作者用户名 ',
  ip varchar(20) NOT NULL default '' COMMENT '评论IP ',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '评论时间戳',
  message text NOT NULL COMMENT '评论内容',
  magicflicker tinyint(1) NOT NULL default '0' COMMENT '是否使用了道具彩虹炫',
  status tinyint(1) NOT NULL default '0' COMMENT '评论状态 1-审核',
  PRIMARY KEY  (cid),
  KEY authorid (authorid,idtype),
  KEY id (id,idtype,dateline)
) ENGINE=MyISAM COMMENT='用户评论表';

DROP TABLE IF EXISTS pre_home_docomment;
CREATE TABLE pre_home_docomment (
  id int(10) unsigned NOT NULL auto_increment COMMENT '记录回复id',
  upid int(10) unsigned NOT NULL default '0' COMMENT '上级记录回复id',
  doid mediumint(8) unsigned NOT NULL default '0' COMMENT '所评论的记录id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '发布记录者用户id',
  username varchar(15) NOT NULL default '' COMMENT '发布记录者用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '记录回复时间戳',
  message text NOT NULL COMMENT '记录回复内容',
  ip varchar(20) NOT NULL default '' COMMENT '发布记录ip',
  grade smallint(6) unsigned NOT NULL default '0' COMMENT '记录回复的层级',
  PRIMARY KEY  (id),
  KEY doid (doid,dateline),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='用户记录回复表';

DROP TABLE IF EXISTS pre_home_doing;
CREATE TABLE pre_home_doing (
  doid mediumint(8) unsigned NOT NULL auto_increment COMMENT '记录id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '记录发布者用户id',
  username varchar(15) NOT NULL default '' COMMENT '记录发布者用户名',
  `from` varchar(20) NOT NULL default '' COMMENT '记录的发表来源',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '记录发布时间戳',
  message text NOT NULL COMMENT '记录内容',
  ip varchar(20) NOT NULL default '' COMMENT '记录发布ip',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  replynum int(10) unsigned NOT NULL default '0' COMMENT '记录回复数',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '记录状态 1-审核',
  PRIMARY KEY  (doid),
  KEY uid (uid,dateline),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='用户记录表';

DROP TABLE IF EXISTS pre_home_feed;
CREATE TABLE pre_home_feed (
  feedid int(10) unsigned NOT NULL auto_increment COMMENT 'feed的ID ',
  appid smallint(6) unsigned NOT NULL default '0' COMMENT '应用程序ID ',
  icon varchar(30) NOT NULL default '' COMMENT 'feed图标 ',
  uid int(10) unsigned NOT NULL default '0' COMMENT '产生feed的用户ID ',
  username varchar(15) NOT NULL default '' COMMENT '产生feed的用户名 ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'feed产生时间戳 ',
  friend tinyint(1) NOT NULL default '0' COMMENT '产生feed信息的隐私设置 ',
  hash_template varchar(32) NOT NULL default '' COMMENT '模板hash:md5(title_template"\t"body_template) ',
  hash_data varchar(32) NOT NULL default '' COMMENT '数据内容hash:md5(title_templat"\t"title_data"\t"body_template"\t"body_data) ',
  title_template text NOT NULL COMMENT 'feed标题模板 ',
  title_data text NOT NULL COMMENT 'feed标题 ',
  body_template text NOT NULL COMMENT 'feed内容模板  ',
  body_data text NOT NULL COMMENT 'feed内容 ',
  body_general text NOT NULL COMMENT '用户填写的信息 ',
  image_1 varchar(255) NOT NULL default '' COMMENT 'feed图1',
  image_1_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接1',
  image_2 varchar(255) NOT NULL default '' COMMENT 'feed图片2',
  image_2_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接2',
  image_3 varchar(255) NOT NULL default '' COMMENT 'feed图片3',
  image_3_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接3',
  image_4 varchar(255) NOT NULL default '' COMMENT 'feed图片4',
  image_4_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接4',
  target_ids text NOT NULL COMMENT '产生feed信息允许查看的好友ID ',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT 'feed对应对象id',
  idtype varchar(15) NOT NULL default '' COMMENT 'feed对应对象类型',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '热度',
  PRIMARY KEY  (feedid),
  KEY uid (uid,dateline),
  KEY dateline (dateline),
  KEY hot (hot),
  KEY id (id,idtype)
) ENGINE=MyISAM COMMENT='站点feed表';

DROP TABLE IF EXISTS pre_home_feed_app;
CREATE TABLE pre_home_feed_app (
  feedid int(10) unsigned NOT NULL auto_increment COMMENT '应用feed id',
  appid smallint(6) unsigned NOT NULL default '0' COMMENT '应用程序ID',
  icon varchar(30) NOT NULL default '' COMMENT 'feed图标 ',
  uid int(10) unsigned NOT NULL default '0' COMMENT '产生feed的用户ID ',
  username varchar(15) NOT NULL default '' COMMENT '产生feed的用户名 ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT 'feed产生时间戳 ',
  friend tinyint(1) NOT NULL default '0' COMMENT '产生feed信息的隐私设置 ',
  hash_template varchar(32) NOT NULL default '' COMMENT '模板hash:md5(title_template"\t"body_template) ',
  hash_data varchar(32) NOT NULL default '' COMMENT '数据内容hash:md5(title_templat"\t"title_data"\t"body_template"\t"body_data) ',
  title_template text NOT NULL COMMENT 'feed标题模板 ',
  title_data text NOT NULL COMMENT 'feed标题 ',
  body_template text NOT NULL COMMENT 'feed内容模板  ',
  body_data text NOT NULL COMMENT 'feed内容 ',
  body_general text NOT NULL COMMENT '用户填写的信息 ',
  image_1 varchar(255) NOT NULL default '' COMMENT 'feed图1',
  image_1_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接1',
  image_2 varchar(255) NOT NULL default '' COMMENT 'feed图片2',
  image_2_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接2',
  image_3 varchar(255) NOT NULL default '' COMMENT 'feed图片3',
  image_3_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接3',
  image_4 varchar(255) NOT NULL default '' COMMENT 'feed图片4',
  image_4_link varchar(255) NOT NULL default '' COMMENT 'feed图片链接4',
  target_ids text NOT NULL COMMENT '产生feed信息允许查看的好友ID ',
  PRIMARY KEY  (feedid),
  KEY uid (uid,dateline),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='应该feed表';

DROP TABLE IF EXISTS pre_home_friend;
CREATE TABLE pre_home_friend (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID ',
  fuid int(10) unsigned NOT NULL default '0' COMMENT '用户好友ID ',
  fusername varchar(15) NOT NULL default '' COMMENT '用户好友名',
  gid smallint(6) unsigned NOT NULL default '0' COMMENT '好友所在的好友组ID ',
  num mediumint(8) unsigned NOT NULL default '0' COMMENT '好友之间的任务关系数',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '加好友的时间戳',
  note varchar(255) NOT NULL default '' COMMENT '好友备注',
  PRIMARY KEY  (uid,fuid),
  KEY fuid (fuid),
  KEY `uid` (uid,num,dateline)
) ENGINE=MyISAM COMMENT='用户好友表';

DROP TABLE IF EXISTS pre_home_friend_request;
CREATE TABLE pre_home_friend_request (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID ',
  fuid int(10) unsigned NOT NULL default '0' COMMENT '被请求用户ID ',
  fusername char(15) NOT NULL default '' COMMENT '被请求用户名称',
  gid smallint(6) unsigned NOT NULL default '0' COMMENT '好友所在的好友组ID ',
  note char(60) NOT NULL default '' COMMENT '申请附言',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '请求好友时间戳',
  PRIMARY KEY  (uid,fuid),
  KEY fuid (fuid),
  KEY `dateline` (uid, dateline)
) ENGINE=MyISAM COMMENT='申请好友表';

DROP TABLE IF EXISTS pre_home_friendlog;
CREATE TABLE pre_home_friendlog (
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID ',
  fuid int(10) unsigned NOT NULL default '0' COMMENT '好友用户ID ',
  `action` varchar(10) NOT NULL default '' COMMENT '好友动作:"add"添加,"update"更新 ',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '好友动作时间',
  PRIMARY KEY  (uid,fuid)
) ENGINE=MyISAM COMMENT='用户好友动作日志表';

DROP TABLE IF EXISTS pre_common_magiclog;
CREATE TABLE pre_common_magiclog (
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  magicid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '道具id',
  action tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作动作 1 购买 2 使用 3 赠送',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  amount smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '操作数量',
  credit tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '操作积分',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '操作价格',
  `targetid` int(10) unsigned NOT NULL DEFAULT '0',
  `idtype` char(6) DEFAULT NULL,
  targetuid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '道具目标uid',
  KEY uid (uid,dateline),
  KEY `action` (`action`),
  KEY targetuid (targetuid,dateline),
  KEY magicid (magicid,dateline)
) ENGINE=MyISAM COMMENT='道具日志表';

DROP TABLE IF EXISTS pre_common_magic;
CREATE TABLE pre_common_magic (
  magicid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '道具id',
  available tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否可用',
  name varchar(50) NOT NULL COMMENT '名称',
  identifier varchar(40) NOT NULL COMMENT '唯一标识',
  description varchar(255) NOT NULL COMMENT '描述',
  displayorder tinyint(3) NOT NULL DEFAULT '0' COMMENT '顺序',
  credit tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用的积分',
  price mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '价格',
  num smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '数量',
  salevolume smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '销售量',
  supplytype tinyint(1) NOT NULL DEFAULT '0' COMMENT '自动补货类型',
  supplynum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '自动补货数量',
  useperoid tinyint(1) NOT NULL DEFAULT '0' COMMENT '使用周期',
  usenum smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '周期使用数量',
  weight tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '重量',
  magicperm text NOT NULL COMMENT '权限',
  useevent tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:只在特定环境使用 1:可以在道具中心使用',
  PRIMARY KEY  (magicid),
  UNIQUE KEY identifier (identifier),
  KEY displayorder (available,displayorder)
) ENGINE=MyISAM COMMENT='道具数据表';

DROP TABLE IF EXISTS pre_home_notification;
CREATE TABLE pre_home_notification (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '通知ID ',
  uid int(10) unsigned NOT NULL default '0' COMMENT '通知用户ID ',
  `type` varchar(20) NOT NULL default '' COMMENT '通知类型:"doing"记录,"friend"好友请求,"sharenotice"好友分享,"post"话题回复, ',
  `new` tinyint(1) NOT NULL default '0' COMMENT '通知是否为新:"1"为新通知,"0"为通知已读 ',
  authorid int(10) unsigned NOT NULL default '0' COMMENT '作者用户ID ',
  author varchar(15) NOT NULL default '' COMMENT '用户名',
  note text NOT NULL COMMENT '通知内容',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '通知产生的时间戳',
  from_id mediumint(8) unsigned NOT NULL default '0' COMMENT '来源对象id',
  from_idtype varchar(20) NOT NULL default '' COMMENT '来源对象类型',
  from_num mediumint(8) unsigned NOT NULL default '0' COMMENT '来源量',
  category tinyint(1) NOT NULL default '0' COMMENT '提醒分类 1我的帖子 2坛友互动 3系统消息 4管理工作 0应用消息',
  PRIMARY KEY  (id),
  KEY uid (uid,new),
  KEY category (uid,category,dateline),
  KEY by_type (uid,type,dateline),
  KEY from_id (from_id,from_idtype)
) ENGINE=MyISAM COMMENT='通知表';

DROP TABLE IF EXISTS pre_home_pic;
CREATE TABLE pre_home_pic (
  picid mediumint(8) NOT NULL auto_increment COMMENT '图片ID ',
  albumid mediumint(8) unsigned NOT NULL default '0' COMMENT '图片所属相册ID ',
  uid int(10) unsigned NOT NULL default '0' COMMENT '图片所属用户ID ',
  username varchar(15) NOT NULL default '' COMMENT '图片所属用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '图片上传时间戳',
  postip varchar(255) NOT NULL default '' COMMENT '图片上传ip',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  filename varchar(255) NOT NULL default '' COMMENT '图片文件名',
  title varchar(255) NOT NULL default '' COMMENT '图片标题',
  `type` varchar(255) NOT NULL default '' COMMENT '图片类型',
  size int(10) unsigned NOT NULL default '0' COMMENT '图片大小',
  filepath varchar(255) NOT NULL default '' COMMENT '图片路径',
  thumb tinyint(1) NOT NULL default '0' COMMENT '是否有缩略图',
  remote tinyint(1) NOT NULL default '0' COMMENT '是否有远程图片0:home本地图片,1:home远程图片,2:论坛本地图片,3论坛远程图片',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '热度',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '图片分享次数',
  click1 smallint(6) unsigned NOT NULL default '0' COMMENT '表态1 id',
  click2 smallint(6) unsigned NOT NULL default '0' COMMENT '表态2 id',
  click3 smallint(6) unsigned NOT NULL default '0' COMMENT '表态3 id',
  click4 smallint(6) unsigned NOT NULL default '0' COMMENT '表态4 id',
  click5 smallint(6) unsigned NOT NULL default '0' COMMENT '表态5 id',
  click6 smallint(6) unsigned NOT NULL default '0' COMMENT '表态6 id',
  click7 smallint(6) unsigned NOT NULL default '0' COMMENT '表态7 id',
  click8 smallint(6) unsigned NOT NULL default '0' COMMENT '表态8 id',
  magicframe tinyint(6) NOT NULL default '0' COMMENT '道具使用相框id',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '图片状态 1-审核',
  PRIMARY KEY  (picid),
  KEY uid (uid),
  KEY albumid (albumid,dateline)
) ENGINE=MyISAM COMMENT='家园图片表';

DROP TABLE IF EXISTS pre_home_picfield;
CREATE TABLE pre_home_picfield (
  picid mediumint(8) unsigned NOT NULL default '0' COMMENT '图片id',
  hotuser text NOT NULL COMMENT '图片对应热点用户',
  PRIMARY KEY  (picid)
) ENGINE=MyISAM COMMENT='家园图片拓展表';

DROP TABLE IF EXISTS pre_home_poke;
CREATE TABLE pre_home_poke (
  uid int(10) unsigned NOT NULL default '0' COMMENT '接招呼的用户ID ',
  fromuid int(10) unsigned NOT NULL default '0' COMMENT '打招呼的用户ID ',
  fromusername varchar(15) NOT NULL default '' COMMENT '打招呼的用户名 ',
  note varchar(255) NOT NULL default '' COMMENT '招呼内容',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '打招呼时间戳',
  iconid smallint(6) unsigned NOT NULL default '0' COMMENT '招呼图标',
  PRIMARY KEY  (uid,fromuid),
  KEY uid (uid,dateline)
) ENGINE=MyISAM COMMENT='用户招呼表';

DROP TABLE IF EXISTS pre_home_pokearchive;
CREATE TABLE pre_home_pokearchive (
  pid mediumint(8) NOT NULL auto_increment COMMENT '招呼历史id',
  pokeuid int(10) unsigned NOT NULL default '0' COMMENT 'uid + fromuid',
  uid int(10) unsigned NOT NULL default '0' COMMENT '目标用户ID',
  fromuid int(10) unsigned NOT NULL default '0' COMMENT '发起用户ID',
  note varchar(255) NOT NULL default '' COMMENT '招呼内容',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '招呼时间戳',
  iconid smallint(6) unsigned NOT NULL default '0' COMMENT '招呼图标',
  PRIMARY KEY  (pid),
  KEY pokeuid (pokeuid)
) ENGINE=MyISAM COMMENT='用户招呼存档表';


DROP TABLE IF EXISTS pre_home_share;
CREATE TABLE pre_home_share (
  sid mediumint(8) unsigned NOT NULL auto_increment COMMENT '分享id',
  itemid mediumint(8) unsigned NOT NULL COMMENT '相关条目的ID',
  `type` varchar(30) NOT NULL default '' COMMENT '分享类型',
  uid int(10) unsigned NOT NULL default '0' COMMENT '分享者用户id',
  username varchar(15) NOT NULL default '' COMMENT '分享者用户名',
  fromuid int(10) unsigned NOT NULL default '0' COMMENT '被分享者用户ID',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '分享时间戳',
  title_template text NOT NULL COMMENT '分享标题模板',
  body_template text NOT NULL COMMENT '分享内容模板',
  body_data text NOT NULL COMMENT '分享内容数据',
  body_general text NOT NULL COMMENT '分享说明',
  image varchar(255) NOT NULL default '' COMMENT '分享的图片',
  image_link varchar(255) NOT NULL default '' COMMENT '分享的图片链接',
  hot mediumint(8) unsigned NOT NULL default '0' COMMENT '热度',
  hotuser text NOT NULL COMMENT '相关热点用户',
  status tinyint(1) NOT NULL COMMENT '分享条目状态 1-审核',
  PRIMARY KEY  (sid),
  KEY uid (uid,dateline),
  KEY hot (hot),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='用户分享表';

DROP TABLE IF EXISTS pre_home_show;
CREATE TABLE pre_home_show (
  uid int(10) unsigned NOT NULL default '0' COMMENT '我要上榜用户id',
  username varchar(15) NOT NULL default '' COMMENT '我要上榜用户名',
  unitprice int(10) unsigned NOT NULL default '1' COMMENT '单次访问单价',
  credit int(10) unsigned NOT NULL default '0' COMMENT '上榜总积分',
  note varchar(100) NOT NULL default '' COMMENT '上榜宣言',
  PRIMARY KEY  (uid),
  KEY unitprice (unitprice),
  KEY credit (credit)
) ENGINE=MyISAM COMMENT='用户上榜表';

DROP TABLE IF EXISTS pre_home_visitor;
CREATE TABLE pre_home_visitor (
  uid int(10) unsigned NOT NULL default '0' COMMENT '受访者用户id',
  vuid int(10) unsigned NOT NULL default '0' COMMENT '访问者用户id',
  vusername char(15) NOT NULL default '' COMMENT '访问者用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '访问时间戳',
  PRIMARY KEY  (uid,vuid),
  KEY vuid (vuid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='空间访问日志表';

DROP TABLE IF EXISTS pre_portal_article_title;
CREATE TABLE pre_portal_article_title (
  aid mediumint(8) unsigned NOT NULL auto_increment COMMENT '文章ID',
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '栏目id',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '用户id',
  username varchar(255) NOT NULL default '' COMMENT '用户名',
  title varchar(255) NOT NULL default '' COMMENT '标题',
  highlight varchar(255) NOT NULL default '' COMMENT '标题样式',
  author varchar(255) NOT NULL default '' COMMENT '原作者',
  `from` varchar(255) NOT NULL default '' COMMENT '来源',
  fromurl varchar(255) NOT NULL default '' COMMENT '来源URL',
  url varchar(255) NOT NULL default '' COMMENT '访问URL',
  summary varchar(255) NOT NULL default '' COMMENT '摘要',
  pic varchar(255) NOT NULL default '' COMMENT '封面图片',
  thumb tinyint(1) NOT NULL default '0' COMMENT '封面图片是否缩略',
  remote tinyint(1) NOT NULL default '0' COMMENT '封面图片是否远程',
  id int(10) unsigned NOT NULL default '0' COMMENT '来源ID',
  idtype varchar(255) NOT NULL default '' COMMENT '来源ID类型',
  contents smallint(6) NOT NULL default '0' COMMENT '内容分页数',
  allowcomment tinyint(1) NOT NULL default '0' COMMENT '是否允许评论',
  owncomment tinyint(1) NOT NULL default '0' COMMENT '对于推送过来的文章：1，使用文章评论；0，同步原主题/日志的帖子/评论',
  click1 smallint(6) unsigned NOT NULL default '0' COMMENT '表态1 id',
  click2 smallint(6) unsigned NOT NULL default '0' COMMENT '表态2 id',
  click3 smallint(6) unsigned NOT NULL default '0' COMMENT '表态3 id',
  click4 smallint(6) unsigned NOT NULL default '0' COMMENT '表态4 id',
  click5 smallint(6) unsigned NOT NULL default '0' COMMENT '表态5 id',
  click6 smallint(6) unsigned NOT NULL default '0' COMMENT '表态6 id',
  click7 smallint(6) unsigned NOT NULL default '0' COMMENT '表态7 id',
  click8 smallint(6) unsigned NOT NULL default '0' COMMENT '表态8 id',
  tag tinyint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章属性，共八位',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '添加时间',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '文章状态 0-已审核 1-需要审核 2-已忽略',
  showinnernav tinyint(1) unsigned NOT NULL default '0' COMMENT '是否显示分页导航',
  preaid mediumint(8) unsigned NOT NULL COMMENT '上一篇文章ID',
  nextaid mediumint(8) unsigned NOT NULL COMMENT '下一篇文章ID',
  htmlmade tinyint(1) unsigned NOT NULL default '0' COMMENT '是否生成静态文件',
  htmlname varchar(255) NOT NULL DEFAULT '' COMMENT '静态文件名称',
  htmldir varchar(255) NOT NULL DEFAULT '' COMMENT '静态文件目录',
  PRIMARY KEY  (aid),
  KEY catid  (catid,dateline)
) ENGINE=MyISAM COMMENT='门户文章标题表';

DROP TABLE IF EXISTS pre_portal_article_content;
CREATE TABLE pre_portal_article_content (
  cid int(10) unsigned NOT NULL auto_increment COMMENT '内容ID',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '文章ID',
  id int(10) unsigned NOT NULL default '0' COMMENT '来源ID',
  idtype varchar(255) NOT NULL default '' COMMENT '来源ID类型',
  title varchar(255) NOT NULL default '' COMMENT '分页标题',
  content text NOT NULL COMMENT '文章内容',
  pageorder smallint(6) unsigned NOT NULL default '0' COMMENT '分页排序',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '添加时间',
  PRIMARY KEY  (cid),
  KEY aid  (aid,pageorder),
  KEY pageorder  (pageorder)
) ENGINE=MyISAM COMMENT='门户文章内容表';

DROP TABLE IF EXISTS pre_portal_article_count;
CREATE TABLE pre_portal_article_count (
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '文章ID',
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '栏目id',
  viewnum mediumint(8) unsigned NOT NULL default '0' COMMENT '查看数',
  commentnum mediumint(8) unsigned NOT NULL default '0' COMMENT '评论数',
  favtimes mediumint(8) unsigned NOT NULL default '0' COMMENT '文章收藏次数',
  sharetimes mediumint(8) unsigned NOT NULL default '0' COMMENT '文章分享次数',
  PRIMARY KEY  (aid)
) ENGINE=MyISAM COMMENT='门户文章统计数据表';

DROP TABLE IF EXISTS pre_portal_article_trash;
CREATE TABLE pre_portal_article_trash (
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '垃圾文章ID',
  content text NOT NULL COMMENT '文章数据的seriallize存储',
  PRIMARY KEY (aid)
) ENGINE=MyISAM COMMENT='门户文章回收站表';

DROP TABLE IF EXISTS pre_portal_comment;
CREATE TABLE pre_portal_comment (
  cid mediumint(8) unsigned NOT NULL auto_increment COMMENT '评论id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '发表评论的用户id',
  username varchar(255) NOT NULL default '' COMMENT '发表评论的用户名',
  id mediumint(8) unsigned NOT NULL default '0' COMMENT '评论对象id',
  idtype varchar(20) NOT NULL default '' COMMENT '评论对象的id类型：aid，topicid',
  postip varchar(255) NOT NULL default '' COMMENT '评论IP ',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '评论时间戳',
  status tinyint(1) unsigned NOT NULL default '0' COMMENT '评论状态 1-审核',
  message text NOT NULL COMMENT '评论内容',
  PRIMARY KEY  (cid),
  KEY idtype (id,idtype,dateline)
) ENGINE=MyISAM COMMENT='门户评论表';

DROP TABLE IF EXISTS pre_portal_rsscache;
CREATE TABLE pre_portal_rsscache (
  lastupdate int(10) unsigned NOT NULL default '0' COMMENT '最后更新时间',
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '文章分类id',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '文章id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '发表时间',
  catname char(50) NOT NULL default '' COMMENT '分类名称',
  author char(15) NOT NULL default '' COMMENT '作者',
  subject char(80) NOT NULL default '' COMMENT '标题',
  description char(255) NOT NULL default '' COMMENT '解释说明',
  UNIQUE KEY aid (aid),
  KEY catid (catid,dateline)
) ENGINE=MyISAM COMMENT='文章rss缓存表';

DROP TABLE IF EXISTS pre_portal_topic;
CREATE TABLE pre_portal_topic (
  topicid mediumint(8) unsigned NOT NULL auto_increment COMMENT '专题ID',
  title varchar(255) NOT NULL default '' COMMENT '专题标题',
  name varchar(255) NOT NULL default '' COMMENT '静态化名称',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '二级域名',
  summary text NOT NULL COMMENT '专题介绍',
  keyword text NOT NULL COMMENT 'SEO 关键字',
  cover varchar(255) NOT NULL default '' COMMENT '专题封面',
  picflag tinyint(1) NOT NULL default '0' COMMENT '图片类型 0为url 1为本地 2 为ftp远程',
  primaltplname varchar(255) NOT NULL default '' COMMENT '原模板地址',
  useheader tinyint(1) NOT NULL default '0' COMMENT '是否使用网站导航内容',
  usefooter tinyint(1) NOT NULL default '0' COMMENT '是否使用网站尾部信息',
  uid int(10) unsigned NOT NULL default '0' COMMENT '创建者UID',
  username varchar(255) NOT NULL default '' COMMENT '创建者用户名',
  viewnum mediumint(8) unsigned NOT NULL default '0' COMMENT '查看数',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '创建时间',
  closed tinyint(1) NOT NULL default '0' COMMENT '是否关闭状态',
  allowcomment tinyint(1) NOT NULL default '0' COMMENT '是否允许评论',
  commentnum mediumint(8) unsigned NOT NULL default '0' COMMENT '评论数',
  htmlmade tinyint(1) unsigned NOT NULL default '0' COMMENT '是否生成静态文件',
  htmldir varchar(255) NOT NULL DEFAULT '' COMMENT '静态文件目录',
  PRIMARY KEY  (topicid),
  KEY name (name)
) ENGINE=MyISAM COMMENT='门户专题表';

DROP TABLE IF EXISTS pre_portal_topic_pic;
CREATE TABLE pre_portal_topic_pic (
  picid mediumint(8) NOT NULL auto_increment COMMENT '图片ID ',
  topicid mediumint(8) unsigned NOT NULL default '0' COMMENT '图片所属专题ID ',
  uid int(10) unsigned NOT NULL default '0' COMMENT '图片所属用户ID ',
  username varchar(15) NOT NULL default '' COMMENT '图片所属用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '图片上传时间戳',
  filename varchar(255) NOT NULL default '' COMMENT '图片文件名',
  title varchar(255) NOT NULL default '' COMMENT '图片标题',
  size int(10) unsigned NOT NULL default '0' COMMENT '图片大小',
  filepath varchar(255) NOT NULL default '' COMMENT '图片路径',
  thumb tinyint(1) NOT NULL default '0' COMMENT '是否有缩略图',
  remote tinyint(1) NOT NULL default '0' COMMENT '是否有远程图片',
  PRIMARY KEY  (picid),
  KEY topicid (topicid)
) ENGINE=MyISAM COMMENT='门户专题图片表';

DROP TABLE IF EXISTS pre_common_diy_data;
CREATE TABLE pre_common_diy_data (
  targettplname varchar(100) NOT NULL default '' COMMENT '目标模板文件名',
  tpldirectory varchar(80) NOT NULL default '' COMMENT '原模板所在目录',
  primaltplname varchar(255) NOT NULL default '' COMMENT '原模板文件名',
  diycontent mediumtext NOT NULL COMMENT 'DIY的内容',
  `name` varchar(255) NOT NULL default '' COMMENT '目标模板页面名称',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username varchar(15) NOT NULL default '' COMMENT '用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '更新时间',
  PRIMARY KEY (targettplname, tpldirectory)
) ENGINE=MyISAM COMMENT='DIY模板页面数据的存档表';

DROP TABLE IF EXISTS pre_common_template_block;
CREATE TABLE pre_common_template_block (
  targettplname varchar(100) NOT NULL default '' COMMENT '目标模板文件名',
  tpldirectory varchar(80) NOT NULL default '' COMMENT '原模板所在目录',
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块ID',
  PRIMARY KEY  (targettplname, tpldirectory, bid),
  KEY bid (bid)
) ENGINE=MyISAM COMMENT='模板页面和模块的关联表';

DROP TABLE IF EXISTS pre_common_template_permission;
CREATE TABLE pre_common_template_permission (
  targettplname varchar(100) NOT NULL DEFAULT '' COMMENT '目标模板',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许管理',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许推荐',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐需要审核',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '继承自的模板名称',
  PRIMARY KEY (targettplname,uid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='DIY模板页面权限表';

DROP TABLE IF EXISTS pre_common_block_permission;
CREATE TABLE pre_common_block_permission (
  bid mediumint(8) unsigned NOT NULL default '0' COMMENT '模块ID',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  allowmanage tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许管理',
  allowrecommend tinyint(1) NOT NULL DEFAULT '0' COMMENT '允许推荐',
  needverify tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐需要审核',
  inheritedtplname varchar(255) NOT NULL DEFAULT '' COMMENT '继承自的模板名称',
  PRIMARY KEY (bid, uid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='模块权限表';

DROP TABLE IF EXISTS pre_portal_category_permission;
CREATE TABLE pre_portal_category_permission (
  catid mediumint(8) unsigned NOT NULL default '0' COMMENT '分类ID',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  allowpublish tinyint(1) NOT NULL default '0' COMMENT '允许发布文章',
  allowmanage tinyint(1) NOT NULL default '0' COMMENT '允许管理文章',
  inheritedcatid mediumint(8) NOT NULL DEFAULT '0' COMMENT '继承自的频道ID',
  PRIMARY KEY (catid, uid),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='文章分类权限表';

DROP TABLE IF EXISTS pre_portal_category;
CREATE TABLE pre_portal_category (
  catid mediumint(8) unsigned NOT NULL auto_increment COMMENT '栏目id',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '上级栏目id',
  catname varchar(255) NOT NULL default '' COMMENT '标题',
  articles mediumint(8) unsigned NOT NULL default '0' COMMENT '文章数',
  allowcomment tinyint(1) NOT NULL default '1' COMMENT '是否允许评论',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  notinheritedarticle tinyint(1) NOT NULL default '0' COMMENT '是否不继承上级文章管理权限',
  notinheritedblock tinyint(1) NOT NULL default '0' COMMENT '是否不继承上级DIY页面和模块权限',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '二级域名',
  url varchar(255) NOT NULL DEFAULT '' COMMENT '自定义链接',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者ID',
  username varchar(255) NOT NULL DEFAULT '' COMMENT '创建者用户名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  closed tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭',
  shownav tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否在导航显示',
  description text NOT NULL COMMENT '分类介绍 SEO描述',
  seotitle text NOT NULL COMMENT 'SEO 标题',
  keyword text NOT NULL COMMENT 'SEO 关键字',
  primaltplname varchar(255) NOT NULL default '' COMMENT '列表页原模板地址',
  articleprimaltplname varchar(255) NOT NULL default '' COMMENT '文章页原模板地址',
  disallowpublish tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁止发布文章',
  foldername varchar(255) NOT NULL DEFAULT '' COMMENT '文件夹名称',
  notshowarticlesummay varchar(255) NOT NULL DEFAULT '' COMMENT '文章内容页是否不显示摘要',
  perpage smallint(6) NOT NULL default '0' COMMENT '列表每页显示文章数',
  maxpages smallint(6) NOT NULL default '0' COMMENT '列表最大分页数',
  noantitheft tinyint(1) NOT NULL default '0' COMMENT '禁止防采集',
  lastpublish int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发布文章时间',
  PRIMARY KEY  (catid)
) ENGINE=MyISAM COMMENT='门户 文章栏目表';

DROP TABLE IF EXISTS pre_common_process;
CREATE TABLE pre_common_process (
  processid char(32) NOT NULL COMMENT '锁名称的md5',
  expiry int(10) DEFAULT NULL COMMENT '锁的过期时间',
  extra int(10) DEFAULT NULL COMMENT '锁的附属信息',
  PRIMARY KEY (processid),
  KEY expiry (expiry)
) ENGINE=MEMORY COMMENT='进程锁管理';

DROP TABLE IF EXISTS pre_common_admincp_group;
CREATE TABLE pre_common_admincp_group (
 cpgroupid smallint(6) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台组id',
 cpgroupname varchar(255) NOT NULL COMMENT '后台组名称',
 PRIMARY KEY (cpgroupid)
) ENGINE=MyISAM COMMENT='后台管理组';

DROP TABLE IF EXISTS pre_common_admincp_member;
CREATE TABLE pre_common_admincp_member (
 uid int(10) unsigned NOT NULL COMMENT '成员uid',
 cpgroupid int(10) unsigned NOT NULL COMMENT '成员组id',
 customperm text NOT NULL COMMENT '自定义管理权限',
 PRIMARY KEY (uid)
) ENGINE=MyISAM COMMENT='后台管理成员';

DROP TABLE IF EXISTS pre_common_admincp_perm;
CREATE TABLE pre_common_admincp_perm (
 cpgroupid smallint(6) unsigned NOT NULL COMMENT '后台组id',
 perm varchar(255) NOT NULL COMMENT '后台组权限',
 UNIQUE KEY cpgroupperm (cpgroupid,perm)
) ENGINE=MyISAM COMMENT='后台权限表';

DROP TABLE IF EXISTS pre_common_admincp_session;
CREATE TABLE pre_common_admincp_session (
 uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
 adminid smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
 panel tinyint(1) NOT NULL DEFAULT '0' COMMENT '面板位置',
 ip varchar(15) NOT NULL DEFAULT '' COMMENT 'IP',
 dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后动作时间',
 errorcount tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录错误次数',
 storage mediumtext NOT NULL COMMENT '临时内容存储',
 PRIMARY KEY (uid,panel)
) ENGINE=MyISAM COMMENT='后台session表';

DROP TABLE IF EXISTS pre_portal_attachment;
CREATE TABLE pre_portal_attachment (
  attachid mediumint(8) unsigned NOT NULL auto_increment COMMENT '附件id',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '上传时间',
  filename varchar(255) NOT NULL default '' COMMENT '原文件名',
  filetype varchar(255) NOT NULL default '' COMMENT '文件类型',
  filesize int(10) unsigned NOT NULL default '0' COMMENT '文件大小',
  attachment varchar(255) NOT NULL default '' COMMENT '服务器路径',
  isimage tinyint(1) NOT NULL default '0' COMMENT '是否图片',
  thumb tinyint(1) unsigned NOT NULL default '0' COMMENT '是否是缩率图',
  remote tinyint(1) unsigned NOT NULL default '0' COMMENT '是否远程附件',
  aid mediumint(8) unsigned NOT NULL default '0' COMMENT '文章id',
  PRIMARY KEY  (attachid),
  KEY aid (aid,attachid)
) ENGINE=MyISAM COMMENT='门户文章附件表';

DROP TABLE IF EXISTS pre_portal_article_related;
CREATE TABLE pre_portal_article_related (
  aid mediumint(8) unsigned NOT NULL auto_increment COMMENT '文章ID',
  raid mediumint(8) unsigned NOT NULL default '0' COMMENT '相关文章ID',
  displayorder mediumint(8) unsigned NOT NULL default '0' COMMENT '显示顺序',
  PRIMARY KEY  (aid,raid),
  KEY aid  (aid,displayorder)
) ENGINE=MyISAM COMMENT='门户相关文章';

DROP TABLE IF EXISTS pre_home_specialuser;
CREATE TABLE pre_home_specialuser (
 uid int(10) unsigned NOT NULL default '0' COMMENT '用户ID',
 username varchar(15) NOT NULL default '' COMMENT '用户名',
 status tinyint(1) unsigned NOT NULL default '0' COMMENT '用户类型0为推荐用户1为默认好友',
 dateline int(10) NOT NULL default '0' COMMENT '设置时间',
 reason text NOT NULL COMMENT '操作原因',
 opuid int(10) unsigned NOT NULL default '0' COMMENT '操作者用户ID',
 opusername varchar(15) NOT NULL default '' COMMENT '操作者用户名',
 displayorder mediumint(8) unsigned NOT NULL default '0' COMMENT '显示顺序',
 KEY uid (uid,status),
 KEY displayorder (status,displayorder)
) ENGINE=MyISAM COMMENT='特殊用户表';

DROP TABLE IF EXISTS pre_common_district;
CREATE TABLE pre_common_district (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '地区ID',
  `name` varchar(255) NOT NULL default '' COMMENT '地区名称',
  `level` tinyint(4) unsigned NOT NULL default '0' COMMENT '地区等级：1，省级；2，市级；3，县级；4，乡镇',
  usetype tinyint(1) unsigned NOT NULL default '0' COMMENT '使用对象：0:都不启用; 1:出生地; 2:居住地; 3:都启用',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '上级地区ID',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  PRIMARY KEY  (id),
  KEY upid (upid,displayorder)
) ENGINE=MyISAM COMMENT='地区表';

DROP TABLE IF EXISTS pre_forum_grouplevel;
CREATE TABLE pre_forum_grouplevel (
  levelid smallint(6) unsigned NOT NULL auto_increment COMMENT '等级ID',
  `type` enum('special','default') NOT NULL default 'default' COMMENT '类型',
  leveltitle varchar(255) NOT NULL default '' COMMENT '群组等级名称',
  creditshigher int(10) NOT NULL default '0' COMMENT '该等级的积分上限',
  creditslower int(10) NOT NULL default '0' COMMENT '该等级的积分下限',
  icon varchar(255) NOT NULL default '' COMMENT '等级图标',
  creditspolicy text NOT NULL COMMENT '积分策略',
  postpolicy text NOT NULL COMMENT '帖子策略',
  specialswitch text NOT NULL COMMENT '特殊开能开关',
  PRIMARY KEY (levelid),
  KEY creditsrange (creditshigher,creditslower)
) ENGINE=MyISAM COMMENT='群组等级表';

DROP TABLE IF EXISTS pre_forum_groupcreditslog;
CREATE TABLE pre_forum_groupcreditslog (
  fid mediumint(8) unsigned NOT NULL COMMENT '群组ID',
  uid int(10) unsigned NOT NULL COMMENT '成员UID',
  logdate int(8) NOT NULL default '0' COMMENT '日期/20100308',
  PRIMARY KEY  (fid,uid,logdate)
) ENGINE=MyISAM COMMENT='群组积分日志表';

DROP TABLE IF EXISTS pre_home_blog_category;
CREATE TABLE pre_home_blog_category (
  catid mediumint(8) unsigned NOT NULL auto_increment COMMENT '栏目id',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '上级栏目id',
  catname varchar(255) NOT NULL default '' COMMENT '标题',
  num mediumint(8) unsigned NOT NULL default '0' COMMENT '日志数',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  PRIMARY KEY  (catid)
) ENGINE=MyISAM COMMENT='日志系统栏目';

DROP TABLE IF EXISTS pre_home_album_category;
CREATE TABLE pre_home_album_category (
  catid mediumint(8) unsigned NOT NULL auto_increment COMMENT '栏目id',
  upid mediumint(8) unsigned NOT NULL default '0' COMMENT '上级栏目id',
  catname varchar(255) NOT NULL default '' COMMENT '标题',
  num mediumint(8) unsigned NOT NULL default '0' COMMENT '相册数',
  displayorder smallint(6) NOT NULL default '0' COMMENT '显示顺序',
  PRIMARY KEY  (catid)
) ENGINE=MyISAM COMMENT='相册系统栏目';

DROP TABLE IF EXISTS pre_common_report;
CREATE TABLE pre_common_report (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT '记录id',
  urlkey char(32) NOT NULL default '' COMMENT '地址md5',
  url varchar(255) NOT NULL default '' COMMENT '地址',
  message text NOT NULL COMMENT '举报理由',
  uid int(10) unsigned NOT NULL default '0' COMMENT '会员id',
  username varchar(15) NOT NULL default '' COMMENT '用户名',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '举报时间',
  num smallint(6) unsigned NOT NULL default '1' COMMENT '举报次数',
  opuid int(10) unsigned NOT NULL default '0' COMMENT '管理员id',
  opname varchar(15) NOT NULL default '' COMMENT '管理员姓名',
  optime int(10) unsigned NOT NULL default '0' COMMENT '处理时间',
  opresult varchar(255) NOT NULL default '' COMMENT '对举报人的奖惩',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '论坛id',
  PRIMARY KEY  (id),
  KEY urlkey (urlkey),
  KEY fid (fid)
) ENGINE=MyISAM COMMENT='用户举报表';

DROP TABLE IF EXISTS pre_common_patch;
CREATE TABLE pre_common_patch (
  serial varchar(10) NOT NULL default '' COMMENT '漏洞编号',
  rule text NOT NULL COMMENT '修补规则',
  note text NOT NULL COMMENT '漏洞说明',
  `status` tinyint(1) NOT NULL default '0' COMMENT '修补状态',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '漏洞发布时间',
  PRIMARY KEY  (serial)
) ENGINE=MyISAM COMMENT='漏洞补丁表';

DROP TABLE IF EXISTS pre_forum_collection;
CREATE TABLE pre_forum_collection (
  ctid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '专辑ID',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '专辑名',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  follownum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '订阅数',
  threadnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题数',
  commentnum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  lastupdate int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后变动时间',
  rate float NOT NULL DEFAULT '0' COMMENT '评分',
  ratenum mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '评分次数',
  lastpost mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '最后主题ID',
  lastsubject varchar(80) NOT NULL DEFAULT '' COMMENT '最后主题标题',
  lastposttime int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后主题时间',
  lastposter varchar(15) NOT NULL DEFAULT '' COMMENT '最后主题发帖者',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建者最后访问',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '专辑关键词',
  PRIMARY KEY (ctid),
  KEY dateline (dateline),
  KEY hotcollection (threadnum,lastupdate),
  KEY follownum (follownum),
  KEY uid (uid)
) ENGINE=MyISAM COMMENT='淘帖专辑表';

DROP TABLE IF EXISTS pre_forum_collectioncomment;
CREATE TABLE pre_forum_collectioncomment (
  cid mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  message text NOT NULL COMMENT '评论内容',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论时间',
  useip varchar(16) NOT NULL DEFAULT '' COMMENT 'IP地址',
  port smallint(6) unsigned NOT NULL default '0' COMMENT '端口号',
  rate float NOT NULL DEFAULT '0' COMMENT '评分',
  PRIMARY KEY (cid),
  KEY ctid (ctid,dateline),
  KEY userrate (ctid,uid,rate)
) ENGINE=MyISAM COMMENT='淘帖评论表';

DROP TABLE IF EXISTS pre_forum_collectionfollow;
CREATE TABLE pre_forum_collectionfollow (
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  username char(15) NOT NULL DEFAULT '' COMMENT '用户名',
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '关注时间',
  lastvisit int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问专辑时间',
  PRIMARY KEY (uid,ctid),
  KEY ctid (ctid,dateline)
) ENGINE=MyISAM COMMENT='淘帖关注表';

DROP TABLE IF EXISTS pre_forum_collectioninvite;
CREATE TABLE pre_forum_collectioninvite (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请合作者ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '邀请时间',
  PRIMARY KEY (ctid,uid),
  KEY dateline (dateline)
) ENGINE=MyISAM COMMENT='邀请管理淘专辑';

DROP TABLE IF EXISTS pre_forum_collectionrelated;
CREATE TABLE pre_forum_collectionrelated (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  collection text NOT NULL COMMENT '专辑列表',
  PRIMARY KEY (tid)
) ENGINE=MyISAM COMMENT='淘帖主题被收入专辑表';

DROP TABLE IF EXISTS pre_forum_collectionteamworker;
CREATE TABLE pre_forum_collectionteamworker (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '合作者ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '专辑名',
  username varchar(15) NOT NULL DEFAULT '' COMMENT '用户名',
  lastvisit int(8) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问专辑时间',
  PRIMARY KEY (ctid,uid)
) ENGINE=MyISAM COMMENT='淘帖合作编辑表';

DROP TABLE IF EXISTS pre_forum_collectionthread;
CREATE TABLE pre_forum_collectionthread (
  ctid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '专辑ID',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '专辑内主题ID',
  dateline int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主题日期',
  reason varchar(255) NOT NULL DEFAULT '' COMMENT '推荐理由',
  PRIMARY KEY (ctid,tid),
  KEY ctid (ctid,dateline)
) ENGINE=MyISAM COMMENT='淘帖包含主题表';

DROP TABLE IF EXISTS pre_forum_hotreply_number;
CREATE TABLE pre_forum_hotreply_number (
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  support smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '支持数',
  against smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '反对数',
  total mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '总数',
  PRIMARY KEY (pid),
  KEY tid (tid,total)
) ENGINE=MyISAM COMMENT='回帖投票';

DROP TABLE IF EXISTS pre_forum_hotreply_member;
CREATE TABLE pre_forum_hotreply_member (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  uid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  attitude tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户投票值',
  PRIMARY KEY (pid,uid)
) ENGINE=MyISAM COMMENT='回帖投票会员记录表';

DROP TABLE IF EXISTS pre_forum_filter_post;
CREATE TABLE pre_forum_filter_post (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '主题ID',
  pid int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子ID',
  postlength int(10) unsigned NOT NULL DEFAULT '0' COMMENT '帖子真实长度',
  PRIMARY KEY (tid,pid),
  KEY tid (tid,postlength)
) ENGINE=MyISAM COMMENT='非水帖标记';

DROP TABLE IF EXISTS pre_common_optimizer;
CREATE TABLE pre_common_optimizer (
  `k` char(100) NOT NULL DEFAULT '' COMMENT '记录键值',
  `v` char(255) NOT NULL DEFAULT '' COMMENT '记录对应数据',
  PRIMARY KEY (`k`)
) ENGINE=MyISAM COMMENT='优化大师的记录数据';

DROP TABLE IF EXISTS pre_forum_sofa;
CREATE TABLE pre_forum_sofa (
  tid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '零回复主题id',
  fid mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '版块id',
  PRIMARY KEY (tid),
  KEY ftid (fid,tid)
) ENGINE=MyISAM COMMENT='抢沙发列表';

DROP TABLE IF EXISTS pre_forum_threadprofile;
CREATE TABLE pre_forum_threadprofile (
  id mediumint(8) unsigned NOT NULL auto_increment COMMENT 'id',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '名称',
  template text NOT NULL COMMENT '模板',
  `global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '全局',
  PRIMARY KEY (id),
  KEY `global` (`global`)
) ENGINE=MyISAM COMMENT='贴内用户信息设置';

DROP TABLE IF EXISTS pre_forum_threadprofile_group;
CREATE TABLE pre_forum_threadprofile_group (
  gid mediumint(8) NOT NULL COMMENT '关联用户组、认证组id',
  tpid mediumint(8) unsigned NOT NULL COMMENT 'id',
  PRIMARY KEY (gid)
) ENGINE=MyISAM COMMENT='贴内用户信息用户组';

DROP TABLE IF EXISTS pre_forum_newthread;
CREATE TABLE pre_forum_newthread (
  tid mediumint(8) unsigned NOT NULL default '0' COMMENT '主题ID',
  fid mediumint(8) unsigned NOT NULL default '0' COMMENT '版块ID',
  dateline int(10) unsigned NOT NULL default '0' COMMENT '日期',
  PRIMARY KEY (`tid`),
  KEY `fid` (`fid`),
  KEY `dateline` (`dateline`)
) ENGINE=MyISAM COMMENT='最新主题表';

DROP TABLE IF EXISTS pre_common_seccheck;
CREATE TABLE pre_common_seccheck (
  `ssid` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dateline` int(10) NOT NULL COMMENT '时间',
  `code` char(6) NOT NULL COMMENT '字符',
  `succeed` tinyint(1) NOT NULL COMMENT '成功次数',
  `verified` tinyint(1) NOT NULL COMMENT '校验次数',
  PRIMARY KEY (`ssid`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`),
  KEY `verified` (`verified`)
) ENGINE=MEMORY COMMENT='验证码表';
