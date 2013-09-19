<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String username=(String)request.getSession().getAttribute("username");
if(username==null){
  	response.sendRedirect("cloud_note.jsp");		
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath %>"/>
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
        <div id="content" class="content_background">
			
            <div class="content_left">
            	 <div class="add_note" ><a href="note.jsp">
                     <span class="add_note_pic">
                        
                     </span>
                     <span class="add_note_word">
                        <span>&nbsp;新建笔记</span>
                     </span></a>
                 </div>
                 <div class="clear"></div>
                 <div class="view_note"><a href="aboutnote!listnote?page=1">
                 	<span class="view_note_pic">
                    </span>
                    <span class="view_note_word">
                    	<span>&nbsp;浏览笔记</span>
                    </span></a>
                 </div>
         	</div>
            
            <div class="content_right"> 
            	<ul>
                	<li>
                    	
                    	<img src="images/head.jpg" />
                    </li>
                    <li><br/></li>
                    <li>
                    	用户名:<s:property value="all[0].username"/>
                    </li>
                    <li><br/></li>
                    <li>
                    	邮箱：<s:property value="all[0].mail"/>
                    </li>
                </ul>
            </div>
            <div class="clear"></div>
            
            <div class="describe">
           笔记使用说明:<br/>&nbsp;点击新建笔记来快速新建一个笔记<br/>&nbsp;点击浏览笔记可以查看已经建立的笔记
            </div>
        </div>
        
        <div id="footer">
       
        </div>
        
    </div>
    
</body>

</html>

