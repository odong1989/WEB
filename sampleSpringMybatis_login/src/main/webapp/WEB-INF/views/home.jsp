<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sample Project</title>
</head>
<body>
<!-- 로그인을 해야 하는 경우(로그인전)-->
<!-- 로그인 성공시에만 게시판 이동 링크를 보여줍니다. -->	
<!-- 이렇게 둘로 나누어 보여주도록 하였습니다. c안에 주석이 들어가면 500에러 납니다.... ㅠㅠ-->
<h1>[ Spring과 Mybatis를 이용한 Web Application 예제]</h1>

<ul>
	<c:choose>
		<c:when test="${sessionScope.loginId == null}">
			<li><a href="/member/memberJoinForm">회원가입 폼으로 이동</a></li>
			<li><a href="/member/memberLoginForm">로그인 폼으로 이동</a></li>
		</c:when>
		<c:otherwise> 
			<li><a href="/board/boardList">게시판 이동</a></li>
			<li><a href="/member/memberLogout">로그아웃</a></li>
		</c:otherwise>
	</c:choose>
</ul>
</body>
</html>