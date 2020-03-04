<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>
<script>
</script>
</head>
<body>
<h1>
memberLoginForm
</h1>
<!-- 로그인 에러시 에러 메시지 출력--->
<c:if test="${errMsg != null }">
${errMsg}
</c:if>

<!-- 로그인폼--->
<form action="memberLoginExe" method="post">
ID : <input type="text" name="member_id" >
PW : <input type="password" name="member_pw">
<input type="checkbox" name="remember" value="1">아이디 기억하기<br/>
<input type="submit" value="로그인 하기"><br/>
</form>

</body>
</html>