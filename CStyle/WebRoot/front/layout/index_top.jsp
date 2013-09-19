<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
function checksession(){
	var ck="${usersessioninfo.userId}";
	if(ck!=""){
       return true;
	}else{
		$.messager.show({
			 title : '提示',
			 msg : '你还没有登录！请登录后再试！',
			 showType:'slide',  
             style:{  
               right:'',  
               top:document.body.scrollTop+document.documentElement.scrollTop,  
               bottom:''  
            }  
		});
		return false;
	}
	
}

 function front_top_loginformsub(){
	 $('#index_top_loginbut').val('登录中...')
	 var pass = true; 
	 $('#front_index_loginform').find("input").each(function(){ 
		 if(this.value == '') { 
			 this.focus(); 
			 pass = false; 
			 return false;//跳出each 
		    } 
		 }); 
		if(pass){
			$('#front_index_loginform').submit();
		}else{
			$('#index_top_loginbut').val('登录')
			$.messager.show({
				 title : '提示',
				 msg : '请输入账号名或密码！',
				 showType:'slide',  
                 style:{  
                    right:'',  
                    top:document.body.scrollTop+document.documentElement.scrollTop,  
                    bottom:''  
                 }  
			});

		}
	 }
</script>
<!--  top  -->
    <div id="front_index_top">
    	  <div id="top1">
    	        <c:choose>
				<c:when test="${usersessioninfo.userId!= null}">
				欢迎你：<a href="userAction!front_toMyinformation.action?id=${usersessioninfo.userId}" onclick="return checksession()" ><font class="front_index_topa">${usersessioninfo.loginName}</font></a>&nbsp;您的IP地址是：<font class="front_index_topa">${usersessioninfo.ip}</font>
				</c:when>
				<c:otherwise>
				<form id="front_index_loginform" action="userAction!noSession_userlogin.action"  method="post">  
		                     用户:
		        <input  style="width: 100px" name="name"  />  
		      	  密码:
		        <input type="password" style="width: 80px" name="pwd" />  
		        <input  id="index_top_loginbut" type="button" onclick="front_top_loginformsub();"  value="登录"/>
		        </form> 
		        </c:otherwise>
                </c:choose>
	      </div>
	      <div id="top2">
	            <a  class="easyui-tooltip" href="javascript:void(0)" data-options="  
                    content: function(){  
                        return $('#front_fastpub');  
                    },  
                    onShow: function(){  
                        var t = $(this);  
                         t.tooltip('tip').unbind().bind('mouseenter', function(){  
                             t.tooltip('show');  
                         }).bind('mouseleave', function(){  
                            t.tooltip('hide');  
                        });  
                    }  
                ">发表成果</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	            
	            
	           <a class="easyui-tooltip" href="javascript:void(0)" data-options="  
                    content: function(){  
                        return $('#front_fastnav');  
                    },  
                    onShow: function(){  
                        var t = $(this);  
                         t.tooltip('tip').unbind().bind('mouseenter', function(){  
                             t.tooltip('show');  
                         }).bind('mouseleave', function(){  
                            t.tooltip('hide');  
                        });  
                    }  
                ">快速导航</a>&nbsp;&nbsp;&nbsp;
	           <a href="userAction!front_toregister.action">注册</a>&nbsp;&nbsp;&nbsp;
	           <a href="userAction!noSession_loginout.action">退出系统</a>
	      </div>
    </div>

	 <div style="display:none">  
	        <div id="front_fastnav">  
	            <a href="worksAction!front_getWorks.action" class="easyui-linkbutton"  data-options="iconCls:'front-page',plain:true">成果中心</a> <br>
	            <a target="_blank" href="fileAction!noSession_pricturesList.action" class="easyui-linkbutton"  data-options="iconCls:'front-pic',plain:true">图片墙</a> <br>
	            <a href="worksAction!front_getWorks.action?typeid=402881e63e44e178013e44e17c520006" class="easyui-linkbutton"  data-options="iconCls:'front-film',plain:true">视频专区</a> <br> 
	            <a href="worksAction!front_getRankings.action" class="easyui-linkbutton"  data-options="iconCls:'front-rankings',plain:true">榜单排名</a> <br> 
	            <a href="worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}" onclick="return checksession()"  class="easyui-linkbutton"  data-options="iconCls:'front-myworks',plain:true">我的成果</a> <br> 
	            <a href="userAction!front_toMyinformation.action?id=${usersessioninfo.userId}" onclick="return checksession()" class="easyui-linkbutton"  data-options="iconCls:'front-user',plain:true">个人中心</a><br>
	        </div>  
	 </div>
 <div style="display:none">  
	        <div id="front_fastpub">  
	            <a href="${pageContext.request.contextPath}/front/myindex.jsp?msg=addworks" onclick="return checksession()" class="easyui-linkbutton"  data-options="iconCls:'front-add',plain:true">发表学术成果</a> <br>
	            <a href="${pageContext.request.contextPath}/front/myindex.jsp?msg=addworks&type=picture"  onclick="return checksession()" class="easyui-linkbutton"  data-options="iconCls:'front-addpic',plain:true">上传我的图片</a> <br>
	            <a href="${pageContext.request.contextPath}/front/myindex.jsp?msg=addworks&type=video" onclick="return checksession()" class="easyui-linkbutton"  data-options="iconCls:'front-addfilm',plain:true">上传我的视频</a> <br> 
	        </div>  
</div>
