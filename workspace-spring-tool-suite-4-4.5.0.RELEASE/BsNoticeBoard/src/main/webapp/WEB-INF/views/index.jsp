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
<div class="header">
	<div class="Logo">
	<a href="/"><img src="/resources/img/logo.jpg" width="100" ></a>
	</div>
	<div class="Menubar">
	<table>
		<c:choose>
			<c:when test="${sessionScope.loginId == null}">
				<tr>
					<td><a href="/member/memberLoginForm">로그인하기</a></td>
					<td><a href="/member/memberJoinForm">회원가입하기</a></td>
				</tr>
			</c:when>
			<c:otherwise> 
				<tr>
					<td>${sessionScope.loginId}님 환영합니다!</td>		
					<td><a href= "/member/memberMypage">MyPage</a></td>		
					<td><a href="/board/boardList">게시판 이동</a></td>
					<td><a href="/member/memberLogout">로그아웃</a></td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
</div>


<div class="noticeByAdmin">
[관리자 알림]
 		<div class="TalkBox talk">
</div>	

</div>

<div class="noticeBoard">
	[게시판]
<!-- 	
<h1>[글 목록]</h1>
<table>
	<tr>
		<th>글번호	</th>
		<th>제목	</th>
		<th>글쓴이	</th>
		<th>조회수	</th>		
		<th>등록일	</th>
	</tr>
	

	<tr>
		<c:forEach items="${list }" var="item" varStatus="status">
			<tr class="trhover">
				<td>${(totalCount - status.index) - (navi.currentPage - 1) * navi.countPerPage}</td>
				<td>
				<a href="javascript:boardReadForm('${item.BOARD_NO}')">
						${item.BOARD_TITLE }</a></td>
				<td>${item.MEMBER_NM }</td>
				<td>${item.BOARD_HITS }</td>
				<td>${item.BOARD_INDATE }</td>
			</tr>
		</c:forEach>
	</tr>
</table>
 -->	
<!-- 	
	<div class="box sb1">I'm speech bubble</div>
	<div class="box sb2">I'm speech bubble</div>
	<div class="box sb3">I'm speech bubble</div>
	<div class="box sb4">I'm speech bubble</div>
 -->
</div>


<div class="maker">
제작자 : 김보성
</div>


</body>
</html>