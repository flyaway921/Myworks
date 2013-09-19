<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${param.msg eq 'cgpwdfail'}">
<script type="text/javascript">
alert("修改密码失败！原密码错误！");
</script>
</c:if>

<c:if test="${param.msg eq 'cgpwdok'}">
<script type="text/javascript">
alert("修改密码成功！");
</script>
</c:if>




