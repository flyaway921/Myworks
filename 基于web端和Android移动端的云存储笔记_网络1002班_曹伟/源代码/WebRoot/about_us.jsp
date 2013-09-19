<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String username=(String)request.getSession().getAttribute("username");
if(username==null){
  	response.sendRedirect("cloud_note.jsp");		
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>云笔记</title>
<link href="css/layout2.css" rel="stylesheet" type="text/css" />
<script src="JavaScript/javascript2.js" type="text/javascript"></script>
</head>

<body>
	<div id="container">
    
    	<div id="header">
	        <ul>
	        	<li><center><a href="aboutnote!listuserinfo">概况</a></center></li>
	        	<li><center><a href="aboutnote!listnote?page=1">我的笔记</a></center></li>
	            <li style="width:90px;"><center><a href="download.action">手机端下载</a></center></li>
	            <li><center><a href="about_us.jsp">关于我们</a></center></li>
	            <li class="exit"><center><a href="loginout.action" onclick="return exit_verify()">退出登录</a></center></li>
	            
	        </ul>
        </div>
        <div class="clear"></div>
        <div id="content" class="about_us_content">
        	<div class="about_us_info">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Email:<a href="mailto: flyaway_921@hotmail.com">flyaway_921@hotmail.com</a>	</div>
        </div>
    </div>
</body>
</html>
        