<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myindex_myinfo" style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;height:672px;padding: 12px">
	            	<div><h2>我的信息</h2></div><hr>
	            	    <form   action="userAction!front_updateUser.action" method="post">
						  <table width="100%" border="0">
						    <tr>
						      <td width="41%" ><strong>帐号名</strong></td>
						      <td width="59%">${usersessioninfo.loginName}</td>
						    </tr>
						    <tr>
						      <td><strong>加入时间</strong></td>
						      <td>${usersessioninfo.createdatetime}</td>
						    </tr>
						    <tr>
						      <td><strong>上次登录时间</strong></td>
						      <td>${usersessioninfo.lastlogintime}</td>
						    </tr>
						    <tr>
						      <td><strong>邮箱</strong></td>
						      <td><input name="id" type="hidden" value="${usersessioninfo.userId}" />
						          <input name="name" type="hidden" value="${usersessioninfo.loginName}" />
						          <input name="mail" value="${usersessioninfo.mail}"  class="easyui-validatebox" data-options="required:true,validType:'email'"/></td>
						    </tr>
						    <tr>
						      <td><strong>真名</strong></td>
						      <td><input type="text" name="realname" value="${usersessioninfo.realname}" /></td>
						    </tr>
						    <tr>
						      <td><strong>性别</strong></td>
						      <td>
						            <select name="sex"   size="1" >
						            <option value="男" >男</option>
          						    <option value="女"  >女</option>
          						    </select>
						      </td>
						    </tr>
						    <tr>
						      <td><strong>生日</strong></td>
						      <td><input type="text" name="birthday" class="easyui-datebox"  data-options="editable:false" value="${usersessioninfo.birthday}" /></td>
						    </tr>
						    <tr>
						      <td><strong>qq</strong></td>
						      <td><input type="text" name="qq" value="${usersessioninfo.qq}" /></td>
						    </tr>
						    <tr>
						      <td><strong>毕业院校</strong></td>
						      <td><input type="text" name="college" value="${usersessioninfo.college}"  /></td>
						    </tr>
						    <tr>
						      <td colspan="2" align="center"><input type="submit"  value="确认修改" /></td>
						    </tr>
						  </table>
						  </form>
						  
						  
						  <div><h2>我的成果</h2></div><hr>
						  <table width="100%" border="0">
					      <tr>
					        <td width="41%"><strong>我的成果数</strong></td>
					        <td width="59%">${worksnum}个&nbsp;&nbsp;<a href="worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}">(查看详情)</a></td>
					      </tr>
					      <tr>
					        <td><strong>我的视频数</strong></td>
					        <td>${videossnum}个&nbsp;&nbsp;<a href="worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}">(查看详情)</a></td>
					      </tr>
					      </table><br>
						    
	                      <div><h2>修改密码</h2></div><hr>
						  <form id="myhome_cgpwd" action="userAction!front_updateUserPwd.action" method="post">
						    <table width="100%" border="0">
						     <tr>
						        <td width="41%"><strong>原密码</strong></td>
						        <td width="59%"><input name="id" type="hidden" value="${usersessioninfo.userId}" /><input type="password" name="oldpwd"  class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'"/></td>
						      </tr>
						      <tr>
						        <td width="41%"><strong>新密码</strong></td>
						        <td width="59%"><input id="myindex_myinfo_pwd" name="pwd"  type="password" class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'" /></td>
						      </tr>
						      <tr>
						        <td><strong>确认密码</strong></td>
						        <td><input name="rpwd" type="password"  class="easyui-validatebox" validType="equals['#myindex_myinfo_pwd']" data-options="required:true"   /></td>
						      </tr>
						       <tr>
						        <td colspan="2" align="center"><input type="submit"  onclick="return myhome_validate()" value="确认修改" /></td>
						      </tr>
						    </table>
						  </form>
	         </div>
        
<c:if test="${usersessioninfo.sex eq '女'}">
<script type="text/javascript">
  $('select').find("option[value='女']").attr("selected",true);
</script>
</c:if>
<script type="text/javascript" >
function myhome_validate(){
       return $('#myhome_cgpwd').form('validate');
	}
</script>
