<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css" />" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
	function formCheck() {
		var userid = $("#userid").val();
		var userpwd = $("#userpwd").val();
	
		if(userid.length < 3 || userid.length > 10) {
			alert("아이디는 3~10 글자를 입력하세요");
			return false;
		}
	
		if(userpwd.length < 3 || userpwd.length > 10) {
			alert("비밀번호는 3~10 글자를 입력하세요");
			return false;
		}
	
		return true;
	}
</script>
</head>
<body>
	<div>
		<h1>[ 회원가입 ]</h1>
		
		<div class="menu">
			<form action="login" method="post">
				<table>
					<tr>
						<td>아이디</td>
						<td><input type="text" id="userid" name="userid" ></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="userpwd" name="userpwd" ></td>
					</tr>
					<tr>
						<td class="center">
							<input type="submit" value="로그인" onclick="return formCheck()">
						</td>
						<td colspan="2" class="center">
							<a href="<c:url value="/" />">
								<input type="button" value="취소">
							</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>
