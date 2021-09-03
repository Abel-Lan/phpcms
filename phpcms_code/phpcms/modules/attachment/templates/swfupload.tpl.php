<?php $show_header = $show_scroll = 1; include $this->admin_tpl('header', 'attachment');?>
<link href="<?php echo JS_PATH?>swfupload/swfupload.css" rel="stylesheet" type="text/css" />
<link rel="alternate stylesheet" type="text/css" href="<?php echo PLUGIN_STATICS_PATH?>webuploader/webuploader.css" title="styles2" media="screen" />
<script type="text/javascript" src="<?php echo PLUGIN_STATICS_PATH?>webuploader/webuploader.min.js"></script>
<style>
    .addnew input{ display: none;}
    .btupload,.addnew{background: url(/statics/js/swfupload/images/swfBnt.png) no-repeat; float:left; margin-right:10px;width:75px; height:28px; line-height:28px;font-weight:700; color:#fff}
    .btupload{ vertical-align:middle;border:none;cursor:pointer;}
    .addnew{background-position: left bottom;}
    .thumbnail{width: 100px; float: left; overflow: hidden; padding-right: 12px;}

    .attachment-list .img-wrap a.off .icon{background: url(/statics/js/swfupload/images/off.png) no-repeat; height:17px;bottom:5px;*bottom:3px; right:3px; z-index:100; position: absolute; overflow:hidden; width:98px;}
    .attachment-list .img-wrap a.on .icon{background: url(/statics/images/msg_bg.png) no-repeat left -249px;width:16px; height:18px;bottom:4px;*bottom:2px; right:3px; z-index:100; position: absolute; overflow:hidden}

    #fileList .on {position: relative;}
    #fileList .on:after {content: ".";position: absolute;right: 4px;color: #4cae4c;z-index: 99;background: url(/statics/images/msg_bg.png) no-repeat left -249px;width:16px; height:18px;}

    .progress {height: 20px;margin-bottom: 20px;overflow: hidden;background-color: #f5f5f5;border-radius: 4px;-webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);}
    .progress.active .progress-bar{font-weight: bold;-webkit-animation: progress-bar-stripes 2s linear infinite;animation: progress-bar-stripes 2s linear infinite;}
    .progress-striped .progress-bar {background-image: linear-gradient(45deg,rgba(255,255,255,0.15) 25%,transparent 25%,transparent 50%,rgba(255,255,255,0.15) 50%,rgba(255,255,255,0.15) 75%,transparent 75%,transparent);background-size: 40px 40px;}
    .progress-bar(@color: rgba(255,255,255,.15); @angle: 45deg) {
        background-image: -webkit-linear-gradient(@angle, @color 25%, transparent 25%, transparent 50%, @color 50%, @color 75%, transparent 75%, transparent);
        background-image: -o-linear-gradient(@angle, @color 25%, transparent 25%, transparent 50%, @color 50%, @color 75%, transparent 75%, transparent);
        background-image: linear-gradient(@angle, @color 25%, transparent 25%, transparent 50%, @color 50%, @color 75%, transparent 75%, transparent);
        background-repeat: repeat-x;
    }
    .progress-bar{float:left;height:100%;font-size:12px;line-height:20px;color:#fff;text-align:center;background-color:#5cb85c;box-shadow:inset 0 -1px 0 rgba(0, 0, 0, 0.15);transition:width .6s ease;}
</style>

<div class="pad-10">
    <div class="col-tab">
        <ul class="tabBut cu-li">
            <li id="tab_swf_1" class="on" onclick="SwapTab('swf','on','',5,1);"><?php echo L('upload_attachment')?></li>
            <li id="tab_swf_2" onclick="SwapTab('swf','on','',5,2);"><?php echo L('net_file')?></li>
            <?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
                <li id="tab_swf_3" onclick="SwapTab('swf','on','',5,3);set_iframe('album_list','index.php?m=attachment&c=attachments&a=album_load&args=<?php echo $args?>');"><?php echo L('gallery')?></li>
                <li id="tab_swf_4" onclick="SwapTab('swf','on','',5,4);set_iframe('album_dir','index.php?m=attachment&c=attachments&a=album_dir&args=<?php echo $args?>');"><?php echo L('directory_browse')?></li>
            <?php }?>
            <?php if($att_not_used!='') {?>
                <li id="tab_swf_5" class="icon" onclick="SwapTab('swf','on','',5,5);"><?php echo L('att_not_used')?></li>
            <?php }?>
        </ul>
        <div id="uploader" class="wu-example">
            <div id="div_swf_1" class="content pad-10">
                <div>
                    <div class="addnew" style="width: 200px;">
                        <div style="float:left;width: 75px; padding-right: 18px;" id="filePicker">&nbsp;</div>
                        <div id="ctlBtn" style="float:left;width: 75px;text-align: center;" class="btupload"><?php echo L('start_upload')?></div>
                    </div>

                    <div id="nameTip" class="onShow"><?php echo L('upload_up_to')?><font color="red"> <?php echo $file_upload_limit?></font> <?php echo L('attachments')?>,<?php echo L('largest')?> <font color="red"><?php echo $file_size_limit?></font></div>
                    <div class="bk3"></div>

                    <div class="lh24"><?php echo L('supported')?> <font style="font-family: Arial, Helvetica, sans-serif"><?php echo str_replace(array('*.',';'),array('','、'),$file_types)?></font> <?php echo L('formats')?></div><input type="checkbox" id="watermark_enable" value="1" <?php if(isset($watermark_enable) &&$watermark_enable == 1) echo 'checked'?>> <?php echo L('watermark_enable')?>
                </div>
                <div class="bk10"></div>
                <fieldset class="blue pad-10" id="swfupload">
                    <legend><?php echo L('lists')?></legend>
                    <ul class="attachment-list"  id="fsUploadProgress"></ul>
                    <div id="fileList" class="uploader-list"></div>
                </fieldset>
            </div>
        </div>
        <div id="div_swf_2" class="contentList pad-10 hidden">
            <div class="bk10"></div>
            <?php echo L('enter_address')?><div class="bk3"></div><input type="text" name="info[filename]" class="input-text" value=""  style="width:350px;"  onblur="addonlinefile(this)">
            <div class="bk10"></div>
        </div>
        <?php if($allowupload && $this->admin_username && $_SESSION['userid']) {?>
            <div id="div_swf_3" class="contentList pad-10 hidden">
                <ul class="attachment-list">
                    <iframe name="album-list" src="#" frameborder="false" scrolling="no" style="overflow-x:hidden;border:none" width="100%" height="345" allowtransparency="true" id="album_list"></iframe>
                </ul>
            </div>
            <div id="div_swf_4" class="contentList pad-10 hidden">
                <ul class="attachment-list">
                    <iframe name="album-dir" src="#" frameborder="false" scrolling="auto" style="overflow-x:hidden;border:none" width="100%" height="330" allowtransparency="true" id="album_dir"></iframe>
                </ul>
            </div>
        <?php }?>
        <?php if($att_not_used!='') {?>
            <div id="div_swf_5" class="contentList pad-10 hidden">
                <div class="explain-col"><?php echo L('att_not_used_desc')?></div>
                <ul class="attachment-list" id="album">
                    <?php if(is_array($att) && !empty($att)){ foreach ($att as $_v) {?>
                        <li>
                            <div class="img-wrap">
                                <a onclick="javascript:album_cancel(this,<?php echo $_v['aid']?>,'<?php echo $_v['src']?>')" href="javascript:;" class="off"  title="<?php echo iconv('GB2312','UTF-8',   $_v['filename']);?>"><div class="icon"></div><img width="<?php echo $_v['width']?>"  path="<?php echo $_v['src']?>" src="<?php echo $_v['fileimg']?>" title="<?php echo iconv('GB2312','UTF-8',   $_v['filename']);?>"></a>
                            </div>
                        </li>
                    <?php }}?>
                </ul>
            </div>
        <?php }?>
        <div id="att-status" class="hidden"></div>
        <div id="att-status-del" class="hidden"></div>
        <div id="att-name" class="hidden"></div>
        <!-- swf -->
    </div>
</div>
<?php
$sess_id = SYS_TIME;
$swf_auth_key = md5(pc_base::load_config('system','auth_key').$sess_id);
$grouplist = getcache('grouplist','member');
$groupid = $this->groupid;
$isadmin = $this->isadmin;
$userid = $this->userid;
if($isadmin==0 && !$grouplist[$groupid]['allowattachment']) exit('403');
?>
<script>
    jQuery.support.cors = true;
    var is_auto = true;
    jQuery(function() {
        var $ = jQuery,
            $list = $('#fileList'),
            $up_btn = $('#ctlBtn'),
            state = 'pending',
            onerror_img = '',
            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,

            // 缩略图大小
            thumbnailWidth = 100 * ratio,
            thumbnailHeight = 100 * ratio,

            // Web Uploader实例
            uploader;

        // 初始化Web Uploader
        uploader = WebUploader.create({

            auto: is_auto,
            method: 'POST',
            //sendAsBinary: true,
            swf: '<?php echo PLUGIN_STATICS_PATH?>webuploader/Uploader.swf',

            // 文件接收服务端。
            server: '/index.php?m=attachment&c=attachments&a=swfupload&dosubmit=1',

            // 选择文件的按钮。可选。
            // 内部根据当前运行是创建，可能是input元素，也可能是flash.
            pick: '#filePicker',
            fileVal : 'Filedata',
            fileNumLimit : '<?php echo $file_upload_limit;?>',
            fileSingleSizeLimit : '<?php echo $site_setting['upload_maxsize']*1024;?>',
            formData: {
                dosubmit: 1,
                swf_auth_key : '<?php echo $swf_auth_key;?>',
                SWFUPLOADSESSID : '<?php echo $sess_id?>',
                isadmin: '<?php echo $isadmin;?>',
                groupid:'<?php echo $groupid;?>',
                module:'<?php echo $_GET['module'];?>',
                catid:'<?php echo $_GET['catid'];?>',
                siteid:'<?php echo $siteid;?>',
                userid:'<?php echo $userid;?>',
                watermark_enable:'',
            },

            // 只允许选择文件，可选。
            accept: {
                title: '上传文件',
                extensions: '<?php echo str_replace(array('*.',';'),array('',','),$file_types)?>',
                //mimeTypes: 'image/*'
            }
        });

        // 当有文件添加进来的时候
        uploader.on( 'fileQueued', function( file ) {
            var $li = $(
                    '<div id="' + file.id + '" class="file-item thumbnail">' +
                    '<img>' +
                    '<div class="info" style="width: 100px;overflow: hidden;text-overflow: ellipsis;white-space: nowrap">' + file.name + '</div>' +
                    '</div>'
                ),
                $img = $li.find('img');

            $list.append( $li );

            // 创建缩略图
            uploader.makeThumb( file, function( error, src ) {
                if ( error ) {
                    var img_ext_array = new Array('jpg', 'jpeg', 'gif', 'png', 'bmp');
                    console.info(file);
                    if( img_ext_array.indexOf(file.ext) > -1 ){
                        //TODO 浏览器不支持data URI缩略图
                        $img.replaceWith('<span>不能预览</span>');
                    }
                    else{//其他文件,调取对应的ico
                        src = "/statics/images/ext/"+ file.ext +".png";
                        onerror_img = "/statics/images/ext/do.png";
                    }
                }

                $img.attr( 'src', src );
                if(onerror_img){
                    $img.on( 'error', function(){
                        $img.attr( 'src', onerror_img );
                    } );
                }

            }, thumbnailWidth, thumbnailHeight );
        });

        //额外赋值
        uploader.on('uploadBeforeSend', function (obj, data, headers) {
            let watermark = $('#watermark_enable').attr('checked');
            // data.formData= { "watermark_enable": watermark ? 1 : 0 };
            $.extend(data, {"watermark_enable": watermark ? 1 : 0});
        });

        // 文件上传过程中创建进度条实时显示。
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress .progress-bar');
            // 避免重复创建
            if (!$percent.length) {
                $percent = $('<div class="progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>').appendTo($li).find('.progress-bar');
            }
            let percent_value = parseInt(percentage * 100);
            $percent.css('width', percent_value + '%');
            $percent.html(percent_value + '%');
        });

        // 文件上传成功，给item添加成功class, 用样式标记上传成功。
        uploader.on( 'uploadSuccess', function( file,data ) {
            dat = data._raw;
            var arr = dat.split(',');
            var name = arr[3];
            var path = arr[1];
            var file_id = arr[0];

            $('#'+file.id).addClass('upload-state-done');

            $('#'+file.id).children("img").wrapAll('<a href="###" class=""></a>');//兼容老的交互选择方式
            $('#'+file.id+' a').children("img").attr('path', path).attr('title', name);
            $('#'+file.id+' a').attr('title', name);

            $('#'+file.id+' a').on('click', function(){
                album_cancel(this, file_id, path);
            });

            $('#'+file.id+' a').trigger('click');//自动触发click,选中态

            if(typeof(success_callback) == 'function'){
                success_callback(arr);
            }else{
                //alert('callback err');
            }
        });

        // 文件上传失败，现实上传出错。
        uploader.on( 'uploadError', function( file ) {
            var $li = $( '#'+file.id ),
                $error = $li.find('div.error');

            // 避免重复创建
            if ( !$error.length ) {
                $error = $('<div class="error"></div>').appendTo( $li );
            }

            $error.text('上传失败');
        });

        // 完成上传完了，成功或者失败，先删除进度条。
        uploader.on( 'uploadComplete', function( file,data ) {
            //$( '#'+file.id ).find('.progress').remove();
        });

        //获取上传状态
        uploader.on('all', function (type) {
            if (type === 'startUpload') {
                state = 'uploading';
            } else if (type === 'stopUpload') {
                state = 'paused';
            } else if (type === 'uploadFinished') {
                state = 'done';
            }

            if (state === 'uploading') {
                $up_btn.text('暂停上传');
            } else {
                $up_btn.text('开始上传');
            }
        });

        if(is_auto === true){ //自动上传时隐藏开始上传按钮
            $up_btn.hide();
        } else{
            $up_btn.on('click', function () {
                if (state === 'uploading') {
                    uploader.stop();
                } else {
                    uploader.upload();
                }
            });
        }
    });

