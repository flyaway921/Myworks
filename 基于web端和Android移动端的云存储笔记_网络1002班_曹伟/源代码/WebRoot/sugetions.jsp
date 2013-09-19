<%@ page  contentType="text/html; charset=utf-8"  language="java"  pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<s:if test="advice!=null"> 
<script   language=javascript> 
      alert("恭喜你！留言成功！"); 
</script> 
</s:if>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <div id="content">
    <form action="advice.action"  id="adviceform" method="post">
		<div id="sug_board">
        	<br/>    
        	<center><h1>如果您有宝贵建议请给我们留言!</h1></center>
            <br/>
            <center><textarea name="advice" id="advice" class="sug_text"  ></textarea></center>
            <br/><br/>
            <input type="button" id="sug_submit" class="btn" onclick="checkadvice()" value="提交"/>
            <input type="button" class="btn" value="返回" onclick="jump_cloud_note()"/>
            
            
        </div>
     </form>
    </div>
 </div>  
</body>
</html>

