<?php
defined('IN_PHPCMS') or exit('No permission resources.');

$refererUrl = parse_url($_SERVER['HTTP_REFERER']);
$host = $_SERVER['HTTP_HOST'];
if(!isset($_SERVER['HTTP_REFERER']) || $refererUrl['host'] != $_SERVER['HTTP_HOST']) exit();

if(param::get_cookie('token')) {
    $token  = param::get_cookie('token');
}else{
    $session_storage = 'session_' . pc_base::load_config('system', 'session_storage');
    pc_base::load_sys_class($session_storage);
    session_start();
    $str_rand = random(6, 'abcdefghigklmnopqrstuvwxwyABCDEFGHIGKLMNOPQRSTUVWXWY0123456789');
    $_SESSION['token'] = $token = md5(microtime(true) . $str_rand);
    param::set_cookie('token',$token);
}

exit($token);