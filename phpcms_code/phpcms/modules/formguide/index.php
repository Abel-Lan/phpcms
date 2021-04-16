<?php
defined('IN_PHPCMS') or exit('No permission resources.');
define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

class index {
	private $db, $m_db, $M;
	function __construct() {
		$this->db = pc_base::load_model('sitemodel_model');
		$this->m_db = pc_base::load_model('sitemodel_field_model');
		$this->M = new_html_special_chars(getcache('formguide', 'commons'));
		$this->siteid = intval($_GET['siteid']) ? intval($_GET['siteid']) : get_siteid();
		$this->M = $this->M[$this->siteid];
	}
	
	/**
	 * 表单向导首页
	 */
	public function index() {
		$siteid = $this->siteid;
		$SEO = seo($this->siteid, '', L('formguide_list'));
		$page = max(intval($_GET['page']), 1);
		$r = $this->db->get_one(array('siteid'=>$this->siteid, 'type'=>3, 'disabled'=>0), 'COUNT(`modelid`) AS sum');
		$total = $r['sum'];
		$pages = pages($total, $page, 20);
		$offset = ($page-1)*20;
		$datas = $this->db->select(array('siteid'=>$this->siteid, 'type'=>3, 'disabled'=>0), 'modelid, name, addtime', $offset.',20', '`modelid` DESC');
		include template('formguide', 'index');
	}
	
