<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<div id="myindex_preview" style="overflow:auto;width:auto;border:2px solid #95B8E7;background-color:#FFFFFF;max-height:820px;padding: 12px">
  <div class="backmyworks">
  <c:choose> 
  <c:when test="${usersessioninfo.userId==null}"><a href="javascript:history.go(-1);">返回</a></c:when>
  <c:otherwise><a href="worksAction!front_toMyworks.action?userid=${usersessioninfo.userId}">返回我的成果</a></c:otherwise>
  </c:choose></div><hr>
<div align="center" style="color: red;font-size: 19px"><strong>${model.title}</strong></div>
<br>
<div  style="color:#A1A3AA;font-size: 12px"><strong>作者：${model.username}<br> 时间：${fn:substring(model.ctime,0,19)}</strong></div>
<br>
<div >${model.content}</div>
</div>

