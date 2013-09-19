<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<c:if test="${param.msg eq 'loginfail'}">
<script type="text/javascript">
alert("登录失败！请输入正确的账号或密码！");
</script>
</c:if>
<c:if test="${param.msg eq 'nologin'}">
<script type="text/javascript">
alert("你还没有登录！请登录后再试！");
</script>
</c:if>
<c:if test="${param.msg eq 'registerok'}">
<script type="text/javascript">
alert("恭喜你！注册成功，现在就开始登陆吧！");
</script>
</c:if>




