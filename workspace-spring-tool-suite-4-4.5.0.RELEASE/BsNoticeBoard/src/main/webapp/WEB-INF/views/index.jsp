<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title></title>
	<link rel="stylesheet" href="/resources/css/styleSetting.css">	
	<script src="<c:url value='/resources/js/jquery-3.4.1.js' /> "> </script>
	<script>
	</script>
	</head>
<body>
<div class="Logo">
<a href="/"><img src="/resources/img/img1.daumcdn.png"></a>

</div>
<div class="Menubar">
</div>

<div="noticeTalkBox">
<div class="TalkBox sb1">I'm speech bubble</div>
<div class="TalkBox sb2">I'm speech bubble</div>
<div class="TalkBox sb3">I'm speech bubble</div>
<div class="TalkBox sb4">I'm speech bubble</div>	

</div>
<div="gallery">

</div>



<c:choose>
	<c:when test="${sessionScope.loginId == null}">
		sessionScope : NULL<br>
	</c:when>
	<c:otherwise>
		sessionScope : ${sessionScope.loginId}<br>
	</c:otherwise>
</c:choose>
<table>
	<c:choose>
		<c:when test="${sessionScope.loginId == null}">
			<tr>
				<td><a href="/member/memberJoinForm">회원가입 폼으로 이동</a></td>
			</tr>
			<tr>	
				<td><a href="/member/memberLoginForm">로그인 폼으로 이동</a></td>
			</tr>
			<tr>	
				<td><a href="/board/boardList">게시판 이동[인터셉션 확인용]]</a></td>
			</tr>
		</c:when>
			
		<c:otherwise> 
			<tr>
				<td>${sessionScope.loginId}님 환영합니다!</td>		
			</tr>
			<tr>
				<td><a href= "/member/memberMypage">MyPage</a></td>		
			</tr>
			<tr>	
				<td><a href="/board/boardList">게시판 이동</a></td>
			</tr>
			<tr>	
				<td><a href="/member/memberLogout">로그아웃</a></td>
			</tr>
		</c:otherwise>
	</c:choose>
</table>
<div class="maker">

</div>


</body>
</html>