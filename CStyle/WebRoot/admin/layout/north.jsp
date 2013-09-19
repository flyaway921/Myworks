<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function logoutFun() {
	window.location.href="${pageContext.request.contextPath}/userAction!noSession_adminloginout.action"
}
</script>

<div style="position: absolute; left: 0px; bottom: 2px; ">
    <font style="font-size:50px;font-weight:bold;color:red ">大学生风姿网</font>
    <font style="font-size:20px;">后台管理系统</font>
</div>

<div style="position: absolute; right: 5px; bottom: 0px; ">
   <c:if test="${sessioninfo.userId!= null}">欢迎你：<font style="font-weight:bold;color:red ">${sessioninfo.loginName}</font>&nbsp;您的IP地址是：<font style="font-weight:bold;color:red ">${sessioninfo.ip}</font>
	<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#admin_north_pfMenu',iconCls:'icon-user'">用户管理</a> 
    <a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#admin_north_zxMenu',iconCls:'icon-back'">注销</a>
   </c:if>
</div>
<div id="admin_north_pfMenu" style="width: 120px; display: none;">
	<div onclick="$('#admin_north_admininfo').dialog('open');">我的信息</div>
	<div onclick="$('#admin_north_cgpwddialog').dialog('open');">修改密码</div>
</div>

<div id="admin_north_zxMenu" style="width: 100px; display: none;">
	<div onclick="logoutFun();">退出系统</div>
</div>


<div id="admin_north_admininfo" class="easyui-dialog" title="【${sessioninfo.loginName}】的个人信息" style="width:300px;height:250px;margin-top:15px"  
        data-options="modal:true,closed:true">  
   <table >
			<tr >
				<th style="width: 80px;" align="right" >编号：</th>
				<td><input name="id" style="margin-top:4px"  readonly="readonly" value="${sessioninfo.userId}"/>
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">账号：</th>
				<td><input  name="name" style="margin-top:4px" readonly="readonly" value="${sessioninfo.loginName}" />
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">角色：</th>
				<td><textarea  name="role" style="margin-top:4px;font-size: 12px" readonly="readonly"  cols="20" rows="2">${sessioninfo.roleNames}</textarea> 
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">IP地址：</th>
				<td><input name="ip" style="margin-top:4px" readonly="readonly" value="${sessioninfo.ip}"/>
				</td>
			</tr>
		</table>
</div>  


<div id="admin_north_cgpwddialog" class="easyui-dialog" style="padding-top:10px" 
 data-options=" modal:true,
				width:300,
				title:'修改密码',
				height:150,
				closed:true,
				buttons:[{
					text:'确认修改',
					iconCls:'icon-edit',
					handler:function(){
					      $('#admin_north_cpForm').form('submit', {
		              	         url : 'userAction!noAuth_updateAdminPwd.action',
		                		 success : function(r) {
		                		try{
			                		 var obj = jQuery.parseJSON(r);
			                		 if(obj.success){
			                		     $('#admin_north_cgpwddialog').dialog('close')
			                		 }
				                		 $.messager.show({
										title : '提示',
										msg : obj.msg
									    });
							    } catch (e) {
									$.messager.alert('提示', r);
								 }
						      }
				         });
				   }
				  }]">
   <form id="admin_north_cpForm" method="post">			  
         <table >
			<tr>
				<th style="width: 80px;" align="right">新密码：</th>
				<td><input id="admin_north_cgpwd" name="pwd" type="password" class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'" /><input type="hidden" name="id" value="${sessioninfo.userId}"/><font color="red">*</font>
				</td>
			</tr>
			<tr>
				<th style="width: 80px;" align="right">确认密码：</th>
				<td><input name="rpwd" type="password" class="easyui-validatebox" validType="equals['#admin_north_cgpwd']" /><font color="red">*</font>
				</td>
			</tr>
		</table>
		</form>	
</div> 
