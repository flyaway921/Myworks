<%@ page language="java"  import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("T_flag")==null){ 
	 response.sendRedirect(request.getContextPath()+"/worksAction!front_getIndexAction.action"); 
	} 
%>
<c:if test="${usersessioninfo.userId==null and param.msg!='toregister' and actionMessages[0] !='fpreview' and actionMessages[0] !='rankings' and actionMessages[0] !='works'}"><c:redirect url="/front/index.jsp?msg=nologin"></c:redirect></c:if>
<!DOCTYPE html>
<html>
    <head>
        <base href="<%=basePath%>">
        <title>大学生风姿网</title>
        <jsp:include page="layout/myindex_msg.jsp"></jsp:include>
        <link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/default/easyui.css" type="text/css" />
		<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/icon.css" type="text/css" />
		<link rel="stylesheet" href="css/myindex.css" type="text/css" />
		<link rel="stylesheet" href="css/top.css" type="text/css" />
		<link  rel="stylesheet" href="css/front_east.css" type="text/css" />
		<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery-1.8.0.min.js"></script>
		<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
		<script type="text/javascript" src="javascript/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js" ></script>
	    <script type="text/javascript" src="javascript/CStyleUtil.js"></script>
    </head>
    <body>
        <jsp:include page="layout/index_top.jsp"></jsp:include>
        
        <div class="easyui-layout" style="width:930px; margin-top:40px;height:950px; overflow:hidden;margin-left:auto; margin-right:auto; ">
           <div id="front_myindex_north" data-options="region:'north',border:true"  style="overflow:hidden;height:80px;background-color:#E9650E">
	                    <c:choose>
			            <c:when test="${param.msg eq'toregister'}">
			            <div class="topfont">【用户注册】</div>
			            </c:when>
			            <c:when test="${param.msg eq 'addworks'}">
			            <div class="topfont">【发表成果】</div>
			            </c:when>
			            <c:when test="${actionMessages[0] eq 'toupdateworks'}">
			            <div class="topfont">【更新成果】</div>
			            </c:when>
			            <c:when test="${actionMessages[0] eq 'rankings'}">
			            <div class="topfont">【榜单排名】</div>
			            </c:when>
			             <c:when test="${actionMessages[0] eq 'works'}">
			            <div class="topfont">【成果列表】</div>
			            </c:when>
			            <c:when test="${actionMessages[0] eq 'fpreview'}">
			            <div class="topfont">【成果展示】</div>
			            </c:when>
			            <c:when test="${actionMessages[0] eq 'tomyworks'}">
			            <div class="topfont">【我的成果】</div>
			            </c:when>
			            <c:otherwise>
			            <div class="topfont">【${usersessioninfo.loginName}】的个人中心</div>
			            </c:otherwise>
			            </c:choose>
			            <div class="topnavindex"><a href="worksAction!front_toindex.action">返回主页</a></div>
	       </div>
	       
	       <div data-options="region:'west',border:false"  style="overflow: hidden;width:250px;margin-top: 10px;background-color: #FEF0E7;">
	             <jsp:include page="layout/index_east.jsp" flush="true"></jsp:include>
	       </div>
	       
	       
	       <div id="myindex_center" data-options="region:'center',border:false"  style="overflow:hidden;margin-top: 10px;padding-left:10px;background-color: #FEF0E7;">
	            <c:choose>
	            <c:when test="${param.msg eq 'toregister'}"><jsp:include page="layout/myindex_register.jsp" flush="true"></jsp:include></c:when>
	            <c:when test="${param.msg eq  'addworks'}"> <jsp:include page="layout/myindex_addworks.jsp" flush="true" ></jsp:include></c:when>
	            <c:when test="${actionMessages[0] eq 'rankings'}"><jsp:include page="layout/myindex_rankings.jsp" flush="true" ></jsp:include></c:when>
	            <c:when test="${actionMessages[0] eq 'tomyworks'}"><jsp:include page="layout/myindex_myworks.jsp" flush="true"></jsp:include></c:when>
	            <c:when test="${actionMessages[0] eq 'fpreview'}"><jsp:include page="layout/myindex_preview.jsp" flush="true"></jsp:include></c:when>
	            <c:when test="${actionMessages[0] eq 'toupdateworks'}"><jsp:include page="layout/myindex_updateworks.jsp" flush="true" ></jsp:include></c:when>
	            <c:when test="${actionMessages[0] eq 'works'}"><jsp:include page="layout/myindex_allworks.jsp" flush="true" ></jsp:include></c:when>
	            <c:otherwise><jsp:include page="layout/myindex_myinfo.jsp" flush="true"></jsp:include></c:otherwise>
	            </c:choose>
	       </div>
	       
        </div>
        <div style="overflow: hidden;height:40px;background-color: #FEF0E7;">
	          <center><address style="font-size:22px;">CopyRight@CStyle</address></center> 
	    </div>
    </body>
<c:if test="${actionMessages[0] eq 'works'}">
<script type="text/javascript">
$("#front_myindex_north").css({background: "#0089F7" });
</script>
</c:if>
</html>

