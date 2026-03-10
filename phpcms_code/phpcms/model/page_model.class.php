<?php
defined('IN_PHPCMS') or exit('No permission resources.');
pc_base::load_sys_class('model', '', 0);
class page_model extends model {
	public $table_name = '';
	public function __construct() {
		$this->db_config = pc_base::load_config('database');
		$this->db_setting = 'default';
		$this->table_name = 'page';
		parent::__construct();
	}
	public function create_html($catid) {
        // 初始化html对象
        $html = pc_base::load_app_class('html', 'content');
        // 生成页面并获取生成的URL
        $generated_urls = $html->category($catid, 1);
        if(!empty($generated_urls)) {
            $html->refresh_cdn($generated_urls);
        }
	}
}
?>