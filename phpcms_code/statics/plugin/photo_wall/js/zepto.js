/* Abel Lan, 2017-9-1, 上传前生成预览图片 */
function AbelZepto(obj,fileInfo_v) {
    // 获取上传文件信息集合
    var fileInfo = fileInfo_v;

    // 判断是否为图片大小
    if (fileInfo.size > 1024*1024*8) {
        alert('图片不能大于8M，请重新选择图片');
        return;
    }

    // 判断是否为图片格式
    if (fileInfo.type.indexOf('image') == -1) {
        alert('请选择图片');
        return;
    }

    //获取图片暂存路径
    var url = null ;
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(fileInfo) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(fileInfo) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(fileInfo) ;
    }

    if (url) {
        // 创建一个图片
        var img = new Image();
        // 把获取的图片路径赋值给他
        img.src = url;
        // 这个图片加载后
        img.onload = function () {
            var imgWidth = img.width;
            var imgHeight = img.height;
            var maxWidth = 1000;
            var maxHeight = 650;
            var resultWidth = 0;
            var resultHeight = 0;
            var degree = 0;
            var flag;

            // 图片尺寸按照比例缩放
            if (imgWidth > imgHeight) {
                if (imgWidth > maxWidth) {
                    resultWidth = maxWidth;
                    resultHeight = maxWidth * imgHeight / imgWidth;
                } else {
                    resultWidth = imgWidth;
                    resultHeight = imgHeight;
                }
            } else {
                if (imgHeight > maxHeight) {
                    resultHeight = maxHeight;
                    resultWidth = maxHeight * imgWidth / imgHeight;
                } else {
                    resultWidth = imgWidth;
                    resultHeight = imgHeight;
                }
            }

            // 插入图片并显示
            $('#img_compress').attr('src', url).show();
            $(obj).parent().addClass("change");
            // 给canvas赋值压缩后的宽高
            var canvas = document.querySelector('.upload_box canvas');
            canvas.width = resultWidth;
            canvas.height = resultHeight;

            // 绘图环境
            var ctx = canvas.getContext('2d');

            // 在canvas上存放图片
            ctx.drawImage(img, 0, 0, resultWidth, resultHeight);

            // canvas转base64，图片质量0.7
            var base64 = canvas.toDataURL('image/jpeg', 0.9);

            // 把压缩后的base64存放到img上，方便开发获取
            $('#img_compress').attr('data-src', base64);

            // 测试
            // $('body').append('<img src="'+base64+'" />');
        };
    }
}
//上传前检测表单内容
function fcheckform(img_tyle,date_check,desc_check) {
    if(img_tyle === 1){
        if ($("input[name='img_address']").val() != undefined && $("input[name='img_address']").val() != '') {
            var file_reg = /\.(gif|jpg|jpeg|png|bmp|GIF|JPG|PNG|BMP)$/;
            if (!file_reg.test($("input[name='img_address']").val())) {
                alert('请选择图片');
                $("input[name='img_address']").focus();
                return false;
            } else {
                var files = $("input[name='img_address']").prop('files');
                if(files != undefined){
                    var fileInfo = files[0];
                    if (fileInfo.size > 1024 * 1024 * 8) {
                        alert('图片不能大于8M，请重新选择图片');
                        return false;
                    }
                }
            }
        } else {
            alert('图片不能为空！');
            $("input[name='img_address']").focus();
            return false;
        }
    }

    if(date_check === 1) {
        var date_reg = /^(\d{4})-(\d{2})-(\d{2})$/;
        if (!date_reg.test($('#date').val())) {
            alert('日期格式错误！格式为2017-01-02');
            $('#date').focus();
            return false;
        }
    }

    if(desc_check === 1) {
        var describle_reg = /^([\u4e00-\u9fa5]|[a-zA-Z]|[0-9])([\S]){1,125}/;
        if (!describle_reg.test($('#describle').val())) {
            alert('图片描述至少两个字符！');
            $('#describle').focus();
            return false;
        }
    }

    return true;
}

$('#dosubmit').click(function(){
    if(fcheckform(1,1,1) === true){
        saveButtonControllMoreForm($('#dosubmit'), $('#myform'));
    }else{
        return false;
    }
});

/*
 防止重复提交, 多个form情况下
 */
var saveControllerMoreForm=true;
function saveButtonControllMoreForm(obj, formobj){
    if(saveControllerMoreForm){
        obj.val('上传中');
        $('.last-td').append('<p><b>图片正在上传中……</b></p>');
        saveControllerMoreForm=false;
        formobj.submit();
    }else{
        obj.attr('disabled','disabled');
        alert('上传中，请无重复点击');
    }
}
//多图片上传前检测表单内容
$('#dosubmit_imgs').click(function(){
    if(fcheckform(0,1,1) === true){
        saveButtonControllMoreForm($('#dosubmit_imgs'), $('#myform'));
    }else{
        return false;
    }
});