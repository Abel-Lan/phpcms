<?php
/*
 * 添加者：Abel Lan
 * 修改日期：2017-8-28
 * 修改目的：后台编辑表单向导内容
 */

defined('IN_ADMIN') or exit('No permission resources.');
$show_header = 1;
include $this->admin_tpl('header', 'admin');
?>
<div class="pad-10">
<form name="myform" id="myform" method="post" action="?m=formguide&c=formguide_info&a=public_add&formid=<?php echo $formid?>" enctype="multipart/form-data">
<table width="100%" cellspacing="0" class="table-list">
	<thead>
		<tr>
			<th width="15%" align="right"><?php echo L('selects')?></th>
			<th align="left"><?php echo L('values')?></th>
		</tr>
	</thead>
<tbody>
<?php
if(is_array($forminfos_fields)) {
 foreach($forminfos_fields as $field=>$info) {
	 if($info['isomnipotent']) continue;
	 if($info['formtype']=='omnipotent') {
		foreach($forminfos_fields as $_fm=>$_fm_value) {
			if($_fm_value['isomnipotent']) {
				$info['form'] = str_replace('{'.$_fm.'}',$_fm_value['form'],$info['form']);
			}
		}
	}
 ?>
	<tr>
      <th width="80"><?php if($info['star']){ ?> <font color="red">*</font><?php } ?> <?php echo $info['name']?>
	  </th>
      <td><?php echo $info['form']?>  <?php echo $info['tips']?></td>
    </tr>
<?php
} }
?><input name="dosubmit" type="hidden" value="dosubmit" />
<tr>
      <th width="80">
	  </th>
      <td><input type="submit" class="button"  value=" <?php echo L('ok')?> "></td>
    </tr>
	</tbody>
</table>
</form>

</div>
</body>
</html>