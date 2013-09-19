<%@ page contentType="text/html; charset=UTF-8;" pageEncoding="utf-8" language="java"  import="java.io.*" import="javax.swing.*" 
 import="java.util.*"
 errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>网络测量</title>
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
			<form action="measure.jsp" method="get" target="resultFrame" onsubmit="return validate()">
				
				<table  width="500" border="1"  >
					<tr>
						<td>测量项目:</td>
						<td>						
							<select name="item">
								<option selected="selected" value="ping">时延测量</option>
								<option value="tracert">拓扑测量</option>
							</select>
						</td>
					</tr>
					<tr>
						<td>目的地址（ipv4）：</td>
						<td><input type="text" name="dest" id="dest" value="" /></td>
					</tr>
					<tr><td>Package size(Byte):</td><td><input type="text" name="size" size="10" id="size" value="32" /></td></tr>
					<tr><td>Max-hops(tracert):</td><td><input type="text" name="hops"  id="hops" value="10"  size="10" /></td></tr>
					<tr><td colspan="2"><center><input type="submit"  id="start" value="开始" style="width:100px; margin:auto auto;"/></center></td></tr>
				</table>
			</form>
			<br/><br/><br/><br/>
			<center>
			<a href="download.jsp" target="resultFrame">点击下载测试结果</a>
			<a href="display.jsp" target="_self">在线查询历史测试结果</a>
			<br/>
			<br/>
			<iframe id="result"  width="700" height="400"  name="resultFrame" src=""></iframe><br/>
		<i>Designed By <a style="text-decoration: none" href="mailto:flyaway_921@hotmail.com">曹伟</a></i>
		</center>
		
	</div>
</div>

<script>

	function  validate(){
		if(document.getElementById("dest").value==""){
			alert("目的地址不能为空");
			document.getElementById("result").scr="measure.jsp";
			return false;
		}else{
			
			return true;
		}
	}
</script>


</body>
</html>
