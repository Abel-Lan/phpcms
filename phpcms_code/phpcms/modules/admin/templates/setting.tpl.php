<?php
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header');?>
<script type="text/javascript">
<!--
	$(function(){
		SwapTab('setting','on','',6,<?php echo $_GET['tab'] ? $_GET['tab'] : '1'?>);
		$.formValidator.initConfig({formid:"myform",autotip:true,onerror:function(msg,obj){window.top.art.dialog({content:msg,lock:true,width:'200',height:'50'}, function(){this.close();$(obj).focus();})}});		
		$("#js_path").formValidator({onshow:"<?php echo L('setting_input').L('setting_js_path')?>",onfocus:"<?php echo L('setting_js_path').L('setting_end_with_x')?>"}).inputValidator({onerror:"<?php echo L('setting_js_path').L('setting_input_error')?>"}).regexValidator({regexp:"(.+)\/$",onerror:"<?php echo L('setting_js_path').L('setting_end_with_x')?>"});
		$("#css_path").formValidator({onshow:"<?php echo L('setting_input').L('setting_css_path')?>",onfocus:"<?php echo L('setting_css_path').L('setting_end_with_x')?>"}).inputValidator({onerror:"<?php echo L('setting_css_path').L('setting_input_error')?>"}).regexValidator({regexp:"(.+)\/$",onerror:"<?php echo L('setting_css_path').L('setting_end_with_x')?>"});
		
		$("#img_path").formValidator({onshow:"<?php echo L('setting_input').L('setting_img_path')?>",onfocus:"<?php echo L('setting_img_path').L('setting_end_with_x')?>"}).inputValidator({onerror:"<?php echo L('setting_img_path').L('setting_input_error')?>"}).regexValidator({regexp:"(.+)\/$",onerror:"<?php echo L('setting_img_path').L('setting_end_with_x')?>"});
			
		$("#upload_url").formValidator({onshow:"<?php echo L('setting_input').L('setting_upload_url')?>",onfocus:"<?php echo L('setting_upload_url').L('setting_end_with_x')?>"}).inputValidator({onerror:"<?php echo L('setting_upload_url').L('setting_input_error')?>"}).regexValidator({regexp:"(.+)\/$",onerror:"<?php echo L('setting_upload_url').L('setting_end_with_x')?>"});
		
		$("#errorlog_size").formValidator({onshow:"<?php echo L('setting_errorlog_hint')?>",onfocus:"<?php echo L('setting_input').L('setting_error_log_size')?>"}).inputValidator({onerror:"<?php echo L('setting_error_log_size').L('setting_input_error')?>"}).regexValidator({regexp:"num",datatype:"enum",onerror:"<?php echo L('setting_errorlog_type')?>"});	
			
		$("#phpsso_api_url").formValidator({onshow:"<?php echo L('setting_phpsso_type')?>",onfocus:"<?php echo L('setting_phpsso_type')?>",tipcss:{width:'300px'},empty:false}).inputValidator({onerror:"<?php echo L('setting_phpsso_type')?>"}).regexValidator({regexp:"http(s?):\/\/(.+)[^/]$",onerror:"<?php echo L('setting_phpsso_type')?>"});
		
		$("#phpsso_appid").formValidator({onshow:"<?php echo L('input').L('setting_phpsso_appid')?>",onfocus:"<?php echo L('input').L('setting_phpsso_appid')?>"}).regexValidator({regexp:"^\\d{1,8}$",onerror:"<?php echo L('setting_phpsso_appid').L('must_be_number')?>"});
		$("#phpsso_version").formValidator({onshow:"<?php echo L('input').L('setting_phpsso_version')?>",onfocus:"<?php echo L('input').L('setting_phpsso_version')?>"}).regexValidator({regexp:"^\\d{1,8}$",onerror:"<?php echo L('setting_phpsso_version').L('must_be_number')?>"});
		$("#phpsso_auth_key").formValidator({onshow:"<?php echo L('input').L('setting_phpsso_auth_key')?>",onfocus:"<?php echo L('input').L('setting_phpsso_auth_key')?>"}).regexValidator({regexp:"^\\w{32}$",onerror:"<?php echo L('setting_phpsso_auth_key').L('must_be_32_w')?>"});
	})
