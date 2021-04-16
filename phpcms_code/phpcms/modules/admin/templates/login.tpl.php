<?php defined('IN_ADMIN') or exit('No permission resources.'); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <title>后台登录</title>
    <link href="statics/admin_login/css/bootstrap.min.css" rel="stylesheet">
    <link href="statics/admin_login/css/login.min.css" rel="stylesheet">
    <script>
        if(window.top!==window.self){window.top.location=window.location};
    </script>
</head>

<body onload="javascript:document.myform.username.focus();" class="signin">
<div class="signinpanel">
    <div class="row">
        <div class="col-sm-7" style="color:#fff">
            <div class="signin-info">
                <div class="logopanel m-b">
                </div>
                <div class="m-b"></div>
                <h2>欢迎使用PHPCMS后台管理</h2>
                <ul class="m-b"></ul>
            </div>
        </div>
        <div class="col-sm-5" style="color:#fff">
            <form action="index.php?m=admin&c=index&a=login&dosubmit=1" method="post" name="myform">
                <div style="margin-bottom:70px">
                    <input type="text" class="form-control uname" value="" name="username" placeholder="<?php echo L('username')?>" size="30"/>
                    <input type="password" class="form-control pword m-b" value=""  name="password" placeholder="<?php echo L('password')?>" size="30"/>
                    <div id="yzm" class="yzm">
                        <input type="text" class="form-control" value="" name="code" placeholder="<?php echo L('security_code')?>" style="color:black;width:120px;height:40px;float:left;margin:0;" size="7" />
                        <img id='code_img' onclick='this.src=this.src+"&"+Math.random()' src='/api.php?op=checkcode&code_len=4&font_size=20&width=130&height=50&font_color=&background='>
                        <a href="javascript:document.getElementById('code_img').src='/api.php?op=checkcode&m=admin&c=index&a=checkcode&time='+Math.random();void(0);" style="color:#fff;"><?php echo L('click_change_validate')?></a>
                    </div>
                </div>
                <input name="dosubmit" value="登录" type="submit" class="btn btn-primary btn-block" />
            </form>
        </div>
    </div>
    <div class="signup-footer">
        <div class="pull-left" style="color:#fff">
            &copy; 2018-2022 <a href="https://www.bluepost.cn" style="color:#fff;">bluepost.cn</a> & phpcms All Rights Reserved.<br>
            git地址：<a href="https://github.com/Abel-Lan/phpcms" style="color:#fff;">https://github.com/Abel-Lan/phpcms</a>
        </div>
    </div>
</div>


</body>
</html>