</script>

</body>
<script type="text/javascript">
    if ($.browser.mozilla) {
        window.onload=function(){
            if (location.href.indexOf("&rand=")<0) {
                location.href=location.href+"&rand="+Math.random();
            }
        }
    }
    function imgWrap(obj){
        $(obj).hasClass('on') ? $(obj).removeClass("on") : $(obj).addClass("on");
    }

    function SwapTab(name,cls_show,cls_hide,cnt,cur) {
        for(i=1;i<=cnt;i++){
            if(i==cur){
                $('#div_'+name+'_'+i).show();
                $('#tab_'+name+'_'+i).addClass(cls_show);
                $('#tab_'+name+'_'+i).removeClass(cls_hide);
            }else{
                $('#div_'+name+'_'+i).hide();
                $('#tab_'+name+'_'+i).removeClass(cls_show);
                $('#tab_'+name+'_'+i).addClass(cls_hide);
            }
        }
    }

    function addonlinefile(obj) {
        var strs = $(obj).val() ? '|'+ $(obj).val() :'';
        $('#att-status').html(strs);
    }

    function set_iframe(id,src){
        $("#"+id).attr("src",src);
    }
    function album_cancel(obj,id,source){
        var src = $(obj).children("img").attr("path");
        var filename = $(obj).attr('title');
        if($(obj).hasClass('on')){
            $(obj).removeClass("on");
            var imgstr = $("#att-status").html();
            var length = $("a[class='on']").children("img").length;
            var strs = filenames = '';
            $.get('/index.php?m=attachment&c=attachments&a=swfupload_json_del&aid='+id+'&src='+source+'&filename='+filename);
            for(var i=0;i<length;i++){
                strs += '|'+$("a[class='on']").children("img").eq(i).attr('path');
                filenames += '|'+$("a[class='on']").children("img").eq(i).attr('title');
            }
            $('#att-status').html(strs);
            $('#att-name').html(filenames);
        } else {
            var num = $('#att-status').html().split('|').length;
            var file_upload_limit = '<?php echo $file_upload_limit?>';
            if(num > file_upload_limit) {alert('<?php echo L('attachment_tip1')?>'+file_upload_limit+'<?php echo L('attachment_tip2')?>'); return false;}
            $(obj).addClass("on");
            $.get('/index.php?m=attachment&c=attachments&a=swfupload_json&aid='+id+'&src='+source+'&filename='+filename);
            $('#att-status').append('|'+src);
            $('#att-name').append('|'+filename);
        }
    }
</script>
</html>