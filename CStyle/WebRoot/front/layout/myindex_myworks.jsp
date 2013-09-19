<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myindex_myworks" style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;max-height:672px;padding: 12px">
  <div><h2>我的成果</h2></div><span class="cmyworks"><font size="3px">+</font><a href="${pageContext.request.contextPath}/front/myindex.jsp?msg=addworks" onclick="return checksession()" >发表我的成果</a></span><hr>
   
    <table class="myindex_workslist" width="100%" border="0">
      <tr>
        <td width="16%">
        <select  id="myindex_myworks_type" style="width:100px;" >
         <option value=''>全部成果</option>
        <option value='402881e63e44e178013e44e17c400001'>学术论文</option>
        <option value='402881e63e44e178013e44e17c520002'>科研报告</option>
        <option value='402881e63e44e178013e44e17c520003'>经验教程</option>
        <option value='402881e63e44e178013e44e17c520004'>摄影/图片/海报</option>
        <option value='402881e63e44e178013e44e17c520005'>软/硬件作品</option>
        <option value='402881e63e44e178013e44e17c520006'>教程视频</option>
        <option value='402881e63e44e178013e44e17c520007'>原创视频/动画</option>
        <option value='402881e63e44e178013e44e17c520008'>其他视频</option>
        </select>   
         </td>
        <td colspan="4"  align="right">
        <form  action="worksAction!front_toMyworks.action"  method="post">
        <input type="text"  name="title" /><input type="hidden"  name="userid" value="${usersessioninfo.userId}"/>
        <input type="submit"  value="搜索" />
        </form></td>
      </tr>
       <tr>
        <td width="48%"><span class="style1">标题</span></td>
        <td width="17%"><span class="style1">分类</span></td>
        <td width="12%"><span class="style1">发表时间</span></td>
        <td width="8%"><span class="style1">浏览</span></td>
        <td width="15%"><span class="style1">管理</span></td>
      </tr>
      
      <c:forEach items="${wlist}" var="list"  >
      <tr>
        <td><a href="worksAction!front_Preview.action?id=${list.id}" title="${list.title}"> <c:choose ><c:when test="${fn:length(list.title) lt 20}">${list.title}</c:when><c:otherwise>${fn:substring(list.title,0,20)}...</c:otherwise></c:choose></a></td>
        <td>${list.type.type}</td>
        <td>${fn:substring(list.ctime,0,10)}</td>
        <td>${list.viewnums}</td>
        <td><a href="worksAction!front_toupdateworks.action?id=${list.id}""><img align="middle" title="编辑" src="${pageContext.request.contextPath}/images/icons/building_edit.png"/></a>&nbsp;
            <a href="worksAction!front_deleteworks.action?id=${list.id}&userid=${list.user.id}"  onclick="return confirm('确认删除这项?');"><img align="middle" title="删除" src="${pageContext.request.contextPath}/images/icons/cancel.png"/></a></td>
      </tr>
      </c:forEach>
      
      <tr>
      <td   colspan="5" align="right"> 
        <input id="myworks_prepage"   type="button" value="上一页" />&nbsp;&nbsp;&nbsp;<input type="button" id="myworks_nextpage" value="下一页" />&nbsp;&nbsp;&nbsp;&nbsp;
                  跳转至<input id="myworks_jumppageNum"  type="text" class="textstyle1" />页&nbsp;<input  id="myworks_jumppage" type="button" value="执行" />&nbsp;&nbsp;&nbsp;&nbsp;页数：${page}/${pageCount}</td>
      </tr>
    </table>
						  
</div>
<script type="text/javascript" >
if(${page}<=1){
	$("#myworks_prepage").attr({"disabled":"disabled"});
 }
if(${page}>=${pageCount}){
	$("#myworks_nextpage").attr({"disabled":"disabled"});
 }
$("#myworks_prepage").click(function(){
	window.open("worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}&page=${page-1}&typeid=${typeid}&title=${title}","_self");
}); 
$("#myworks_nextpage").click(function(){
	window.open("worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}&page=${page+1}&typeid=${typeid}&title=${title}","_self");
}); 
$("#myworks_jumppage").click(function(){
	var jumpnum=$("#myworks_jumppageNum").val();
	jumpnum=parseInt(jumpnum);
	if(jumpnum<=${pageCount}&&jumpnum>=1){
	 window.open("worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}&page="+jumpnum,"_self");
	}else{
      alert("输入不合理！");
	}
}); 
$("#myindex_myworks_type").change(function(){
	var type=this.value;
	window.open("worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}&typeid="+type,"_self");
}); 


$("#myindex_myworks_type option[value='${typeid}']").attr("selected","selected");

</script>