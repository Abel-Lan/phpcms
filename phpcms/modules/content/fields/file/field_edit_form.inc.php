<table cellpadding="2" cellspacing="1" width="98%">
	<tr> 
      <td width="100">文本框长度</td>
      <td><input type="text" name="setting[size]" value="<?php echo $setting['size'];?>" size="10" class="input-text"></td>
    </tr>
	<tr> 
      <td>默认值</td>
      <td><input type="text" name="setting[defaultvalue]" value="<?php echo $setting['defaultvalue'];?>" size="40" class="input-text"></td>
    </tr>
	<tr> 
      <td>允许上传的文件类型</td>
      <td><input type="text" name="setting[upload_allowext]" value="<?php echo $setting['upload_allowext'];?>" size="40" class="input-text"></td>
    </tr>
	<tr> 
      <td>是否从已上传中选择</td>
      <td><input type="radio" name="setting[isselectimage]" value="1" <?php if($setting['isselectimage']) echo 'checked';?>> 是 <input type="radio" name="setting[isselectimage]" value="0" <?php if(!$setting['isselectimage']) echo 'checked';?>> 否</td>
    </tr>
	
</table>