<?php
defined('IN_PHPCMS') or exit('No permission resources.');
define('CACHE_MODEL_PATH',PHPCMS_PATH.'caches'.DIRECTORY_SEPARATOR.'caches_model'.DIRECTORY_SEPARATOR.'caches_data'.DIRECTORY_SEPARATOR);

class index{
    private $db, $m_db, $M;

    function __construct(){
        $this->db = pc_base::load_model('sitemodel_model');
        $this->m_db = pc_base::load_model('sitemodel_field_model');
        $this->M = new_html_special_chars(getcache('formguide', 'commons'));
        $this->siteid = intval($_GET['siteid']) ? intval($_GET['siteid']) : get_siteid();
        $this->M = $this->M[$this->siteid];
    }

    /**
     * 表单向导首页
     */
    public function index(){
        $siteid = $this->siteid;
        $SEO = seo($this->siteid, '', L('formguide_list'));
        $page = max(intval($_GET['page']), 1);
        $r = $this->db->get_one(array('siteid' => $this->siteid, 'type' => 3, 'disabled' => 0), 'COUNT(`modelid`) AS sum');
        $total = $r['sum'];
        $pages = pages($total, $page, 20);
        $offset = ($page - 1) * 20;
        $datas = $this->db->select(array('siteid' => $this->siteid, 'type' => 3, 'disabled' => 0), 'modelid, name, addtime', $offset . ',20', '`modelid` DESC');
        include template('formguide', 'index');
    }

