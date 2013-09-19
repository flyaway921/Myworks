<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="/struts-tags" prefix="s"%>
  

<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ClodNote</title>
<script src="JavaScript/javascript.js" type="text/javascript"></script>
<link href="css/layout.css" rel="stylesheet" type="text/css" />
</head>


<body>
    <div id="container">
        
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
        <div id="content">
            <form class="form_reg" action="register.action" onsubmit="return validate_form(this)"  method="post" >
            	
                <center><h2 class="title">用户注册</h2></center>
                <center><FONT color="red"><s:actionerror/></FONT></center>
                <br/>
                <label class="input_label">用户名：&nbsp;&nbsp;&nbsp;</label>
                <input  name="username" class="input_textbar" type="text"/><br/><br/>
                <label class="input_label">密&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;</label>
                <input name="password" class="input_textbar" type="password"/><br/><br/>
                <label class="input_label">确认密码：</label>
                <input name="repassword" class="input_textbar" type="password"/><br/><br/>
                <label class="input_label">邮&nbsp;&nbsp;&nbsp;箱：&nbsp;&nbsp;&nbsp;</label>
                <input name="mail" class="input_textbar" type="text"/><br/><br/>
                <hr/>
                <input type="submit" class="btn"  id="btn_reg" value="注册"/>
                <input type="button" class="btn" onclick="jump_cloud_note()" value="返回" />
            </form>
        </div>    
        <div class="clear"></div>
        
        <div id="footer">
        </div>
    </div>
</body>
</html>
