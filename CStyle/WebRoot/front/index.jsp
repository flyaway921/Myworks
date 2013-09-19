<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
if(session.getAttribute("T_flag")==null){ 
 response.sendRedirect(request.getContextPath()+"/worksAction!front_getIndexAction.action"); 
} 
%>
<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">
<title>大学生风姿网</title>
<jsp:include page="layout/index_msg.jsp"></jsp:include>
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/default/easyui.css" type="text/css" />
<link rel="stylesheet" href="javascript/jquery-easyui-1.3.3/themes/icon.css" type="text/css" />
<link  rel="stylesheet" href="css/index.css" type="text/css"  />
<link  rel="stylesheet" href="css/top.css" type="text/css"  />
<link  rel="stylesheet" href="css/front_east.css" type="text/css"  />
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="javascript/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="javascript/xheditor-1.1.14/xheditor-1.1.14-zh-cn.min.js" charset="utf-8"></script>
<script type="text/javascript" src="javascript/CStyleUtil.js"></script>
<script src="javascript/front/jquery.carouFredSel-6.0.4-packed.js" type="text/javascript"></script>
<script src="javascript/front/jquery.smallslider.js" type="text/javascript"></script>
<script language="javascript">
  ieGo();
  function ieGo(){ 
    var ie = !-[1,];  
    if(ie == true) {
      var ua = navigator.userAgent.toLowerCase();
      var version = parseInt(ua.match(/msie ([\d.]+)/)[1]);
      if(version <= 7) {
	   location.href='<%=request.getContextPath()%>/error/ierror.htm'; 
      }
    }
  }
 </script>
</head>
<body style="background: url('images/front/front_index-bg.png') top center;">

<jsp:include page="layout/index_top.jsp" flush="true"></jsp:include>

<div style="position:absolute;left:270px;top:60px;" ><a href="front/index.jsp"><img src="images/logo.png" /></a></div>
<div class="easyui-layout" style="width:930px; margin-top:180px;height:1365px; overflow:hidden;margin-left:auto; margin-right:auto; ">

    <!-- north -->
	<div data-options="region:'north',border:false"  style="overflow: hidden;height:340px;">
	    <jsp:include page="layout/index_north.jsp" flush="true"></jsp:include>
	</div>
	
	 <!-- main -->
	<div data-options="region:'center',border:false" class="easyui-layout" style="overflow: hidden;">
	     <!-- center -->
	    <div data-options="region:'center',border:false" style="overflow: hidden; ">
	         <jsp:include page="layout/index_center.jsp" flush="true"></jsp:include>
	          
	    </div>
	    
	    <!-- east -->
	    <div id="front_index_east" data-options="region:'east',border:false" style="overflow:hidden;width:250px;">
	          <jsp:include page="layout/index_east.jsp" flush="true"></jsp:include>
	    </div>
	
		<!-- south -->
	   <div data-options="region:'south',border:false" style="overflow: hidden;height:300px;">
				     <div  class="easyui-panel" style="height:200px;padding: 5px" title="照片墙"  data-options="
				                tools:[{  
				                    iconCls:'front-more',  
				                    handler:function(){  
				                         window.open('${pageContext.request.contextPath}/fileAction!noSession_pricturesList.action','_blank'); 
				                    }  
				                }]  
				            ">
					           <jsp:include page="layout/index_south.jsp" flush="true"></jsp:include>
			         </div>
			         <div  class="easyui-panel" data-options="fit:true,border:false" style="background-color:#A3D0C9" >
			              <center><address style="font-size:22px;margin-top: 20px">CopyRight@CStyle<br>
			              <a style="font-size: 13px;"  target="_blank" href="admin/index.jsp">登录后台</a>&nbsp;&nbsp;&nbsp;<img align="middle" src="images/front/pic.gif"></address></center> 
			         </div>
	   </div>  
   
     </div>

</div>

</body>
<script type="text/javascript">
$(function(){
     $('#front_index_flashbox').smallslider({
			 onImageStop:true,
     });
		//首先将#back-to-top隐藏
		$("#back-to-top").hide();
		//当滚动条的位置处于距顶部100像素以下时，跳转链接出现，否则消失
		$(function () {
			$(window).scroll(function(){
			if ($(window).scrollTop()>100){
			$("#back-to-top").fadeIn(1500);
			}
			else
			 {
			   $("#back-to-top").fadeOut(1500);
			  }
			});
			//当点击跳转链接后，回到页面顶部位置
			$("#back-to-top").click(function(){
			 $('body,html').animate({scrollTop:0},300);
			  return false;
			  });
			});
	});
 </script>  
</html>
