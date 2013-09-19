<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	$('#admin_jsgl_update_resourcetree').combotree({  
	    url: 'resourceAction!getResource.action',  
	    parentField : 'pid',
	    lines : true,
	    multiple:true
	});  
})
</script>
<div  style="margin-top: 10px"  >
	<form id="admin_jsgl_updateForm"  method="post">
		<table >
		
			<tr>	
				<th style="width: 100px;" align="right" >角色名：</th>
				<td><input name="text" class="easyui-validatebox" data-options="required:true,validType:'length[1,50]'"  style="margin-top:5px;width: 180px;"/><input name="id"  type="hidden"/>
				</td>
			</tr>
			<tr>
				<th style="width: 100px;" align="right">权限描述：</th>
				<td><input name="descr" type="easyui-validatebox" class="easyui-validatebox" data-options="validType:'length[0,50]'"  style="margin-top:5px;width: 180px;"/>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px;" align="right">可访问资源：</th>
				<td><input id="admin_jsgl_update_resourcetree" name="resourceIds" style="width: 230px;" />
				 <a href="javascript:void(0)" onclick="$('#admin_jsgl_update_resourcetree').combotree('clear');"><img   src="javascript/icons/cross.png" style="display:inline-block;vertical-align:middle;border:0" /></a>
				</td>
			</tr>
		</table>
	</form>
</div>