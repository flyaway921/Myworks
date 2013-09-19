<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<s:if test="mail!=null"> 
<script   language=javascript> 
      alert("恭喜你！注册成功！"); 
</script> 
</s:if>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CloudNote</title>
<script src="JavaScript/javascript.js" type="text/javascript"></script>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
	
<div id="container">
	
        <!--header-->
    <div id="header">
    	<span class="nav_logo"></span>
   		<!--<img  src="images/cloudnote_193-58.png" width="206" height="68"/>-->
        <ul>
			<li><a href="cloud_note.jsp">首页</a></li>
            <li><a href="introduce.html">产品介绍</a></li>
            <li><a href="sugetions.jsp">意见反馈</a></li>
            <li><a href="contact_us.html">联系我们</a></li> 
        </ul>
        <div class="clear"></div>
        <div class="bluebar"></div>
    </div>
    
    <!--content-->

  <div id="content" class="index_bg">
 	<div class="login" >
    	<center><p class="title"><br/>----网页端登录----</p></center>
    	<center><FONT color="red"><s:actionerror/></FONT></center>
    	
        <form id="formlogin" class="form_login" action="login.action"  method="post">
            
            	<label for="username" class="input_label"  >用户名:&nbsp;</label>
            	<input type="text" name="username" id="username" class="input_textbar"  onfocus="onfo(this)" onblur="onbl(this)"   />
            
            
            <br/><br/>
            
            	<label for="password" class="input_label" >密&nbsp;&nbsp;码&nbsp;:&nbsp;</label>
           		<input type="password" name="password" id="password" class="input_textbar" onfocus="onfo(this)" onblur="onbl(this)"/>
            
            <br/><br/>
            
            <center><span ><a class="btn_login" href="javascript:validate_login()">登&nbsp;录</a></span></center>
               <br/>
               
            <center><span class="btn_reg" ><a href="register.jsp">注册</a>&nbsp;|&nbsp;<a href="javascript:alert('请联系管理员。。。。。');" >忘记密码</a></span>
            <br/><br/></center>
            <hr />
            
            <center><p class="title">----手机端下载----</p></center><br/>
  
            <p class="version"><span>大小：1.73MB</span><br/><span>版本号：version 1.0</span><br/><span>适用系统：Android 2.3以上</span></p>
            <br/>
   			<center><p><a  href="download.action" class="btn_download"></a></p></center>
			
        </form>
    </div>
    <div class="clear"></div>
    
   </div>

    <div class="clear"></div>
    <div id="footer">
 	</div>
  
</div>


</body>
</html>