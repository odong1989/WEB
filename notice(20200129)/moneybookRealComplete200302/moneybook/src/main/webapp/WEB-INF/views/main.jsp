<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<!-- <link rel="stylesheet" type="text/css" href="css/moneybook.css" /> -->
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css" />" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
</head>
<body>

<div id="wrap">
	<h1>[ 일일 가계부 ]</h1>
	<c:if test="${sessionScope.userid != null }">
		<h2>${sessionScope.userid} 님 환영합니다!</h2>
	</c:if>
	
	<div class="menu">
		<table>
			<tr>
				<td>
					<a href="<c:url value="signupForm" />">회원가입</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="<c:url value="loginForm" />">로그인</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="<c:url value="moneybookList" />">내 가계부</a>
				</td>
			</tr>
			<tr>
				<td>
					<a href="<c:url value="logout" />">로그아웃</a>
				</td>
			</tr>
		</table>
	</div>
</div>

</body>
</html>







