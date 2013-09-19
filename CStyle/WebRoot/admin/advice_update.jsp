<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function() {
	$('#admin_advice_update_textarea').xheditor({
		tools : 'full',
		html5Upload : false,
		upMultiple : 1,
		cleanPaste:2,
		//upLinkUrl : 'fileAction!fileupload.action',
		//upLinkExt : 'zip,rar,txt,doc,docx,xls,xlsx,ppt,pptx',
		upImgUrl : 'fileAction!fileupload.action',
		upImgExt : 'jpg,jpeg,gif,png'
	});
});
</script>
<div  style="margin-top:15px">
	<form id="admin_advice_updateForm" method="post">
		<table >
			<tr align="center" height="40px">
				<th style="width: 60px;" align="right"></th>
				<td>标题:<input name="title" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'" /><input name="id" type="hidden" /><font color="red">*</font>
				</td>
			</tr>
			<tr align="center">
				<th style="width: 60px;" align="right">描述:</th>
				<td ><textarea id="admin_advice_update_textarea" name="content" style="height: 380px;width: 450px;"></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>