//-->
</script>
<form action="?m=admin&c=setting&a=save" method="post" id="myform">
<div class="pad-10">
<div class="col-tab">
<ul class="tabBut cu-li">
            <li id="tab_setting_1" class="on" onclick="SwapTab('setting','on','',6,1);"><?php echo L('setting_basic_cfg')?></li>
            <li id="tab_setting_2" onclick="SwapTab('setting','on','',6,2);"><?php echo L('setting_safe_cfg')?></li>
            <li id="tab_setting_3" onclick="SwapTab('setting','on','',6,3);"><?php echo L('setting_sso_cfg')?></li>
            <li id="tab_setting_4" onclick="SwapTab('setting','on','',6,4);"><?php echo L('setting_mail_cfg')?></li>
			<li id="tab_setting_5" onclick="SwapTab('setting','on','',6,5);"><?php echo L('setting_connect')?></li>
			<li id="tab_setting_6" onclick="SwapTab('setting','on','',6,6);">CDN刷新配置</li>
</ul>
<div id="div_setting_1" class="contentList pad-10">
<table width="100%"  class="table_form">
  <tr>
    <th width="120"><?php echo L('setting_admin_email')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[admin_email]" id="admin_email" size="30" value="<?php echo $admin_email?>"/></td>
  </tr>
  <tr>
    <th width="120"><?php echo L('setting_category_ajax')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[category_ajax]" id="category_ajax" size="5" value="<?php echo $category_ajax?>"/>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo L('setting_category_ajax_desc')?></td>
  </tr>
  <tr>
    <th width="120"><?php echo L('setting_gzip')?></th>
    <td class="y-bg">
    <input name="setconfig[gzip]" value="1"  type="radio"  <?php echo ($gzip=='1') ? ' checked' : ''?>> <?php echo L('setting_yes')?>&nbsp;&nbsp;&nbsp;&nbsp;
	<input name="setconfig[gzip]" value="0" type="radio"  <?php echo ($gzip=='0') ? ' checked' : ''?>> <?php echo L('setting_no')?></td>
  </tr> 
  <tr>
    <th width="120"><?php echo L('setting_attachment_stat')?></th>
    <td class="y-bg">
    <input name="setconfig[attachment_stat]" value="1"  type="radio"  <?php echo ($attachment_stat=='1') ? ' checked' : ''?>> <?php echo L('setting_yes')?>&nbsp;&nbsp;&nbsp;&nbsp;
	<input  name="setconfig[attachment_stat]" value="0" type="radio"  <?php echo ($attachment_stat=='0') ? ' checked' : ''?>> <?php echo L('setting_no')?>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo L('setting_attachment_stat_desc')?></td>
  </tr> 	
  <tr>
    <th width="120"><?php echo L('setting_js_path')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[js_path]" id="js_path" size="50" value="<?php echo JS_PATH?>" /></td>
  </tr>
  <tr>
    <th width="120"><?php echo L('setting_css_path')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[css_path]" id="css_path" size="50" value="<?php echo CSS_PATH?>"/></td>
  </tr> 
  <tr>
    <th width="120"><?php echo L('setting_img_path')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[img_path]" id="img_path" size="50" value="<?php echo IMG_PATH?>" /></td>
  </tr>
  <tr>
    <th width="120"><?php echo L('setting_upload_url')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[upload_url]" id="upload_url" size="50" value="<?php echo $upload_url?>" /></td>
  </tr>
