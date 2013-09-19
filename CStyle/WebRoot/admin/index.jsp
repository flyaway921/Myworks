<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<c:if test="${sessioninfo.userId== null}"><c:redirect url="login.jsp"></c:redirect></c:if>
<head>
<base href="<%=basePath%>">
<title>SSHE DEMO</title>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/default/easyui.css" type="text/css"></link>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/icon.css" type="text/css"></link>
<script type="text/javascript" src="javascript/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/CStyleUtil.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:62px;overflow:hidden;background-image:url('images/bg.jpg');">
		<jsp:include page="layout/north.jsp"></jsp:include>
	</div>
	<div data-options="region:'south',border:false" style="height:28px;overflow: hidden;"  >
		<jsp:include page="layout/south.jsp"></jsp:include>
	</div>
	<div data-options="region:'west'" style="width:200px;overflow:hidden;">
		<jsp:include page="layout/west.jsp"></jsp:include>
	</div>
	<div data-options="region:'east'" style="width:200px;overflow:hidden;">
	    <jsp:include page="layout/east.jsp"></jsp:include>
	</div>
	<div data-options="region:'center'" style="overflow: hidden;">
	    <jsp:include page="layout/center.jsp"></jsp:include>
	</div>
</body>
</html>
