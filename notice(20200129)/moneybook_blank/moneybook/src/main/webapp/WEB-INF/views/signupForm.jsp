<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script type="text/javascript">
	function signCheck(){
	//원래는 조건문 실시
		return true;
	}
	function returnMain(){
		location.href ="/";
	}
</script>
</head>
<body>
	회원가입폼입니다
	<form action="sign" method="POST" onsubmit="return signCheck()">
		회원가입      : <input type= "text" id="userid" name="userid">
		비밀번호      : <input type= "password" id="userpwd" name="userpwd">
		비밀번호 확인 : <input type= "password" id="userpwdRe" name="userpwdRe">		
		<input type="submit" value="가입">
		<input type="button" value="취소" onclick="returnMain()">	
	</form>
</body>
</html>
