<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(function() {
		$('#admin_add_combogrid').combogrid({
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
<div id="admin_admin_adduser" style="margin-top: 10px"  >
	<form id="admin_admin_addForm"  method="post">
		<table >
			
			<tr>	
				<th style="width: 80px;" align="right" >账号名：</th>
				<td><input name="name" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'" /><font color="red">*</font>
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">密码：</th>
				<td><input id="admin_add_pwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'" /><font color="red">*</font>
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">确认密码：</th>
				<td><input name="rpwd" type="password" class="easyui-validatebox" data-options="required:true" validType="equals['#admin_add_pwd']"/><font color="red">*</font>
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">权限：</th>
				<td><input id="admin_add_combogrid" name="roleids" style="width: 155px;" />
				</td>
			</tr>
		</table>
	</form>
</div>