	/**
	 * 表单展示
	 */
	public function show() {
		$CATEGORYS = getcache('category_content_'.$this->siteid,'commons');// Abel Lan add 2017-9-1,表单向导无法显示部分菜单
		if (!isset($_GET['formid']) || empty($_GET['formid'])) {
			$_GET['action'] ? exit : showmessage(L('form_no_exist'), HTTP_REFERER);
		}
		$siteid = $_GET['siteid'] ? intval($_GET['siteid']) : 1;
		$formid = intval($_GET['formid']);
		$r = $this->db->get_one(array('modelid'=>$formid, 'siteid'=>$siteid, 'disabled'=>0), 'tablename, setting');
		if (!$r) {
			$_GET['action'] ? exit : showmessage(L('form_no_exist'), HTTP_REFERER);
		}
		$setting = string2array($r['setting']);
		if ($setting['enabletime']) {
			if ($setting['starttime']>SYS_TIME || ($setting['endtime']+3600*24)<SYS_TIME) {
				$_GET['action'] ? exit : showmessage(L('form_expired'), APP_PATH.'index.php?m=formguide&c=index&a=index');
			}
		}
		$userid = param::get_cookie('_userid');
		if ($setting['allowunreg']==0 && !$userid && $_GET['action']!='js') showmessage(L('please_login_in'), APP_PATH.'index.php?m=member&c=index&a=login&forward='.urlencode(HTTP_REFERER));
		if (isset($_POST['dosubmit'])) {
			$tablename = 'form_' . $r['tablename'];
			$this->m_db->change_table($tablename);

			$data = array();
			require CACHE_MODEL_PATH . 'formguide_input.class.php';
			$formguide_input = new formguide_input($formid);
			$data = new_addslashes($_POST['info']);
			/*
			 * 修改者：Abel Lan
			 * 修改日期：2017-8-28
			 * 修改目的：直接通过input提交保存图片
			 * 修改编号：post-img-save-001
			 * */
			//post-img-save-001添加内容开始
			if ($formid == 12){
				$session_storage = 'session_'.pc_base::load_config('system','session_storage');
				pc_base::load_sys_class($session_storage);
				session_start();
				if(isset($_POST['token']) && $_POST['token'] != $_SESSION['token'])
					showmessage('非法提交或请勿重复提交',HTTP_REFERER);
				$upload_dir = 'PhotosWall/';
				$img_result = $this->upload('img_address', 'member', 0, $upload_dir);
				$upload_url = pc_base::load_config('system','upload_url');
				$data['img_address'] = $upload_url . $img_result;
			}
			//post-img-save-001添加内容结束

			$data = new_html_special_chars($data);
			$data = $formguide_input->get($data);
			$data['userid'] = $userid;
			$data['username'] = param::get_cookie('_username');
			$data['datetime'] = SYS_TIME;
			$data['ip'] = ip();
			$dataid = $this->m_db->insert($data, true);
			if ($dataid) {
				if ($setting['sendmail']) {
					pc_base::load_sys_func('mail');
					$mails = explode(',', $setting['mails']);
					if (is_array($mails)) {
						foreach ($mails as $m) {
							sendmail($m, L('tips'), $this->M['mailmessage']);
						}
					}
				}
				$this->db->update(array('items'=>'+=1'), array('modelid'=>$formid, 'siteid'=>$this->siteid));
			}
			/*
			 * 修改者：Abel Lan
			 * 修改日期：2017-8-28
			 * 修改目的：上传成功后跳转提示页面修改
			 * 修改编号：form-12-redirect-fix-001
			 * */
			//showmessage(L('thanks'),HTTP_REFERER); //form-34-redirect-fix-001修改前
			//form-12-redirect-fix-001添加内容开始
			$msg = L('thanks').'<br />您的图片已经上传成功，请耐心等待审核。';
			$msg .= '<br /><br /><link href="'.APP_PATH.'/statics/css/upload_photo.css" rel="stylesheet" type="text/css">';
			$msg .= '<a id="continue-add" class="form-btn" href="'.HTTP_REFERER.'" target="_self">继续添加</a>';
			$msg .= '<a id="view-photo-wall" class="form-btn" href="/index.php?m=content&c=index&a=lists&catid=6" target="_blank">查看照片墙</a>';
			if($formid == 12){
				$_SESSION['token'] = '';
				showmessage($msg, '/index.php?m=content&c=index&a=lists&catid=6', 5000);
			}else{
				showmessage(L('thanks'),HTTP_REFERER);
			}
			//form-12-redirect-fix-001添加内容开始
		} else {
			/*
			 * 修改者：Abel Lan
			 * 修改日期：2017-9-7
			 * 修改目的：添加表单验证token
			 * 修改编号：form-add-token-001
			 * */
			//form-add-token-001添加内容开始
			$session_storage = 'session_'.pc_base::load_config('system','session_storage');
			pc_base::load_sys_class($session_storage);
			session_start();
			$str_rand = random(6,'abcdefghigklmnopqrstuvwxwyABCDEFGHIGKLMNOPQRSTUVWXWY0123456789');
			$_SESSION['token'] = md5(microtime(true) . $str_rand);
			//form-add-token-001添加内容结束

			if ($setting['allowunreg']==0 && !$userid && $_GET['action']=='js') {
				$no_allowed = 1;
			}
			pc_base::load_sys_class('form', '', '');
			$f_info = $this->db->get_one(array('modelid'=>$formid, 'siteid'=>$this->siteid));
			extract($f_info);
			$tablename = 'form_'.$r['tablename'];
			$this->m_db->change_table($tablename);
			$ip = ip();
			$where = array();
			if ($userid) $where = array('userid'=>$userid);
			else $where = array('ip'=>$ip);
			$re = $this->m_db->get_one($where, 'datetime');
			$setting = string2array($setting);
			if (($setting['allowmultisubmit']==0 && $re['datetime']) || ((SYS_TIME-$re['datetime'])<$this->M['interval']*60)) {
				$_GET['action'] ? exit : showmessage(L('had_participate'), APP_PATH.'index.php?m=formguide&c=index&a=index');
			}
			
			require CACHE_MODEL_PATH.'formguide_form.class.php';
			$formguide_form = new formguide_form($formid, $no_allowed);
			$forminfos_data = $formguide_form->get();
			$SEO = seo($this->siteid, L('formguide'), $name);
			if (isset($_GET['action']) && $_GET['action']=='js') {
				if(!function_exists('ob_gzhandler')) ob_clean();
				ob_start();
			}
			$template = ($_GET['action']=='js') ? $js_template : $show_template;
			include template('formguide', $template, $default_style);
			if (isset($_GET['action']) && $_GET['action']=='js') {
				$data=ob_get_contents();
				ob_clean();
				exit(format_js($data));
			}
		}
	}
	/**
	 * 修改者：Abel Lan
	 * 修改日期：2017-8-28
	 * 修改目的：上传附件直接保存
	 */
	public function upload($field='upload',$module='member',$catid=0,$upload_dir = '') {
		pc_base::load_sys_class('attachment','',0);
		$siteid = $this->siteid;
		$site_allowext = 'jpg|jpeg|bmp|png|gif';
		$site_allowmaxsize = 10*1024*1024;
		$attachment = new attachment($module,$catid,$siteid,$upload_dir);
		$attachment->set_userid($this->userid);
		$a = $attachment->upload($field,$site_allowext,$site_allowmaxsize,'',array(0,0));
		if($a){
			$filepath = $attachment->uploadedfiles[0]['filepath'];
			$upload_root = pc_base::load_config('system','upload_path');
			$filename = $upload_root . $filepath;
			pc_base::load_sys_class('image','','0');
			$image = new image(1,$this->siteid);
			$image->thumb($filename,$filename,1000,651);
			$att_db = pc_base::load_model('attachment_model');
			$filesize = filesize($filename);
			$att_db->update(array('filesize' => $filesize), array('aid' => $a[0]));
			return $filepath;
		}else{
			showmessage($attachment->error(), HTTP_REFERER);
		}
	}
}
?>