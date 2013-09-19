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
      	 <div class="clear"></div>
        </div>
        <div id="content">
        <a href="note.jsp" class="content_top" ><span class="new_btn" >新建笔记</span></a>
     
       		<ul class="list"> 
       		 <s:iterator value="al" id="note">
            <li class="note_block"><a class="note_remove" href="aboutnote!deletenote?page=1&noteid=<s:property value="#note.noteid"/>" onclick="return removed()" ></a>
            <a href="aboutnote!thenote?noteid=<s:property value="#note.noteid"/>" title="点击编辑【<s:property value="#note.title"/>】"><img src="images/120-120.png" class="note_block_pic"/></a>
            <s:if test="(#note.title.length()>11)"><a href="aboutnote!thenote?noteid=<s:property value="#note.noteid"/>" class="note_block_title" title="点击编辑【<s:property value="#note.title"/>】" ><s:property value="#note.title.substring(0,11)+'..'"/></a></s:if>
            <s:else ><a href="aboutnote!thenote?noteid=<s:property value="#note.noteid"/>" class="note_block_title" title="点击编辑【<s:property value="#note.title"/>】"><s:property value="#note.title"/></a></s:else></li>
             </s:iterator>     
			</ul>
			
		 
            <div class="clear"></div>
            <div class="page">
                <table width="200" >
                  <tr>  
           
                    <td><s:if test="page==1"> <input type="button" disabled="disabled" value="首页"/></s:if>
                        <s:else>  <input type="button" onclick="location.href='aboutnote!listnote?page=<s:property value="1"/>'" value="首页"/></s:else>
                     </td>
                     <td><s:if test="page==1"> <input type="button" disabled="disabled" value="上一页"/></s:if>
                        <s:else>  <input type="button"  onclick="location.href='aboutnote!listnote?page=<s:property value="page-1"/>'" value="上一页"/></s:else>
                     </td>
                     
                     <td>
                       <s:if test="page==pagenum||pagenum==0"> <input type="button" disabled="disabled" value="下一页"/></s:if>
                        <s:else>  <input type="button" onclick="location.href='aboutnote!listnote?page=<s:property value="page+1"/>'" value="下一页"/></s:else>
                    </td>
                   
                    <td>
                       <s:if test="page==pagenum||pagenum==0"> <input type="button" disabled="disabled" value="末页"/></s:if>
                        <s:else>  <input type="button" onclick="location.href='aboutnote!listnote?page=<s:property value="pagenum"/>'" value="末页"/></s:else>
                    </td>
                    <td>跳&nbsp;至:</td>
                    <td><input type="text" id="forjump" value="<s:property value="page"/>" size="1" style="text-align:right;"/></td>
                    <td><label>/<s:property value="pagenum"/></label></td>
                     <td><input type="button" onclick="jump(<s:property value="pagenum"/>);" value="GO"/></td>
                  </tr>
                </table>
            </div>

      
        </div>
    </div>
</body>
</html>