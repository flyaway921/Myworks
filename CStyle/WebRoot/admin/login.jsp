<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>管理员登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery-1.8.0.min.js"></script>
	<link href="css/bootstrap.css" rel="stylesheet">
	<link href="css/flat-ui.css" rel="stylesheet">

<style type="text/css">
body{background-color: #3498A1; font-family:"微软雅黑", "宋体", Arial, "MS Serif";}
#login{width: 600px; height: 400px;  margin:auto auto;background-color: inherit; margin-top: 100px; }
#login_top{background-color:inherit;background-image:url("images/front/rect.gif"); height: 50px; padding-top: 10px; }
#login_top .title{font-size: 22px; font-weight: bolder; width:100px; disdplay:block;margin: auto;}
#login_bottom{background-color:inherit; background-image:url("images/front/rect.gif");background-position:0 -50px; height: 50px; }
#login_center{width: 100%; height: 255px; background-color:#ffffff; padding-top: 40px;}
.loginForm{ margin: auto auto;}
.loginForm tr{height: 35px; margin-top: 30px; }
.loginForm tr td{width: 250px;}
.loginForm tr td input[type="text"],input[type="password"] { line-height: 25px; vertical-align: middle;}
</style>
  </head>
  
  <body>
  <center>
    <div id="login">
    	<div id="login_top">
    		<span class="title">管理员登录</span>
    	</div>
    	
    	<div id="login_center">
	        
		    <form action="userAction!noSession_login.action" method="post">
				<table  class="loginForm" align="center"   >
					<tr>
						<th style="width: 80px; ">账&nbsp;号：</th>
						<td align="left"><input type="text" name="name" class="span3"  id="name" style="height: 35px; width: 206px; padding: 0;" />
						</td>
					</tr>
					
					<tr>
						<th>密&nbsp;码：</th>
						<td align="left"><input type="password" name="pwd" class="span3" style="height: 35px; width: 206px; padding: 0;" />
						</td>
					</tr>
					
					<tr>
						<th>验证码：</th>
						<td align="left"><input type="text" name="rand" class="span3"  style="width: 120px; height: 35px;  padding: 0;"  /><span style="margin-left:15px;"><img id="confirm_img" onclick="this.src='admin/image.jsp?'+Math.random();" src="admin/image.jsp" style="width: 60px; height: 25px; cursor:pointer;" border="1"/></span>
						</td>
					</tr>
					<tr>
						<td colspan="2"  style="width: 100%; padding-top: 10px;">
							<div style="height:40px; width:130px; float: left; "><input type="submit"  class="btn btn-large btn-block" id="btn_sub" value="提交" /></div>
							<div style=" height:40px; width:130px; float: right; "><input type="reset" class="btn btn-large btn-block" id="btn_res" value="重置"  /></div>
						</td>
					</tr>
				</table>
			</form>
    	</div>
    	<div id="login_bottom"></div>
    </div>
  </center>
  
 
  
  
  </body>
</html>
