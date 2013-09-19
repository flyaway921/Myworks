<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myindex_allworks" style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;max-height:672px;padding: 12px">
  <div><h2>成果中心</h2></div><hr>
    <table class="myindex_workslist" width="100%" border="0">
      <tr>
        <td width="16%">
        <select  id="myindex_allworks_type" style="width:100px;" >
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
        <form  action="worksAction!front_getWorks.action"  method="post">
        <input type="text"  name="title" />
        <input type="submit"  value="搜索" />
        </form></td>
      </tr>
       <tr>
        <td width="48%"><span class="style1">标题</span></td>
        <td width="17%"><span class="style1">分类</span></td>
        <td width="12%"><span class="style1">发表时间</span></td>
        <td width="8%"><span class="style1">浏览</span></td>
        <td width="15%"><span class="style1">作者</span></td>
      </tr>
      
      <c:forEach items="${wlist}" var="list"  >
      <tr>
        <td><a href="worksAction!front_Preview.action?id=${list.id}" title="${list.title}"> <c:choose ><c:when test="${fn:length(list.title) lt 20}">${list.title}</c:when><c:otherwise>${fn:substring(list.title,0,20)}...</c:otherwise></c:choose></a></td>
        <td>${list.type.type}</td>
        <td>${fn:substring(list.ctime,0,10)}</td>
        <td>${list.viewnums}</td>
        <td>${list.user.name}</td>
      </tr>
      </c:forEach>
      
      <tr>
      <td   colspan="5" align="right"> 
        <input id="allworks_prepage"   type="button" value="上一页" />&nbsp;&nbsp;&nbsp;<input type="button" id="allworks_nextpage" value="下一页" />&nbsp;&nbsp;&nbsp;&nbsp;
                  跳转至<input id="allworks_jumppageNum"  type="text" class="textstyle1" />页&nbsp;<input  id="allworks_jumppage" type="button" value="执行" />&nbsp;&nbsp;&nbsp;&nbsp;页数：${page}/${pageCount}</td>
      </tr>
    </table>
						  
</div>
<script type="text/javascript" >
if(${page}<=1){
	$("#allworks_prepage").attr({"disabled":"disabled"});
 }
if(${page}>=${pageCount}){
	$("#allworks_nextpage").attr({"disabled":"disabled"});
 }
$("#allworks_prepage").click(function(){
	window.open("worksAction!front_getWorks.action?page=${page-1}&typeid=${typeid}&title=${title}","_self");
}); 
$("#allworks_nextpage").click(function(){
	window.open("worksAction!front_getWorks.action?page=${page+1}&typeid=${typeid}&title=${title}","_self");
}); 
$("#allworks_jumppage").click(function(){
	var jumpnum=$("#allworks_jumppageNum").val();
	jumpnum=parseInt(jumpnum);
	if(jumpnum<=${pageCount}&&jumpnum>=1){
	 window.open("worksAction!front_getWorks.action?page="+jumpnum,"_self");
	}else{
      alert("输入不合理！");
	}
}); 
$("#myindex_allworks_type").change(function(){
	var type=this.value;
	window.open("worksAction!front_getWorks.action?typeid="+type,"_self");
}); 


$("#myindex_allworks_type option[value='${typeid}']").attr("selected","selected");


</script>