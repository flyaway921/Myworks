 <%@ page language="java" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	<div  id="front_index_tabs" class="easyui-tabs"  style="height:340px;"  data-options="  
		                tools:[{  
		                    iconCls:'front-more',  
		                    handler:function(){  
		                        window.open('${pageContext.request.contextPath}/worksAction!front_getWorks.action','_blank'); 
		                    }  
		                }]  ">  
				        <div title="最新作品"   id="index_tops_newworks" data-options="iconCls:'front-new'" style="width:250px;background:#fafafa;">  
				            <ul>
				                <c:forEach items="${new12works}" var="list">
				                <li><span ></span><a  title="${list.title}" target="_blank" href="worksAction!front_Preview.action?id=${list.id}"><c:choose><c:when test="${fn:length(list.title) gt 12}">${fn:substring(list.title,0,12)}...</c:when><c:otherwise>${list.title}</c:otherwise></c:choose></a><i>${fn:substring(list.ctime,5,11)}</i></li>
				            	</c:forEach> 
				            </ul>
				        </div>  
	</div>
	          
	          
	<div style="height:10px;"></div>
	<div  class="easyui-panel"  id="top10"  title="总榜单【top10】"  style="padding:4px;height:350px;background:#fafafa;"  data-options="  
		                tools:[{  
		                    iconCls:'front-more',  
		                    handler:function(){  
		                        window.open('${pageContext.request.contextPath}/worksAction!front_getRankings.action','_blank');  
		                    }  
		                }]  
		            ">  
				                <ul id="front_index_topul" >
				                        <c:forEach items="${top10works}" var="list" varStatus="status">
                                        <li><i class="i${status.count}" >${status.count}</i>&nbsp;<a target="_blank" href="worksAction!front_Preview.action?id=${list.id}"  title="${list.title}" ><c:choose><c:when test="${fn:length(list.title) gt 13}">${fn:substring(list.title,0,13)}...</c:when><c:otherwise>${list.title}</c:otherwise></c:choose></a>
                                        <font size="-1" color="#FF6600" ><span style=" float:right;">${list.viewnums}</span></font>
                                        </li><hr>
                                        </c:forEach>
                                 </ul>
	</div>
