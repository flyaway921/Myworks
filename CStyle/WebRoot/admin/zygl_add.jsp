<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<div id="admin_zygl_addresource" align="center" style="margin-top: 10px"  >
	<form id="admin_zygl_addForm"  method="post">
		<table >
			<tr>
				<th>资源名称:</th>
				<td><input name="text" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'"  style="width:180px;margin-top:2px"/>
				</td>
			</tr>
			<tr>
				<th>后台路径:</th>
				<td><input name="url" class="easyui-validatebox" data-options="validType:'length[0,100]'" style="width:180px;margin-top:2px"  />
				</td>
			</tr>
			<tr>
				<th>资源排序:</th>
				<td><input  name="seq" class="easyui-numberspinner" data-options="min:0,max:999,editable:false,required:true,missingMessage:'请选择菜单排序'" value="10"  style="width:180px;margin-top:2px" />
				</td>
			</tr>
			<tr>
				<th>上级资源:</th>
				<td><input  id="admin_zygl_add_pid" name="pid" class="easyui-combotree" data-options="url:'resourceAction!getResource.action',parentField :'pid',lines:true" style="margin-top:2px;width:180px;" />
				    <a href="javascript:void(0)" onclick="$('#admin_zygl_add_pid').combotree('clear');"><img   src="javascript/icons/cross.png" style="display:inline-block;vertical-align:middle;border:0" /></a>
				</td>
			</tr>
		</table>
	</form>
</div>