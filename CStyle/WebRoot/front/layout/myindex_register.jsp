<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myindex_register" style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;height:672px;padding: 12px">
	            	<div><h2>用户注册</h2></div><hr>
	            	    <form   action="userAction!front_register.action" method="post">
						  <table width="100%" border="0">
						    <tr>
						      <td width="41%" ><strong>帐号名</strong></td>
						      <td width="59%"><input  id="myindex_name" name="name"  class="easyui-validatebox" style="width: 165px" data-options="required:true,validType:'length[1,50]'"/><font size="3px" id="myindex_checkname" color="red">*</font></td>
						    </tr>
						    <tr>
						      <td width="41%" ><strong>密码</strong></td>
						      <td width="59%"><input  id="myindex_add_pwd" name="pwd" type="password" style="width: 165px" class="easyui-validatebox" data-options="required:true,validType:'length[5,18]'"/><font size="3px" color="red">*</font></td>
						    </tr>
						    <tr>
						      <td width="41%" ><strong>确认密码</strong></td>
						      <td width="59%"><input  id="myindex_add_pwd" name="rpwd" type="password" style="width: 165px" class="easyui-validatebox" data-options="required:true" validType="equals['#myindex_add_pwd']"/><font size="3px" color="red">*</font></td>
						    </tr>
						    <tr>
						      <td><strong>邮箱</strong></td>
						      <td><input name="mail" class="easyui-validatebox"  style="width: 165px" data-options="required:true,validType:'email'" /><font size="3px" color="red">*</font></td>
						    </tr>
						    <tr>
						      <td><strong>真名</strong></td>
						      <td><input type="text" name="realname" style="width: 165px"/></td>
						    </tr>
						    <tr>
						      <td><strong>性别</strong></td>
						      <td><select name="sex"  size="1" >
          						    <option value="男" selected="selected">男</option>
          						    <option value="女">女</option>
       							   </select>
						      </td>
						    </tr>
						    <tr>
						      <td><strong>生日</strong></td>
						      <td><input type="text" name="birthday" style="width: 165px" class="easyui-datebox" data-options="editable:false" /></td>
						    </tr>
						    <tr>
						      <td><strong>qq</strong></td>
						      <td><input type="text" name="qq" style="width: 165px" /></td>
						    </tr>
						    <tr>
						      <td><strong>毕业院校</strong></td>
						      <td><input type="text" name="college" style="width: 165px" /></td>
						    </tr>
						    <tr>
						      <td colspan="2" align="center"><input type="submit" onclick="return myindex_register_validate()" value="注册" /></td>
						    </tr>
						  </table>
						  </form>
	         </div>
<script type="text/javascript" >
function myindex_register_validate(){
       return $('#myindex_register').form('validate');
	}
$("#myindex_name").blur(function() {
	if(this.value.trim()!=""){
	  var name=this.value
	  $.ajax({
		   type: "POST",
		   url: "userAction!front_checkNameIsHave.action",
		   data: "name="+name,
		   success: function(r){
		      if(r=='true'){
		    	 $("#myindex_checkname").html('*');
		    	 $(":submit").attr("disabled",false); 
			 }else{
				 $("#myindex_checkname").html('该用户已被注册');
				 $(":submit").attr("disabled",true); 
			 }
		   }
		});
	}
});


</script>