	function file($field, $value, $fieldinfo) {
		$list_str = $str = '';
		extract(string2array($fieldinfo['setting']));
		if($value){
			$value_arr = explode('|',$value);
			$value = $value_arr['0'];
			$sel_server = $value_arr['1'] ? explode(',',$value_arr['1']) : '';
			$edit = 1;
		} else {
			$edit = 0;
		}
		
	
		
		if(!defined('IMAGES_INIT')) {
			$str = '<script type="text/javascript" src="'.JS_PATH.'swfupload/swf2ckeditor.js"></script>';
			define('IMAGES_INIT', 1);
		}	


		$authkey = upload_key("$upload_number,$upload_allowext,$isselectimage");	
		$string .= $str."<input type='text' name='info[$field]' id='$field' value='$value' class='input-text' size='$size' />  <input type='button' class='button' onclick=\"javascript:flashupload('{$field}_downfield', '".L('attachment_upload')."','{$field}',submit_attachment,'{$upload_number},{$upload_allowext},{$isselectimage}','content','$this->catid','{$authkey}')\"/ value='".L('attachment_upload')."'>";


		return $string;
	}
