<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<!--<link rel="sytlesheet" type="text/css" href="resources/css/moneybook.css" />--><!-- css - 상대경로 설정 -->
<link rel="sytlesheet" type="text/css" href="<c:url value="/css/moneybook.css" />" /><!-- css 절대경로인데 나는 에러중 이따 확인할 것.  -->


<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
</head>
<body>
<!-- 선생님께서는 제공된 css파일을 연계하여 테이블구성후 css스타일 적용 -->
<!-- 본영상에서는 우선 CSS적용되는가 확인.
     선생님 
  -->
<div id=wrap>
		<h1>일일 가계부</h1>
	<!-- 개인확인용 sessionScope.loginId : ${ sessionScope.loginId }<br> -->	
	<div class=memnu>
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
	</div>
</div>
</body>
</html>
