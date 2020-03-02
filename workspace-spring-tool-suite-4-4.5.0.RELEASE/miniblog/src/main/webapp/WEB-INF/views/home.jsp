<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
</head>
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet"> 					<!-- css -->
<script src="<c:url value="/resources/js/jquery.3.4.1.js" />"></script> 					 <!-- jQury -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script><!-- bootstrap -->
<body>

<div id="wrap" >
	<c:choose>
		<c:when test="${sessionScope.loginId == null }">
			<form action="Login" >
			<table id="loginBefore">
				<tr>
					<td>아이디</td>
					<td><input type="text" id="" name=""></td>
				</tr>
				<tr>
					<td>패스워드</td>
					<td><input type="password" id="" name=""></td>
				</tr>		
				<tr>
					<td><a href="member/moveMemberJoinForm">회원가입</a></td>
				</tr>		
			</table>
			</form>
			
			<table id="myboardBefore">
				<tr>
					<td>로그인 하신 다음에 글을 보실수 있어요!</td>
				</tr>
			</table>
		</c:when>
		
		<c:otherwise>
			<table id="loginAfter">
				<tr rowspan="2">
					<td colspan="2">${id}{님! 환영합니다!}</td>
				</tr>
			</table>
			<table id="myboardBefore"></table>
		</c:otherwise>	

	</c:choose>	
	

	
</div>


</body>
</html>
