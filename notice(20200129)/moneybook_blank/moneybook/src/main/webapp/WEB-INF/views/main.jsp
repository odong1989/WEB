<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
</head>
<body>
	<h1>일일 가계부</h1>
	sessionScope.loginId : ${ sessionScope.loginId }<br>
<c:choose>
		<c:when test="${sessionScope.loginId == null}">
			<a href="signupForm">회원가입</a>		
			<a href="loginForm">로그인</a>					
		</c:when>
		
		<c:otherwise>
			<h2>${sessionScope.loginId} 님 환영합니다! </h2>
			<a href="moneybookList">내 가계부</a>		
			<a href="logout">로그아웃</a>							
		</c:otherwise>

</c:choose>

</body>
</html>
