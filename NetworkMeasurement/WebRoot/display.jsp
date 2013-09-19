<%@ page contentType="text/html; charset=UTF-8;" pageEncoding="utf-8"
	language="java"
	import="java.sql.*,java.io.*,java.util.*,java.net.InetAddress,java.net.UnknownHostException,jxl.Workbook,jxl.write.Label,jxl.write.WritableSheet,jxl.write.WritableWorkbook"%>
<%@page import="jxl.Cell"%>
<%@page import="jxl.LabelCell"%>
<%@page import="jxl.write.WritableFont"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title></title>
<style>
#content{ width:900px; background-color:#999933;  margin:auto auto; padding:15px;}
#content form{ height: 100px;}
.title{ margin-top:50px;}
table{ margin:auto auto;}
table td{}
</style>


	</head>

<body>
<div id="container">
	<div id="content">
		
			<center><h1 class="title">网络测量工具</h1></center>
			<form action="search.jsp" method="get" target="resultFrame">
				
				<table  width="500" border="1"  >
					<tr>
						<td>查询项目:</td>
						<td>						
							<select name="item">
								<option selected="selected" value="ping">时延测量</option>
								<option value="tracert">拓扑测量</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>目的地址（ipv4）：</td>
						<td><input type="text" name="dest" value="" /></td>
					</tr>
					<tr><td colspan="2"><center><input type="submit"  id="start" value="查询" style="width:100px; margin:auto auto;"/></center></td></tr>
				</table>
			</form>
			<center><a href="download.jsp" target="resultFrame">点击下载测试结果</a>&nbsp;&nbsp;&nbsp;<a href="index.jsp">返回测量工具页</a></center>
			<br/><br/><br/><br/>
			<center>
				<br/>
				<br/>
				<iframe id="result"  width="700" height="400"  name="resultFrame" src=""></iframe><br/>
				<i>Designed By <a style="text-decoration: none" href="mailto:flyaway_921@hotmail.com">曹伟</a></i>
			</center>
	</div>
</div>
<script type="text/javascript">
document.getElementById("start").onclick=function (){
	document.getElementById("result").src="search.jsp";
}
</script>
</body>
</html>