</table>
</div>
<div id="div_setting_2" class="contentList pad-10 hidden">
	<table width="100%"  class="table_form">
  <tr>
    <th width="120"><?php echo L('setting_admin_log')?></th>
    <td class="y-bg">
	  <input name="setconfig[admin_log]" value="1" type="radio" <?php echo ($admin_log=='1') ? ' checked' : ''?>> <?php echo L('setting_yes')?>&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="setconfig[admin_log]" value="0" type="radio" <?php echo ($admin_log=='0') ? ' checked' : ''?>> <?php echo L('setting_no')?>
     </td>
  </tr>
  <tr>
    <th width="120"><?php echo L('setting_error_log')?></th>
    <td class="y-bg">
	  <input name="setconfig[errorlog]" value="1" type="radio" <?php echo ($errorlog=='1') ? ' checked' : ''?>> <?php echo L('setting_yes')?>&nbsp;&nbsp;&nbsp;&nbsp;
	  <input name="setconfig[errorlog]" value="0" type="radio" <?php echo ($errorlog=='0') ? ' checked' : ''?>> <?php echo L('setting_no')?>
     </td>
  </tr> 
  <tr>
    <th><?php echo L('setting_error_log_size')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[errorlog_size]" id="errorlog_size" size="5" value="<?php echo $errorlog_size?>"/> MB</td>
  </tr>     

  <tr>
    <th><?php echo L('setting_maxloginfailedtimes')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[maxloginfailedtimes]" id="maxloginfailedtimes" size="10" value="<?php echo $maxloginfailedtimes?>"/></td>
  </tr>

  <tr>
    <th><?php echo L('setting_minrefreshtime')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[minrefreshtime]" id="minrefreshtime" size="10" value="<?php echo $minrefreshtime?>"/> <?php echo L('miao')?></td>
  </tr>
  <tr>
    <th><?php echo L('admin_url')?></th>
    <td class="y-bg"><TABLE>
    <TR>
		<TD width="270"><?php echo SITE_PROTOCOL;?><input type="text" class="input-text" name="setconfig[admin_url]" id="admin_url" size="30" value="<?php echo $admin_url?>"/> </TD>
		<TD><?php echo L('admin_url_tips')?></TD>
    </TR>
    </TABLE> </td>
  </tr> 
</table>
</div>
<div id="div_setting_3" class="contentList pad-10 hidden">
<table width="100%"  class="table_form">
  <tr>
    <th width="120"><?php echo L('setting_phpsso')?></th>
    <td class="y-bg">
    <input name="setconfig[phpsso]" value="1" type="radio"  <?php echo ($phpsso=='1') ? ' checked' : ''?>> <?php echo L('setting_yes')?>&nbsp;&nbsp;&nbsp;&nbsp;
	 <input name="setconfig[phpsso]" value="0" type="radio"  <?php echo ($phpsso=='0') ? ' checked' : ''?>> <?php echo L('setting_no')?></td>
  </tr> 
  <tr>
    <th><?php echo L('setting_phpsso_appid')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[phpsso_appid]" id="phpsso_appid" size="30" value="<?php echo $phpsso_appid ?>"/></td>
  </tr> 
  <tr>
    <th><?php echo L('setting_phpsso_phpsso_api_url')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[phpsso_api_url]" id="phpsso_api_url" size="50" value="<?php echo $phpsso_api_url ?>"/></td>
  </tr>  
   <tr>
    <th><?php echo L('setting_phpsso_auth_key')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[phpsso_auth_key]" id="phpsso_auth_key" size="50" value="<?php echo $phpsso_auth_key ?>"/></td>
  </tr>
   <tr>
    <th><?php echo L('setting_phpsso_version')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[phpsso_version]" id="phpsso_version" size="2" value="<?php echo $phpsso_version ?>"/></td>
  </tr>      
  </table>
