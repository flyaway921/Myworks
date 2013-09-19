<%@ page language="java" import="java.util.*,java.text.SimpleDateFormat;" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String username=(String)request.getSession().getAttribute("username");
if(username==null){
  	response.sendRedirect("cloud_note.jsp");		
}
String time = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
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
 	 <div  id="content" >
    <center>
      <form id="form1" name="form1"  method="post" action="aboutnote!updatenote?page=1&noteid=<s:property value="al[0].noteid"/>" onsubmit="return validate_note();" style=" background:url(images/2012052412255329-900.jpg)">
        <table width="692" height="529" border="0">
          <tr>
            <td height="34" valign="bottom">
             <center>
               <input name="title" class="note_title" type="text" id="textfield"  size="30" value="<s:property value="al[0].title"/>" placeholder="请输入标题" />
             </center>
             <label class="date">&nbsp;&nbsp;&nbsp;<s:property value="al[0].time"/></label>
            </td>
            </tr>
          <tr>
            <td height="209">
              <center><textarea name="content" id="textarea2" class="note_text" ><s:property value="al[0].content"/></textarea></center>
            </td>
          </tr>
          <tr>
          	<td align="center"><input class="btn" type="submit"  value="保存" /><input type="button" class="btn" value="返回"   onclick="location.href='aboutnote!listuserinfo'"/></td>
          </tr>
        </table>
      </form>
    </center>
  </div>
        
        
      <div id="footer">
        </div>
        
    </div>
</body>
</html>
