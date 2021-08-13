<?php 
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');

/*
 * 修改者：Abel Lan
 * 修改日期：2017-8-28
 * 修改目的：使游客也可以上传附件，应用于照片墙图片上传
 * 修改编号：photos-wall-002
 * photos-wall-002增加代码开始
 */
$formid = intval($_GET['formid']);
if($formid === 12) {
?>
<div class="pad-lr-10">
	<form name="myform" action="?m=formguide&c=formguide_info&a=delete" method="post">
		<div class="table-list">
			<table width="100%" border="0" cellpadding="10">
				<tr >
					<td width="35">&nbsp;</td>
					<td>
						<div class="content-menu blue">
							<a href="javascript:window.top.art.dialog({id:'add',iframe:'?m=formguide&c=formguide_info&a=public_add&formid=<?php echo $formid?>', title:'添加信息', width:'700', height:'500', lock:true});void(0);">
								<em>添加信息</em>
							</a>
							<span>|</span>
							<a href="?m=content&c=index&a=lists&catid=43" target="_blank"><em>预览照片墙</em></a>
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" cellspacing="0">
				<thead>
				<tr>
					<th width="5%" align="center"><input type="checkbox" value="" id="check_box" onclick="selectall('did[]');"></th>
					<th width="5%" align="center">ID</th>
					<th width="15%" align="center">照片</th>
					<th width="25%" align="center">描述</th>
					<th width='10%' align="center">拍照日期</th>
					<th width='10%' align="center">上传日期</th>
					<th width='10%' align="center">上传者IP</th>
					<th width='10%' align="center">审核状态</th>
					<th width="10%" align="center"><?php echo L('operation') ?></th>
				</tr>
				</thead>
				<tbody>
				<?php
				if (is_array($datas)) {
					foreach ($datas as $d) {
						?>
						<tr>
							<td align="center">
								<input type="checkbox" name="did[]" value="<?php echo $d['dataid'] ?>">
							</td>
							<td align="center"><?php echo $d['dataid']?></td>
							<td align="center">
                                <?php if (!is_null(json_decode($d['img_address']))){
                                    $imgs = string2array($d['img_address']);
                                    foreach( $imgs as $v ){ ?>
                                        <a href="javascript:window.top.art.dialog({title:'<?php echo $d['describle'] ?>',fixed:true, content:'<a href=\'<?php echo $v['url']; ?>\' target=\'_blank\'><img src=\'<?php echo $v['url'] ?>\' style=\'max-height: 551px;\' /></a>'});">
                                            <img src="<?php echo $v['url']; ?>" style=" height: 50px; float: left; margin-right: 5px; margin-bottom: 5px;">
                                        </a>
                                    <?php }
                                }else{ ?>
                                    <a href="javascript:window.top.art.dialog({title:'<?php echo $d['describle']?>',fixed:true, content:'<a href=\'<?php echo $d['img_address']; ?>\' target=\'_blank\'><img src=\'<?php echo $d['img_address'] ?>\' style=\'max-height: 551px;\' /></a>'});">
                                        <img src="<?php echo $d['img_address'] ?>" style=" height: 50px;">
                                    </a>
                                <?php } ?>
							</td>
							<td><?php echo $d['describle'] ?></td>
							<td align="center"><?php echo $d['date'] ?></td>
							<td align="center"><?php echo date('Y-m-d', $d['datetime']) ?></td>
							<td align="center"><?php echo $d['ip'] ?></td>
							<td align="center">
								<?php if($d['status'] == 1){ ?>
									<font color="green">已通过</font>
								<?php }else{ ?>
									<a href="?m=formguide&c=formguide_info&a=public_pass&formid=<?php echo $formid ?>&did=<?php echo $d['dataid']?>" title="点击审核通过"><font color="#ff4500">待审核</font></a>
								<?php } ?>
							</td>
							<td align="center"><a href="javascript:check('<?php echo $formid ?>', '<?php echo $d['dataid'] ?>', '<?php echo safe_replace($d['username']) ?>');void(0);"><?php echo L('check') ?></a>
								| <a href="javascript:window.top.art.dialog({id:'add',iframe:'?m=formguide&c=formguide_info&a=public_edit&formid=<?php echo $formid?>&did=<?php echo $d['dataid']?>', title:'编辑信息--<?php echo $d['describle'] ?>', width:'700', height:'500', lock:true});void(0);">编辑</a>
								| <a href="?m=formguide&c=formguide_info&a=public_delete&formid=<?php echo $formid ?>&did=<?php echo $d['dataid'] ?>"
									onClick="return confirm('<?php echo L('confirm', array('message' => L('delete'))) ?>')"><?php echo L('del') ?></a>
							</td>
						</tr>
						<?php
					}
				}
				?>
				</tbody>
			</table>

			<div class="btn"><label for="check_box"><?php echo L('selected_all') ?>
					/<?php echo L('cancel') ?></label>
				<input name="submit" type="submit" class="button" value="<?php echo L('remove_all_selected') ?>"
					   onClick="document.myform.action='?m=formguide&c=formguide_info&a=public_delete&formid=<?php echo $formid ?>';return confirm('<?php echo L('affirm_delete') ?>')">&nbsp;&nbsp;
				<input name="submit" type="submit" class="button" value="审核通过选中"
					   onClick="document.myform.action='?m=formguide&c=formguide_info&a=public_pass&formid=<?php echo $formid ?>'">&nbsp;&nbsp;
			</div>
		</div>
		<div id="pages"><?php echo $pages; ?></div>
	</form>
</div>
<?php
}else{
//photos-wall-002增加代码结束
?>
<div class="pad-lr-10">
<form name="myform" action="?m=formguide&c=formguide_info&a=delete" method="post">
<div class="table-list">
    <table width="100%" cellspacing="0">
        <thead>
            <tr>
            <th width="35" align="center"><input type="checkbox" value="" id="check_box" onclick="selectall('did[]');"></th>
			<th align="center"><?php echo L('username')?></th>
			<th width='250' align="center"><?php echo L('userip')?></th>
			<th width='250' align="center"><?php echo L('times')?></th>
			<th width="250" align="center"><?php echo L('operation')?></th>
            </tr>
        </thead>
    <tbody>
 <?php 
if(is_array($datas)){
	foreach($datas as $d){
?>   
	<tr>
	<td align="center">
	<input type="checkbox" name="did[]" value="<?php echo $d['dataid']?>">
	</td>
	<td><?php echo $d['username']?> </td>
	<td align="center"><?php echo $d['ip']?></td>
	<td align="center"><?php echo date('Y-m-d', $d['datetime'])?></td>
	<td align="center"><a href="javascript:check('<?php echo $formid?>', '<?php echo $d['dataid']?>', '<?php echo safe_replace($d['username'])?>');void(0);"><?php echo L('check')?></a> | <a href="?m=formguide&c=formguide_info&a=public_delete&formid=<?php echo $formid?>&did=<?php echo $d['dataid']?>" onClick="return confirm('<?php echo L('confirm', array('message' => L('delete')))?>')"><?php echo L('del')?></a></td>
	</tr>
<?php 
	}
}
?>
</tbody>
    </table>
  
    <div class="btn"><label for="check_box"><?php echo L('selected_all')?>/<?php echo L('cancel')?></label>
		<input name="submit" type="submit" class="button" value="<?php echo L('remove_all_selected')?>" onClick="document.myform.action='?m=formguide&c=formguide_info&a=public_delete&formid=<?php echo $formid?>';return confirm('<?php echo L('affirm_delete')?>')">&nbsp;&nbsp;</div>  </div>
 <div id="pages"><?php echo $pages;?></div>
</form>
</div>
<?php } //photos-wall-002增加代码(此行) ?>
</body>
</html>
<script type="text/javascript">
function check(id, did, title) {
	window.top.art.dialog({id:'check'}).close();
	window.top.art.dialog({title:'<?php echo L('check')?>--'+title+'<?php echo L('submit_info')?>', id:'edit', iframe:'?m=formguide&c=formguide_info&a=public_view&formid='+id+'&did='+did ,width:'700px',height:'500px'}, function(){window.top.art.dialog({id:'check'}).close()});
}
</script>