</div>
<div id="div_setting_4" class="contentList pad-10 hidden">
<table width="100%"  class="table_form">
  <tr>
    <th width="120"><?php echo L('mail_type')?></th>
    <td class="y-bg">
     <input name="setting[mail_type]" checkbox="mail_type" value="1" onclick="showsmtp(this)" type="radio" <?php echo $mail_type==1 ? ' checked' : ''?>> <?php echo L('mail_type_smtp')?>
    <input name="setting[mail_type]" checkbox="mail_type" value="0" onclick="showsmtp(this)" type="radio" <?php echo $mail_type==0 ? ' checked' : ''?> <?php if(substr(strtolower(PHP_OS), 0, 3) == 'win') echo 'disabled'; ?>/> <?php echo L('mail_type_mail')?> 
	</td>
  </tr>
  <tbody id="smtpcfg" style="<?php if($mail_type == 0) echo 'display:none'?>">
  <tr>
    <th><?php echo L('mail_server')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[mail_server]" id="mail_server" size="30" value="<?php echo $mail_server?>"/></td>
  </tr>  
  <tr>
    <th><?php echo L('mail_port')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[mail_port]" id="mail_port" size="30" value="<?php echo $mail_port?>"/></td>
  </tr> 
  <tr>
    <th><?php echo L('mail_from')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="setting[mail_from]" id="mail_from" size="30" value="<?php echo $mail_from?>"/></td>
  </tr>   
  <tr>
    <th><?php echo L('mail_auth')?></th>
    <td class="y-bg">
    <input name="setting[mail_auth]" checkbox="mail_auth" value="1" type="radio" <?php echo $mail_auth==1 ? ' checked' : ''?>> <?php echo L('mail_auth_open')?>
	<input name="setting[mail_auth]" checkbox="mail_auth" value="0" type="radio" <?php echo $mail_auth==0 ? ' checked' : ''?>> <?php echo L('mail_auth_close')?></td>
  </tr> 

	  <tr>
	    <th><?php echo L('mail_user')?></th>
	    <td class="y-bg"><input type="text" class="input-text" name="setting[mail_user]" id="mail_user" size="30" value="<?php echo $mail_user?>"/></td>
	  </tr> 
	  <tr>
	    <th><?php echo L('mail_password')?></th>
	    <td class="y-bg"><input type="password" class="input-text" name="setting[mail_password]" id="mail_password" size="30" value="<?php echo $mail_password?>"/></td>
	  </tr>

 </tbody>
  <tr>
    <th><?php echo L('mail_test')?></th>
    <td class="y-bg"><input type="text" class="input-text" name="mail_to" id="mail_to" size="30" value=""/> <input type="button" class="button" onClick="javascript:test_mail();" value="<?php echo L('mail_test_send')?>"></td>
  </tr>           
  </table>
</div>

<div id="div_setting_5" class="contentList pad-10 hidden">
<table width="100%"  class="table_form">


  <tr>
    <th width="120"><?php echo L('setting_snda_enable')?></th>
    <td class="y-bg">
	 APP key <input type="text" class="input-text" name="setconfig[snda_akey]" id="snda_akey" size="20" value="<?php echo $snda_akey ?>"/>
	 APP secret key <input type="text" class="input-text" name="setconfig[snda_skey]" id="snda_skey" size="40" value="<?php echo $snda_skey ?>"/> <a href="http://code.snda.com/index/oauth" target="_blank"><?php echo L('click_register')?></a>
    </td>
  </tr>

  <tr>
    <th><?php echo L('setting_connect_sina')?></th>
    <td class="y-bg">
	App key <input type="text" class="input-text" name="setconfig[sina_akey]" id="sina_akey" size="20" value="<?php echo $sina_akey ?>"/>
	App secret key <input type="text" class="input-text" name="setconfig[sina_skey]" id="sina_skey" size="40" value="<?php echo $sina_skey ?>"/> <a href="http://open.t.sina.com.cn/wiki/index.php/<?php echo L('connect_micro')?>" target="_blank"><?php echo L('click_register')?></a>
	</td>
  </tr>

  <tr>
    <th><?php echo L('setting_connect_qq')?></th>
    <td class="y-bg">
	App key <input type="text" class="input-text" name="setconfig[qq_akey]" id="qq_akey" size="20" value="<?php echo $qq_akey ?>"/>
	App secret key <input type="text" class="input-text" name="setconfig[qq_skey]" id="qq_skey" size="40" value="<?php echo $qq_skey ?>"/> <a href="http://open.t.qq.com/" target="_blank"><?php echo L('click_register')?></a>
	</td>
  </tr> 
  <tr>
    <th><?php echo L('setting_connect_qqnew')?></th>
    <td class="y-bg">
	App I D  &nbsp;<input type="text" class="input-text" name="setconfig[qq_appid]" id="qq_appid" size="20" value="<?php echo $qq_appid;?>"/>
	App key <input type="text" class="input-text" name="setconfig[qq_appkey]" id="qq_appkey" size="40" value="<?php echo $qq_appkey;?>"/> 
	<?php echo L('setting_connect_qqcallback')?> <input type="text" class="input-text" name="setconfig[qq_callback]" id="qq_callback" size="40" value="<?php echo $qq_callback;?>"/>
	<a href="http://connect.qq.com" target="_blank"><?php echo L('click_register')?></a>
	</td>
  </tr> 

  </table>
