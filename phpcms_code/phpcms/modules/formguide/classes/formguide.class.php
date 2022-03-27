<?php
defined('IN_PHPCMS') or exit('No permission resources.');
//模型原型存储路径
define('MODEL_PATH',PC_PATH.'modules'.DIRECTORY_SEPARATOR.'formguide'.DIRECTORY_SEPARATOR.'fields'.DIRECTORY_SEPARATOR);
//模型缓存路径
define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);
/**
 * 更新form表单模型类
 * @author 
 *
 */
class formguide {

	public function __construct() {
		
	}
	
	/**
	 * 更新模型缓存方法
	 */
	public function public_cache() {
		require MODEL_PATH.'fields.inc.php';
		//更新内容模型类：表单生成、入库、更新、输出
		$classtypes = array('form','input','update','output');
		foreach($classtypes as $classtype) {
			$cache_data = file_get_contents(MODEL_PATH.'formguide_'.$classtype.'.class.php');
			$cache_data = str_replace('}?>','',$cache_data);
			foreach($fields as $field=>$fieldvalue) {
				if(file_exists(MODEL_PATH.$field.DIRECTORY_SEPARATOR.$classtype.'.inc.php')) {
					$cache_data .= file_get_contents(MODEL_PATH.$field.DIRECTORY_SEPARATOR.$classtype.'.inc.php');
				}
			}
			$cache_data .= "\r\n } \r\n?>";
			file_put_contents(CACHE_MODEL_PATH.'formguide_'.$classtype.'.class.php',$cache_data);
			@chmod(CACHE_MODEL_PATH.'formguide_'.$classtype.'.class.php',0777);
		}

        //更新表单向导的字段缓存
        $db = pc_base::load_model('sitemodel_model');
        $datas = $db->select(array('type'=>3));
        foreach ($datas as $r) {
            $formid = $r['modelid'];
            $field_array = array();
            $db_field = pc_base::load_model('sitemodel_field_model');
            $fields = $db_field->select(array('modelid'=>$formid,'disabled'=>0),'*',100,'listorder ASC');
            foreach($fields as $_value) {
                $setting = string2array($_value['setting']);
                $_value = array_merge($_value,$setting);
                $field_array[$_value['field']] = $_value;
            }
            setcache('formguide_field_'.$formid,$field_array,'model');
        }

        return true;
	}
}
?>