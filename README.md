# phpcms  

【这是已经安装好的phpcms模板，数据库存放位置：/install/phpcms_db.sql】
>**数据库名：** phpcms_db<br>
>**链接数据库用户名：** root<br>
>**链接数据库密码：** 空
>
>后台登陆地址：http://phpcms.com/admin.php<br>
>后台登陆用户名：admin<br>
>后台登陆密码：admin123
>
>登陆后台可以更改域名网址、密码，傻瓜式操作

<br>【后台界面】
![](statics/admin_login/images/demo1001.png) 

##(更新时间：2021-04-15 10:20)
##更新
    1. 修复php7.4以后版本支持bug（get_magic_quotes_gpc）
    2. 修复bug：在添加或编辑文章内容时，会将文章所属栏目直接生成5个列表静态页面文件(而未考虑文章不足５页)
    3. 修改 添加工作流后，待审核文章也可修改；修复审核时状态status无法改变，及更新栏目静态页和首页

##(更新时间：2021-04-13 11:20)
##更新
    1. 修复https的bug，主要修复遗漏的http验证
    2. 修复mysqli连接数据库bug："continue" targeting switch is equivalent to "break". Did you mean to use "continue 2"? | phpcms\libs\classes\db_mysqli.class.php | 245
    3. 修改后台登陆界面

##(更新时间：2019-03-21 11:20)
介绍
>该仓库是在phpcms v9.6.3的镜像基础上进行维护的。

>由于各种原因phpcms官方几乎不再维护，而大量的phpcms用户面临着各种bug风险。

>现在我们建立此仓库提供bug修复、新模块、新插件，继续让phpcms在网站开发建设的路上发光发热，紧跟时代步伐。

更新

    1.支持https<br>
    2.支持PHP7<br>
    3.修复阅读收费失效的问题<br>
    4.修复高版本MySQL环境下的安装问题<br>
    5.修复发布内容时绕过审核的漏洞<br>
    6.修复文件包含漏洞<br>
    7.修正动态或伪静态下分页不存在时未输出404的问题<br>
    8.修复联动菜单在全站更新缓存后显示出错的问题<br>
    9.【中危】修复利用伪造模板名称生成任意脚本的漏洞<br>
    10.修复利用构造referer的xss攻击<br>
    ......

 