</div>

<div id="div_setting_6" class="contentList pad-10 hidden">
<table width="100%"  class="table_form">
  <tr>
    <th width="120">启用CDN刷新</th>
    <td class="y-bg">
    <input name="setconfig[cdn_refresh][enable]" value="1"  type="radio"  <?php echo (isset($cdn_refresh['enable']) && $cdn_refresh['enable']=='1') ? ' checked' : ''?>> 是&nbsp;&nbsp;&nbsp;&nbsp;
	<input name="setconfig[cdn_refresh][enable]" value="0" type="radio"  <?php echo (!isset($cdn_refresh['enable']) || $cdn_refresh['enable']=='0') ? ' checked' : ''?>> 否</td>
  </tr>
  <tr>
    <th width="120">CDN类型</th>
    <td class="y-bg">
    <select name="setconfig[cdn_refresh][cdn_type]" id="cdn_type">
      <option value="aliyun_cdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='aliyun_cdn') ? ' selected' : ''?>>阿里云CDN</option>
      <option value="aliyun_dcdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='aliyun_dcdn') ? ' selected' : ''?>>阿里云DCDN</option>
      <option value="tencent_cdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='tencent_cdn') ? ' selected' : ''?>>腾讯云CDN</option>
      <option value="tencent_dcdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='tencent_dcdn') ? ' selected' : ''?>>腾讯云DCDN</option>
      <option value="baidu_cdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='baidu_cdn') ? ' selected' : ''?>>百度云CDN</option>
      <option value="baidu_dcdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='baidu_dcdn') ? ' selected' : ''?>>百度云DCDN</option>
      <option value="huawei_cdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='huawei_cdn') ? ' selected' : ''?>>华为云CDN</option>
      <option value="huawei_dcdn" <?php echo (isset($cdn_refresh['cdn_type']) && $cdn_refresh['cdn_type']=='huawei_dcdn') ? ' selected' : ''?>>华为云DCDN</option>
    </select>
    </td>
  </tr>
  <tr>
    <th width="120">API地址</th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[cdn_refresh][endpoint]" id="cdn_endpoint" size="50" value="<?php echo isset($cdn_refresh['endpoint']) ? $cdn_refresh['endpoint'] : 'https://cdn.aliyuncs.com'?>" /></td>
  </tr>
  <tr>
    <th width="120">AccessKey ID</th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[cdn_refresh][access_key_id]" id="cdn_access_key_id" size="50" value="<?php echo isset($cdn_refresh['access_key_id']) ? $cdn_refresh['access_key_id'] : ''?>" /></td>
  </tr>
  <tr>
    <th width="120">AccessKey Secret</th>
    <td class="y-bg"><input type="text" class="input-text" name="setconfig[cdn_refresh][access_key_secret]" id="cdn_access_key_secret" size="50" value="<?php echo isset($cdn_refresh['access_key_secret']) ? $cdn_refresh['access_key_secret'] : ''?>" /></td>
  </tr>
  <tr>
      <th width="120">测试刷新</th>
      <td class="y-bg">
          <p>URL/目录：<input type="text" class="input-text" name="test_url" id="test_url" size="80" placeholder="例如：https://www.example.com/index.html 或 https://www.example.com/images/" /></p>
          <p>刷新类型：
              <select name="test_type" id="test_type">
                  <option value="file">文件</option>
                  <option value="dir">目录</option>
              </select>
              <input type="button" class="button" onClick="javascript:test_cdn_refresh();" value="测试刷新" />
          </p>
          <div id="test_result" style="margin-top:10px; padding:10px; border:1px solid #ccc; display:none;"></div>
      </td>
  </tr>
  <tr>
    <th width="120">说明</th>
    <td class="y-bg">
      <p>1. 启用后，当生成或更新静态页面时，会自动刷新CDN缓存</p>
      <p>2. 需要在对应云服务控制台获取AccessKey ID和AccessKey Secret</p>
      <p>3. 请确保AccessKey具有CDN刷新权限</p>
      <p>4. 不同CDN类型的API地址：</p>
      <p>   - 阿里云CDN: https://cdn.aliyuncs.com</p>
      <p>   - 阿里云DCDN: https://dcdn.aliyuncs.com</p>
      <p>   - 腾讯云CDN: https://cdn.tencentcloudapi.com</p>
      <p>   - 腾讯云DCDN: https://dcdn.tencentcloudapi.com</p>
      <p>   - 百度云CDN: https://cdn.baidubce.com</p>
      <p>   - 百度云DCDN: https://dcdn.baidubce.com</p>
      <p>   - 华为云CDN: https://cdn.myhuaweicloud.com</p>
      <p>   - 华为云DCDN: https://dcdn.myhuaweicloud.com</p>
    </td>
  </tr>
