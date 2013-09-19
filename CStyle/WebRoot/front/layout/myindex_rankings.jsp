<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="myindex_rangkings" style="width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;max-height:672px;padding: 12px">
  <div><h2>榜单排名</h2></div><hr>
   
    <table class="myindex_workslist" width="100%" border="0">
      <tr>
        <td colspan="6"  align="right">
        <select  id="myindex_rangkings_type" style="width:100px;" >
         <option value=''>总排行榜</option>
        <option value='402881e63e44e178013e44e17c400001'>学术论文排行榜</option>
        <option value='402881e63e44e178013e44e17c520002'>科研报告排行榜</option>
        <option value='402881e63e44e178013e44e17c520003'>经验教程排行榜</option>
        <option value='402881e63e44e178013e44e17c520004'>摄影/图片/海报排行榜</option>
        <option value='402881e63e44e178013e44e17c520005'>软/硬件作品排行榜</option>
        <option value='402881e63e44e178013e44e17c520006'>教程视频排行榜</option>
        <option value='402881e63e44e178013e44e17c520007'>原创视频/动画排行榜</option>
        <option value='402881e63e44e178013e44e17c520008'>其他视频排行榜</option>
        </select>   
        </td>
      </tr>
       <tr>
        <td width="7%"  ><span class="style1">排名</span></td>
        <td width="48%"><span class="style1">标题</span></td>
        <td width="15%"><span class="style1">分类</span></td>
        <td width="10%"><span class="style1">发表时间</span></td>
        <td align="center" width="13%"><span class="style1">浏览</span></td>
        <td width="17%"><span class="style1">作者</span></td>
      </tr>
      
      <c:forEach items="${wlist}" var="list" varStatus="status" >
      <tr>
        <td><i class="i${status.count}">${status.count}</i></td>
        <td><a href="worksAction!front_Preview.action?id=${list.id}" title="${list.title}"> <c:choose ><c:when test="${fn:length(list.title) lt 20}">${list.title}</c:when><c:otherwise>${fn:substring(list.title,0,20)}...</c:otherwise></c:choose></a></td>
        <td>${list.type.type}</td>
        <td>${fn:substring(list.ctime,0,10)}</td>
        <td  align="center">${list.viewnums}</td>
        <td>${list.user.name}</td>
      </tr>
      </c:forEach>
      
      <tr>
      <td   colspan="6" align="right"> </td>
      </tr>
    </table>
						  
</div>
<script type="text/javascript" >
$("#myindex_rangkings_type").change(function(){
	var type=this.value;
	window.open("worksAction!front_getRankings.action?typeid="+type,"_self");
}); 
$("#myindex_rangkings_type option[value='${typeid}']").attr("selected","selected");
</script>