    /**
     * 表单展示
     */
    public function show(){
        $CATEGORYS = getcache('category_content_' . $this->siteid, 'commons');// Abel Lan add 2017-9-1,表单向导无法显示部分菜单
        if(!isset($_GET['formid']) || empty($_GET['formid'])){
            $_GET['action'] ? exit : showmessage(L('form_no_exist'), HTTP_REFERER);
        }
        $siteid = $_GET['siteid'] ? intval($_GET['siteid']) : 1;
        $formid = intval($_GET['formid']);
        $r = $this->db->get_one(array('modelid' => $formid, 'siteid' => $siteid, 'disabled' => 0), 'tablename, setting');
        if(!$r){
            $_GET['action'] ? exit : showmessage(L('form_no_exist'), HTTP_REFERER);
        }
        $setting = string2array($r['setting']);
        if($setting['enabletime']){
            if($setting['starttime'] > SYS_TIME || ($setting['endtime'] + 3600 * 24) < SYS_TIME){
                $_GET['action'] ? exit : showmessage(L('form_expired'), APP_PATH . 'index.php?m=formguide&c=index&a=index');
            }
        }
        $userid = param::get_cookie('_userid');
        if($setting['allowunreg'] == 0 && !$userid && $_GET['action'] != 'js') showmessage(L('please_login_in'), APP_PATH . 'index.php?m=member&c=index&a=login&forward=' . urlencode(HTTP_REFERER));
        if(isset($_POST['dosubmit'])){
            $tablename = 'form_' . $r['tablename'];
            $this->m_db->change_table($tablename);
            $data = array();
            require CACHE_MODEL_PATH . 'formguide_input.class.php';
            $formguide_input = new formguide_input($formid);
            $data = new_addslashes($_POST['info']);
            $data = new_html_special_chars($data);

            $session_storage = 'session_' . pc_base::load_config('system', 'session_storage');
            pc_base::load_sys_class($session_storage);
            session_start();
            if(isset($_POST['token']) && $_POST['token'] != $_SESSION['token']) showmessage('非法提交或请勿重复提交', HTTP_REFERER);
            /*
             * 修改者：Abel Lan
             * 修改日期：2017-8-28
             * 修改目的：直接通过input提交保存图片
             * 修改编号：post-img-save-001
             * */
            //post-img-save-001添加内容开始
            if($formid == 12){
                $upload_dir = 'PhotosWall/';
                if(isset($_POST['ajax_upload_image']) && $_POST['ajax_upload_image'] == 1){

                }else{
                    $field = 'img_address';
                    $fields = $formguide_input->fields;
                    $field_type = $fields[$field]['formtype'];
                    $img_result = $this->upload($field, 'member', 0, $field_type, $upload_dir);
                    $data['img_address'] = $img_result;
                }
            }
            //post-img-save-001添加内容结束
            $data = $formguide_input->get($data);
            $data['userid'] = $userid;
            $data['username'] = param::get_cookie('_username');
            $data['datetime'] = SYS_TIME;
            $data['ip'] = ip();
            $dataid = $this->m_db->insert($data, true);
            if($dataid){
                if($setting['sendmail']){
                    pc_base::load_sys_func('mail');
                    $mails = explode(',', $setting['mails']);
                    if(is_array($mails)){
                        foreach($mails as $m){
                            sendmail($m, L('tips'), $this->M['mailmessage']);
                        }
                    }
                }
                $this->db->update(array('items' => '+=1'), array('modelid' => $formid, 'siteid' => $this->siteid));
            }
            /*
             * 修改者：Abel Lan
             * 修改日期：2017-8-28
             * 修改目的：上传成功后跳转提示页面修改
             * 修改编号：form-12-redirect-fix-001
             * */ //showmessage(L('thanks'),HTTP_REFERER); //form-34-redirect-fix-001修改前
            //form-12-redirect-fix-001添加内容开始
            $msg = L('thanks') . '<br />您的图片已经上传成功，请耐心等待审核。';
            $msg .= '<br /><br /><link href="' . APP_PATH . '/statics/css/upload_photo.css" rel="stylesheet" type="text/css">';
            $msg .= '<a id="continue-add" class="form-btn" href="' . HTTP_REFERER . '" target="_self">继续添加</a>';
            $msg .= '<a id="view-photo-wall" class="form-btn" href="/index.php?m=content&c=index&a=lists&catid=6" target="_blank">查看照片墙</a>';
            if($formid == 12){
                $_SESSION['token'] = '';
                showmessage($msg, '/index.php?m=content&c=index&a=lists&catid=6', 5000);
            }else{
                showmessage(L('thanks'), HTTP_REFERER);
            }
            //form-12-redirect-fix-001添加内容开始
        }else{
            /*
             * 修改者：Abel Lan
             * 修改日期：2017-9-7
             * 修改目的：添加表单验证token
             * 修改编号：form-add-token-001
             * */
            //form-add-token-001添加内容开始
            $session_storage = 'session_' . pc_base::load_config('system', 'session_storage');
            pc_base::load_sys_class($session_storage);
            session_start();
            $str_rand = random(6, 'abcdefghigklmnopqrstuvwxwyABCDEFGHIGKLMNOPQRSTUVWXWY0123456789');
            $_SESSION['token'] = $token = md5(microtime(true) . $str_rand);
            param::set_cookie('token',$token);
            //form-add-token-001添加内容结束
            if($setting['allowunreg'] == 0 && !$userid && $_GET['action'] == 'js'){
                $no_allowed = 1;
            }
            pc_base::load_sys_class('form', '', '');
            $f_info = $this->db->get_one(array('modelid' => $formid, 'siteid' => $this->siteid));
            extract($f_info);
            $tablename = 'form_' . $r['tablename'];
            $this->m_db->change_table($tablename);
            $ip = ip();
            $where = array();
            if ($userid) $where = array('userid'=>$userid);
            else $where = array('ip'=>$ip);
            $re = $this->m_db->get_one($where, 'datetime');
            $setting = string2array($setting);
            if(($setting['allowmultisubmit'] == 0 && $re['datetime']) || (isset($this->M['interval']) && ((SYS_TIME - $re['datetime']) < $this->M['interval'] * 60))){
                $_GET['action'] ? exit : showmessage(L('had_participate'), APP_PATH . 'index.php?m=formguide&c=index&a=index');
            }
            require CACHE_MODEL_PATH . 'formguide_form.class.php';
            $formguide_form = new formguide_form($formid, $no_allowed);
            $forminfos_data = $formguide_form->get();
            $SEO = seo($this->siteid, L('formguide'), $name);
            if(isset($_GET['action']) && $_GET['action'] == 'js'){
                if(!function_exists('ob_gzhandler')) ob_clean();
                ob_start();
            }
            $template = ($_GET['action'] == 'js') ? $js_template : $show_template;
            include template('formguide', $template, $default_style);
            if(isset($_GET['action']) && $_GET['action'] == 'js'){
                $data = ob_get_contents();
                ob_clean();
                exit(format_js($data));
            }
        }
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2017-8-28
     * 修改目的：表单方式提交保存图片
     */
    public function upload($field = 'upload', $module = 'member', $catid = 0, $field_type = 'images', $upload_dir = ''){
        pc_base::load_sys_class('attachment', '', 0);
        $siteid = $this->siteid;
        $site_allowext = 'jpg|jpeg|bmp|png|gif';
        $site_allowmaxsize = 20 * 1024 * 1024;
        $attachment = new attachment($module, $catid, $siteid, $upload_dir);
        $attachment->set_userid($this->userid);
        $a = $attachment->upload($field, $site_allowext, $site_allowmaxsize, '', array(0, 0), 1);
        if($a){
            $pictures_url = isset($_POST[$field . '_url']) ? false : true;
            $pictures_alt = isset($_POST[$field . '_alt']) ? false : true;
            $arr_result = $temp = array();
            foreach($a as $k => $v){
                $filepath = $attachment->uploadedfiles[$k]['filepath'];
                $upload_root = pc_base::load_config('system', 'upload_path');
                $filename = $upload_root . $filepath;
                $img_size = getimagesize($filename);
                if($img_size[0] > 2048 || $img_size[1] > 1302){
                    pc_base::load_sys_class('image', '', '0');
                    $image = new image(1, $this->siteid);
                    $image->thumb($filename, $filename, 2048, 1302);
                    $att_db = pc_base::load_model('attachment_model');
                    $filesize = filesize($filename);
                    $att_db->update(array('filesize' => $filesize), array('aid' => $a[$k]));
                }
                $upload_url = pc_base::load_config('system', 'upload_url');
                $result = $upload_url . $filepath;
                if($field_type === 'image') return $result;
                $temp['url'] = $result;
                $temp['alt'] = $attachment->uploadedfiles[$k]['filename'];
                if($pictures_url) $_POST[$field . '_url'][] = $result;
                if($pictures_alt) $_POST[$field . '_alt'][] = $temp['alt'];
                $arr_result[$k] = $temp;
            }
            $result = array2string($arr_result);
            return $result;
        }else{
            $error = ($attachment->error()) ? $attachment->error() : '请选择图片上传';
            showmessage($error, HTTP_REFERER);
        }
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2021-8-10
     * 修改目的：ajax上传图片
     */
    public function ajax_upload_images($field = 'upload', $module = 'member', $catid = 0, $upload_dir = ''){
        pc_base::load_sys_class('attachment', '', 0);
        $siteid = $this->siteid;
        $site_allowext = 'jpg|jpeg|bmp|png|gif|doc|docx|txt';
        $site_allowmaxsize = 20 * 1024 * 1024;
        $attachment = new attachment($module, $catid, $siteid, $upload_dir);
        $attachment->set_userid($this->userid);
        $a = $attachment->upload($field, $site_allowext, $site_allowmaxsize, '', array(0, 0), 1);
        if($a){
            return $attachment->uploadedfiles;
        }else{
            $result['error'] = '没有选择文件';
            echo json_encode($result);
            exit();
        }
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2021-8-3
     * 修改目的：ajax上传附件直接保存
     */
    public function ajax_upload(){
        header('Content-Type: application/json');
        $result = array();
        $upload_url = pc_base::load_config('system', 'upload_url');
        $targetDir = 'PhotosCase/';
        if(isset($_POST['inputName']) && isset($_POST['uploadToken'])){
            if(isset($_FILES[$_POST['inputName']])){
                $token = $_POST['uploadToken'];
                $inputName = $_POST['inputName'];
                if(!$this->validateToken($token)){
                    $result['error'] = '非法提交或请勿重复提交';
                }
                $img_result = $this->ajax_upload_images($inputName, 'member', 0, $targetDir);
                foreach($img_result as $k => $v){
                    $fileName = $v['filename'];
                    $fileSize = $v['filesize'];
                    $targetFile = $upload_url . $v['filepath'];
                    $result = array(
//                        'initialPreview' => $targetFile, // the thumbnail preview data (e.g. image)
                        'caption' => $fileName,
                        'fileUrl' => $targetFile,
                        'initialPreviewConfig' => array(
                            'type' => 'image',      // check previewTypes (set it to 'other' if you want no content preview)
                            'caption' => $fileName, // caption
                            'size' => $fileSize,    // file size
                            'zoomData' => $targetFile, // separate larger zoom data
                            'url' => '/index.php?m=formguide&c=index&a=ajax_delete&formid={$formid}&fileUrl='.$targetFile.'&siteid=<?php echo $this->siteid; ?>',  // the URL for deleting the image/content in the initial preview via AJAX post response.
                        ),
                        'append' => true
                    );
                }
            }else{
                $result['error'] = '没有选择文件';
            }
        }else{
            $result['error'] = '没有选择文件';
        }
        echo json_encode($result);
        exit();
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2021-8-10
     * 修改目的：ajax删除上传的附件
     */
    public function ajax_delete(){
        header('Content-Type: application/json');
        $result = array();
        $targetDir = 'uploadfile/PhotosCaseTemp/';
        if(isset($_POST['key']) && $_POST['key']){

        }else{
            $result['error'] = '没有找到文件';
        }
        echo json_encode($result);
        exit();
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2021-8-3
     * 修改目的：验证ajax上传token
     */
    public function validateToken($token){
        $session_storage = 'session_' . pc_base::load_config('system', 'session_storage');
        pc_base::load_sys_class($session_storage);
        session_start();
        return ($token != $_SESSION['token']) ? false : true;
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2021-8-3
     * 修改目的：ajax上传附件直接保存，可恢复方式上传
     */
    public function ajax_resumable_upload(){
        header('Content-Type: application/json');
        $result = array();
        $preview = $config = $errors = array();
        $upload_root = pc_base::load_config('system', 'upload_path');
        $targetDir = 'uploadfile/PhotosCase/';
        if(!file_exists($targetDir)){
            @mkdir($targetDir);
        }

        $fileBlob = 'fileBlob';                      // the parameter name that stores the file blob
        if(isset($_FILES[$fileBlob]) && isset($_POST['uploadToken'])){
            $token = $_POST['uploadToken'];          // gets the upload token
            if(!$this->validateToken($token)){            // your access validation routine (not included)
                $result['error'] = 'Access not allowed';  // return access control error
            }
            $file = $_FILES[$fileBlob]['tmp_name'];  // the path for the uploaded file chunk
            $fileName = $_POST['fileName'];          // you receive the file name as a separate post data
            $fileSize = $_POST['fileSize'];          // you receive the file size as a separate post data
            $fileId = $_POST['fileId'];              // you receive the file identifier as a separate post data
            $index = $_POST['chunkIndex'];          // the current file chunk index
            $totalChunks = $_POST['chunkCount'];     // the total number of chunks for this file
            $targetFile = $targetDir . '/' . $fileName;  // your target file path
            if($totalChunks > 1){                  // create chunk files only if chunks are greater than 1
                $targetFile .= '_' . str_pad($index, 4, '0', STR_PAD_LEFT);
            }
            $thumbnail = 'unknown.jpg';
            if(move_uploaded_file($file, $targetFile)){
                // get list of all chunks uploaded so far to server
                $chunks = glob("{$targetDir}/{$fileName}_*");
                // check uploaded chunks so far (do not combine files if only one chunk received)
                $allChunksUploaded = $totalChunks > 1 && count($chunks) == $totalChunks;
                if($allChunksUploaded){           // all chunks were uploaded
                    $outFile = $targetDir . '/' . $fileName;
                    // combines all file chunks to one file
                    $this->combineChunks($chunks, $outFile);
                }
                // if you wish to generate a thumbnail image for the file
                //                 $targetUrl = $this->getThumbnailUrl($path, $fileName);
                // separate link for the full blown image file
                $zoomUrl = $targetDir . $fileName;
                $result = array(
                    'chunkIndex' => $index,         // the chunk index processed
                    'initialPreview' => $zoomUrl, // the thumbnail preview data (e.g. image)
                    'initialPreviewConfig' => array(
                        'type' => 'image',      // check previewTypes (set it to 'other' if you want no content preview)
                        'caption' => $fileName, // caption
                        'key' => $fileId,       // keys for deleting/reorganizing preview
                        'fileId' => $fileId,    // file identifier
                        'size' => $fileSize,    // file size
                        'zoomData' => $zoomUrl, // separate larger zoom data
                    ),
                    'append' => true
                );
            } else {
                $result['error'] = 'Error uploading chunk ' . $_POST['chunkIndex'];
            }
        }else{
            $result['error'] = 'No file found';
        }
        echo json_encode($result);
        exit();
    }

    // combine all chunks
    // no exception handling included here - you may wish to incorporate that
    public function combineChunks($chunks, $targetFile){
        // open target file handle
        $handle = fopen($targetFile, 'a+');
        foreach($chunks as $file){
            fwrite($handle, file_get_contents($file));
        }
        // you may need to do some checks to see if file
        // is matching the original (e.g. by comparing file size)
        // after all are done delete the chunks
        foreach($chunks as $file){
            @unlink($file);
        }
        // close the file handle
        fclose($handle);
    }

    /**
     * 修改者：Abel Lan
     * 修改日期：2021-8-10
     * 修改目的：多图片上传移动图片
     * @param string $upload_dir
     * @param string $field
     * @return array|bool|string
     */
    public function move_images($upload_dir = 'PhotosWall', $field = 'img_address'){
        $savepath = $upload_dir . date('Y/md/');
        if(!dir_create($savepath) || !is_dir($savepath)){
            showmessage('创建文件夹失败', HTTP_REFERER);
            return false;
        }
        @chmod($savepath, 0777);
        $upload_url = pc_base::load_config('system', 'upload_url');
        $url_len = strlen($upload_url);
        $attachment_model = pc_base::load_model('attachment_model');
        //取得图片列表
        $pictures = $_POST[$field . '_url'];
        if(!empty($pictures)){
            foreach($pictures as $key => $pic){
                if(!file_exists($pic)) return false;
                $filename = basename($pic);
                $filepath = substr($pic, $url_len);
                $new_pic = $savepath . $filename;
                if(move_uploaded_file($filepath, $new_pic)){
                    $_POST[$field . '_url'][$key] = $new_pic;
                }else{
                    return false;
                }
                $attachment_result = $attachment_model->get_one(array('module' => 'member', 'catid' => '0', 'filepath' => $filepath));
                if($attachment_result){
                    $attachment_model->update(array('filepath' => $new_pic), array('aid' => $attachment_result['aid']));
                }
            }
        }
        return true;
    }
}
?>