</table>
</div>

<div class="bk15"></div>
<input name="dosubmit" type="submit" value="<?php echo L('submit')?>" class="button">
</div>
</div>
</form>
</body>
<script type="text/javascript">

function SwapTab(name,cls_show,cls_hide,cnt,cur){
    for(i=1;i<=cnt;i++){
		if(i==cur){
			 $('#div_'+name+'_'+i).show();
			 $('#tab_'+name+'_'+i).attr('class',cls_show);
		}else{
			 $('#div_'+name+'_'+i).hide();
			 $('#tab_'+name+'_'+i).attr('class',cls_hide);
		}
	}
}

function showsmtp(obj,hiddenid){
	hiddenid = hiddenid ? hiddenid : 'smtpcfg';
	var status = $(obj).val();
	if(status == 1) $("#"+hiddenid).show();
	else  $("#"+hiddenid).hide();
}
function test_mail() {
	var mail_type = $('input[checkbox=mail_type][checked]').val();
	var mail_auth = $('input[checkbox=mail_auth][checked]').val();
    $.post('?m=admin&c=setting&a=public_test_mail&mail_to='+$('#mail_to').val(),{mail_type:mail_type,mail_server:$('#mail_server').val(),mail_port:$('#mail_port').val(),mail_user:$('#mail_user').val(),mail_password:$('#mail_password').val(),mail_auth:mail_auth,mail_from:$('#mail_from').val()}, function(data){
	alert(data);
	});
}

function test_cdn_refresh() {
	var test_url = $('#test_url').val();
	var test_type = $('#test_type').val();
	var cdn_type = $('#cdn_type').val();
	var endpoint = $('#cdn_endpoint').val();
	var access_key_id = $('#cdn_access_key_id').val();
	var access_key_secret = $('#cdn_access_key_secret').val();
	var enable = $('input[name="setconfig[cdn_refresh][enable]"]:checked').val();

	if (!test_url) {
		alert('请输入要刷新的URL或目录');
		return;
	}

	if (!enable) {
		alert('请先启用CDN刷新功能');
		return;
	}

	if (!access_key_id || !access_key_secret) {
		alert('请填写AccessKey ID和AccessKey Secret');
		return;
	}

	$('#test_result').show().html('<div style="color: #666;">正在测试CDN刷新，请稍候...</div>');

	$.post('?m=admin&c=setting&a=public_test_cdn_refresh', {
		test_url: test_url,
		test_type: test_type,
		cdn_type: cdn_type,
		endpoint: endpoint,
		access_key_id: access_key_id,
		access_key_secret: access_key_secret
	}, function(data) {
		var result = JSON.parse(data);
		if (result.success) {
            var html = '<div style="color: green;">刷新成功！任务ID: ' + result.taskId + '</div>';
            if (result.response) {
                html += '<div style="margin-top: 10px; padding: 10px; background: #f5f5f5; border: 1px solid #ddd; font-family: monospace; font-size: 12px; overflow: auto; max-height: 200px;">';
                html += '响应内容: <br>' + result.response;
                html += '</div>';
            }
            $('#test_result').html(html);
		} else {
            var html = '<div style="color: red;">刷新失败：' + result.message + '</div>';
            if (result.response) {
                html += '<div style="margin-top: 10px; padding: 10px; background: #f5f5f5; border: 1px solid #ddd; font-family: monospace; font-size: 12px; overflow: auto; max-height: 200px;">';
                html += '响应内容: <br>' + result.response;
                html += '</div>';
            }
            $('#test_result').html(html);
		}
	});
}

</script>
</html>