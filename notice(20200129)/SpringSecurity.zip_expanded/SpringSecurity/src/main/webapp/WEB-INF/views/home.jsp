<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<html>
<head>
	<script src="<c:url value="/resources/js/jquery-3.1.1.js" />"></script>
	<title>Home</title>
	<script type="text/javascript">
		$(function() {
			$('#logout').off("click").on("click",function() {
			    $('#logoutForm').submit();
			    return false;
			});
		});
	</script>
</head>
<body>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="details" var="check"/>
</sec:authorize>
<h1>
	MAIN 
</h1>

<ul>
	<c:choose>
		<c:when test="${empty check }">
			<li>
				<a href="user/loginForm">로그인 폼</a>
			</li>
		</c:when>
		<c:otherwise>
			<li><a id="logout" style="cursor: pointer;">로그아웃</a></li>
			<li>로그인 정보 : ${check.user }</li>
			<li><a href="user/userOnly">유저전용</a></li>
			<li><a href="user/adminOnly">관리자전용</a></li>
			<li><a href="user/userAdmin">유저 , 관리자 둘다 사용 가능</a></li>
		</c:otherwise>
	</c:choose>
	
</ul>

<form id="logoutForm" action="user/logout" method="post" style="display:none">
   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>
