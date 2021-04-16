<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_app_class('admin','admin',0);

class formguide_info extends admin {
	
	private $db, $f_db, $tablename;
	public function __construct() {
		parent::__construct();
		$this->db = pc_base::load_model('sitemodel_field_model');
		$this->f_db = pc_base::load_model('sitemodel_model');
		if (isset($_GET['formid']) && !empty($_GET['formid'])) {
			$formid = intval($_GET['formid']);
			$f_info = $this->f_db->get_one(array('modelid'=>$formid, 'siteid'=>$this->get_siteid()), 'tablename');
			$this->tablename = 'form_'.$f_info['tablename'];
			$this->db->change_table($this->tablename);
		}
	}
	
	/**
	 * 用户提交表单信息列表
	 */
	public function init() {
		if (!isset($_GET['formid']) || empty($_GET['formid'])) {
			showmessage(L('illegal_operation'), HTTP_REFERER);
		}
		$formid = intval($_GET['formid']);
		if (!$this->tablename) {
			$f_info = $this->f_db->get_one(array('modelid'=>$formid, 'siteid'=>$this->get_siteid()), 'tablename');
			$this->tablename = 'form_'.$f_info['tablename'];
			$this->db->change_table($this->tablename);
		}
		$page = max(intval($_GET['page']), 1);
		$r = $this->db->get_one(array(), "COUNT(dataid) sum");
		$total = $r['sum'];
		$this->f_db->update(array('items'=>$total), array('modelid'=>$formid));
		$pages = pages($total, $page, 20);
		$offset = ($page-1)*20;
		$datas = $this->db->select(array(), '*', $offset.', 20', '`dataid` DESC');
		$big_menu = array('javascript:window.top.art.dialog({id:\'add\',iframe:\'?m=formguide&c=formguide&a=add\', title:\''.L('formguide_add').'\', width:\'700\', height:\'500\', lock:true}, function(){var d = window.top.art.dialog({id:\'add\'}).data.iframe;var form = d.document.getElementById(\'dosubmit\');form.click();return false;}, function(){window.top.art.dialog({id:\'add\'}).close()});void(0);', L('formguide_add'));
		include $this->admin_tpl('formguide_info_list');
	}
	
	/**
	 * 查看
	 */
	public function public_view() {
		if (!$this->tablename || !isset($_GET['did']) || empty($_GET['did'])) showmessage(L('illegal_operation'), HTTP_REFERER);
		$did = intval($_GET['did']);
		$formid = intval($_GET['formid']);
		$info = $this->db->get_one(array('dataid'=>$did));
		pc_base::load_sys_class('form', '', '');
		define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
		require CACHE_MODEL_PATH.'formguide_output.class.php';
		$formguide_output = new formguide_output($formid);
		$forminfos_data = $formguide_output->get($info);
		$fields = $formguide_output->fields;
		include $this->admin_tpl('formguide_info_view');
	}
	
