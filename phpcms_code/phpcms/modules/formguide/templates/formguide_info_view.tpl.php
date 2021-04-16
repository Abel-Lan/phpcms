<?php 
defined('IN_ADMIN') or exit('No permission resources.');
$show_header = 1;
include $this->admin_tpl('header', 'admin');
?>
<div class="pad-10">
<table width="100%" cellspacing="0" class="table-list">
	<thead>
		<tr>
			<th width="15%" align="right"><?php echo L('selects')?></th>
			<th align="left"><?php echo L('values')?></th>
		</tr>
	</thead>
<tbody>
 <?php
if(is_array($forminfos_data)){
	foreach($forminfos_data as $key => $form){
?>   
	<tr>
		<?php
		/*
		* �޸��ߣ�Abel Lan
		* �޸����ڣ�2017-8-28
		* �޸�Ŀ�ģ�����ǰ̨�ύ��ͼƬ���ں�̨�鿴�ǿ���Ԥ��
		* �޸ı�ţ�formfuide-preview-photo-001
		* formfuide-preview-photo-001�޸�ǰ��ʼ
		<td><?php echo $fields[$key]['name']?>:</td>
		<td><?php echo $form?></td>
		* formfuide-preview-photo-001�޸�ǰ����
		* formfuide-preview-photo-001�޸ĺ�ʼ
		*/
		?>
		<?php if( $fields[$key]['formtype'] === 'image') { ?>
			<td><?php echo $fields[$key]['name']?>:</td>
			<td><a href="<?php echo $form; ?>" target="_blank"><img src="<?php echo $form ;?>" style=" height: 200px; float: left; margin-right: 5px; margin-bottom: 5px;"></a></td>
		<?php }elseif( $fields[$key]['formtype'] === 'images') { ?>
			<td><?php echo $fields[$key]['name']?>:</td>
			<td>
				<?php foreach( $form as $v ){ ?>
					<a href="<?php echo $v['url'] ;?>" target="_blank"><img src="<?php echo $v['url'] ;?>" style=" height: 100px; float: left; margin-right: 5px; margin-bottom: 5px;"></a>
				<?php } ?>
			</td>
		<?php }else{ ?>
			<td><?php echo $fields[$key]['name']?>:</td>
			<td><?php echo $form?></td>
		<?php } ?>
		<?php
		//formfuide-preview-photo-001�޸ĺ����
		?>
		</tr>
<?php 
	}
}
?>
	</tbody>
</table>

</div>
</body>
</html>