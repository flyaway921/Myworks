<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#admin_update_combogrid').combogrid({
			multiple : true,
			nowrap : false,
			url : 'roleAction!getRole.action',
			panelWidth : 450,
			panelHeight : 200,
			idField : 'id',
			textField : 'text',
			fitColumns : true,
			rownumbers : true,
			editable : false,
			mode : 'remote',
			delay : 500,
			columns : [ [ {
				field : 'id',
				title : '编号',
				width : 150,
				hidden : true
			}, {
				field : 'text',
				title : '角色名称',
				width : 150
			}, {
				field : 'descr',
				title : '角色权限',
				width : 300
			}]]
		});
	});
</script>
<div id="admin_admin_updateuser" style="margin-top:10px" >
<form id="admin_admin_updateForm"  method="post">
		<table >
			<tr>	
				<th style="width: 80px;" align="right" >账号名：</th>
				<td><input name="name" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'" /><input name="id"  type="hidden" /><font color="red">*</font>
				</td>
			</tr>
	
			<tr>
				<th style="width: 80px;" align="right">权限：</th>
				<td><input id="admin_update_combogrid" name="roleids" style="width: 155px;" />
				</td>
			</tr>
		</table>
	</form>
</div>