	/**
	 * 删除
	 */
	public function public_delete() {
		$formid = intval($_GET['formid']);
		if (isset($_GET['did']) && !empty($_GET['did'])) {
			$did = intval($_GET['did']);
			$this->public_delete_attachment($formid,$did); // Abel Lan, 2017-9-5, 删除表单时同时删除附件
			$this->db->delete(array('dataid'=>$did));
			$this->f_db->update(array('items'=>'-=1'), array('modelid'=>$formid));
			showmessage(L('operation_success'), HTTP_REFERER);
		} else if(is_array($_POST['did']) && !empty($_POST['did'])) {
			foreach ($_POST['did'] as $did) {
				$did = intval($did);
				$this->public_delete_attachment($formid,$did); // Abel Lan, 2017-9-5, 删除表单时同时删除附件
				$this->db->delete(array('dataid'=>$did));
				$this->f_db->update(array('items'=>'-=1'), array('modelid'=>$formid));
			}
			showmessage(L('operation_success'), HTTP_REFERER);
		} else {
			showmessage(L('illegal_operation'), HTTP_REFERER);
		}
	}
	/**
	 * 修改者：Abel Lan
	 * 修改日期：2017-9-5
	 * 删除附件
	 * 删除表单内容时，同时删除附件
	 */
	private function public_delete_attachment($formid = 0,$did = 0) {
		if (!$this->tablename || empty($formid) || empty($did)) showmessage(L('illegal_operation'), HTTP_REFERER);
		$this->db->change_table('model_field');
		$datas = $this->db->select(array('modelid'=>$formid,'formtype'=>'image'),'*',100,'listorder ASC');
		// 将$this->db重新更改为自定义扩展数据表
		if (!$this->tablename) {
			$f_info = $this->f_db->get_one(array('modelid'=>$formid, 'siteid'=>$this->get_siteid()), 'tablename');
			$this->tablename = 'form_'.$f_info['tablename'];
		}
		$this->db->change_table($this->tablename);

		if($datas) {
			foreach($datas as $r) {
				$info = $this->db->get_one(array('dataid'=>$did));
				$filepath = $info[$r['field']];
				$upload_url = pc_base::load_config('system','upload_url');
				$url_len = strlen($upload_url);
				$filepath = substr($filepath,$url_len);
				$attachment_model = pc_base::load_model('attachment_model');
				$attachment_result = $attachment_model->get_one(array('module'=>'member','catid'=>'0','filepath'=>$filepath));
				if($attachment_result){
					$aid = $attachment_result['aid'];
					$attachment_index = pc_base::load_model('attachment_index_model');
					$attachment_index_result = $attachment_index->get_one(array('aid'=>$aid));
					if(!$attachment_index_result) {
						$attachment = pc_base::load_sys_class('attachment');
						$attachment->delete(array('aid'=>$aid));
					}
				}
			}
		}
	}
	/**
	 * 修改者：Abel Lan
	 * 修改日期：2017-8-28
	 * 审核通过
	 * 仅适用于包含status字段的表单，比如照片墙
	 */
	public function public_pass() {
		if (isset($_GET['did']) && !empty($_GET['did'])) {
			$did = intval($_GET['did']);
			$this->db->update(array('status'=>1), array('dataid'=>$did));
			showmessage(L('operation_success'), HTTP_REFERER);
		} else if(is_array($_POST['did']) && !empty($_POST['did'])) {
			foreach ($_POST['did'] as $did) {
				$did = intval($did);
				$this->db->update(array('status'=>1), array('dataid'=>$did));
			}
			showmessage(L('operation_success'), HTTP_REFERER);
		} else {
			showmessage(L('illegal_operation'), HTTP_REFERER);
		}
	}
	/**
	 * 修改者：Abel Lan
	 * 修改日期：2017-8-28
	 * 添加
	 */
	public function public_add() {
		if(empty($_POST['dosubmit'])){
			if (!$this->tablename || !isset($_GET['formid'])) showmessage(L('illegal_operation'), HTTP_REFERER);
			$formid = intval($_GET['formid']);
			pc_base::load_sys_class('form', '', '');

			$f_info = $this->f_db->get_one(array('modelid'=>$formid, 'siteid'=>$this->get_siteid()), 'name');
			define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
			require CACHE_MODEL_PATH.'formguide_form.class.php';
			$formguide_form = new formguide_form($formid);
			$forminfos_fields = $formguide_form->get();
			$show_header = 1;
			include $this->admin_tpl('formguide_info_add');
		}
		if($_POST['dosubmit']=='dosubmit'){
			if (empty($_GET['formid'])) showmessage(L('illegal_operation'), HTTP_REFERER);
			$formid = intval($_GET['formid']);
			$info=$_POST['info'];
			$data = array();
			pc_base::load_sys_class('form', '', '');
			define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
			require CACHE_MODEL_PATH.'formguide_input.class.php';
			$formguide_input = new formguide_input($formid);
			$data = new_addslashes($info);
			$data = new_html_special_chars($data);
			$data = $formguide_input->get($data);
			$data['userid'] = param::get_cookie('_userid');
			$data['username'] = param::get_cookie('_username');
			$data['datetime'] = SYS_TIME;
			$data['ip'] = ip();
			$this->db->insert($data,true);
			showmessage(L('add_success'),'?m=formguide&c=formguide_info&a=public_add&formid='.$formid);
		}
	}
	/**
	 * 修改者：Abel Lan
	 * 修改日期：2017-8-28
	 * 编辑
	 */
	public function public_edit() {
		if(empty($_POST['dosubmit'])){
			if (!$this->tablename || !isset($_GET['did']) || empty($_GET['did'])) showmessage(L('illegal_operation'), HTTP_REFERER);
			$did = intval($_GET['did']);
			$formid = intval($_GET['formid']);
			$info = $this->db->get_one(array('dataid'=>$did));
			pc_base::load_sys_class('form', '', '');
			define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
			require CACHE_MODEL_PATH.'formguide_output.class.php';
			$formguide_output = new formguide_output($formid);
			$forminfos_data = $formguide_output->get($info);
			$fields = $formguide_output->fields;

			$f_info = $this->f_db->get_one(array('modelid'=>$formid, 'siteid'=>$this->get_siteid()), 'name');
			define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
			require CACHE_MODEL_PATH.'formguide_form.class.php';
			$formguide_form = new formguide_form($formid);
			$info=str_replace("\\","",$info);
			$forminfos_fields = $formguide_form->get($info);
			$show_header = 1;
			include $this->admin_tpl('formguide_info_edit');
		}
		if($_POST['dosubmit']=='dosubmit'){
			if (!isset($_GET['did']) || empty($_GET['did'])) showmessage(L('illegal_operation'), HTTP_REFERER);
			$did = intval($_GET['did']);
			$formid = intval($_GET['formid']);
			$info=$_POST['info'];
			pc_base::load_sys_class('form', '', '');
			define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
			require CACHE_MODEL_PATH.'formguide_input.class.php';
			$formguide_input = new formguide_input($formid);
			$data = new_addslashes($info);
			$data = new_html_special_chars($data);
			$data = $formguide_input->get($data);

			$this->db->update($data, array('dataid'=>$did));
			showmessage(L('update_success'),'?m=formguide&c=formguide_info&a=public_edit&formid='.$formid.'&did='.$did);
		}
	}
}
?>