<?php 
defined('IN_ADMIN') or exit('No permission resources.');
include $this->admin_tpl('header', 'admin');

/*
 * �޸��ߣ�Abel Lan
 * �޸����ڣ�2017-8-28
 * �޸�Ŀ�ģ�ʹ�ο�Ҳ�����ϴ�������Ӧ������ƬǽͼƬ�ϴ�
 * �޸ı�ţ�photos-wall-002
 * photos-wall-002���Ӵ��뿪ʼ
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
							<a href="javascript:window.top.art.dialog({id:'add',iframe:'?m=formguide&c=formguide_info&a=public_add&formid=<?php echo $formid?>', title:'�����Ϣ', width:'700', height:'500', lock:true});void(0);">
								<em>�����Ϣ</em>
							</a>
							<span>|</span>
							<a href="?m=content&c=index&a=lists&catid=43" target="_blank"><em>Ԥ����Ƭǽ</em></a>
						</div>
					</td>
				</tr>
			</table>
			<table width="100%" cellspacing="0">
				<thead>
				<tr>
					<th width="5%" align="center"><input type="checkbox" value="" id="check_box" onclick="selectall('did[]');"></th>
					<th width="5%" align="center">ID</th>
					<th width="15%" align="center">��Ƭ</th>
					<th width="25%" align="center">����</th>
					<th width='10%' align="center">��������</th>
					<th width='10%' align="center">�ϴ�����</th>
					<th width='10%' align="center">�ϴ���IP</th>
					<th width='10%' align="center">���״̬</th>
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
								<a href="javascript:window.top.art.dialog({title:'<?php echo $d['describle']?>',fixed:true, content:'<img src=\'<?php echo $d['img_address'] ?>\' style=\'max-height: 551px;\' />'});">
									<img src="<?php echo $d['img_address'] ?>" style=" height: 50px;">
								</a>
							</td>
							<td><?php echo $d['describle'] ?></td>
							<td align="center"><?php echo $d['date'] ?></td>
							<td align="center"><?php echo date('Y-m-d', $d['datetime']) ?></td>
							<td align="center"><?php echo $d['ip'] ?></td>
							<td align="center">
								<?php if($d['status'] == 1){ ?>
									<font color="green">��ͨ��</font>
								<?php }else{ ?>
									<a href="?m=formguide&c=formguide_info&a=public_pass&formid=<?php echo $formid ?>&did=<?php echo $d['dataid']?>" title="������ͨ��"><font color="#ff4500">�����</font></a>
								<?php } ?>
							</td>
							<td align="center"><a href="javascript:check('<?php echo $formid ?>', '<?php echo $d['dataid'] ?>', '<?php echo safe_replace($d['username']) ?>');void(0);"><?php echo L('check') ?></a>
								| <a href="javascript:window.top.art.dialog({id:'add',iframe:'?m=formguide&c=formguide_info&a=public_edit&formid=<?php echo $formid?>&did=<?php echo $d['dataid']?>', title:'�༭��Ϣ--<?php echo $d['describle'] ?>', width:'700', height:'500', lock:true});void(0);">�༭</a>
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
				<input name="submit" type="submit" class="button" value="���ͨ��ѡ��"
					   onClick="document.myform.action='?m=formguide&c=formguide_info&a=public_pass&formid=<?php echo $formid ?>'">&nbsp;&nbsp;
			</div>
		</div>
		<div id="pages"><?php echo $pages; ?></div>
	</form>
</div>
<?php
}else{
//photos-wall-002���Ӵ������
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
<?php } //photos-wall-002���Ӵ���(����) ?>
</body>
</html>
<script type="text/javascript">
function check(id, did, title) {
	window.top.art.dialog({id:'check'}).close();
	window.top.art.dialog({title:'<?php echo L('check')?>--'+title+'<?php echo L('submit_info')?>', id:'edit', iframe:'?m=formguide&c=formguide_info&a=public_view&formid='+id+'&did='+did ,width:'700px',height:'500px'}, function(){window.top.art.dialog({id:'check'}).close()});
}
</script>