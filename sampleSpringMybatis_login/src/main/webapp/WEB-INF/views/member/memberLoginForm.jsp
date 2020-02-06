<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[로그인 폼]</title>

</head>

<body>
<h1>[로그인 폼]</h1>

<c:if test="${errMsg != null }">
${errMsg}
</c:if>


<!-- 계쩡정보를 보호하기 위해 취하는 방식
	1) post방식으로  전송 
	
	
	2) 값을 넘겨주기 위해 name 속성을 사용합니다.
	-->
	
	<form action="memberLogin" method="post">
	<!--
		<form action="memberlogin" method="post" onsubmit="">
	 숙제
	onsubmit=""를 활용하여 유효성검사를 하세요!(#시간이 없어서 생략한 것일 뿐이에요! -->
		ID : <input type="text" name="member_id"><br/>
		PW : <input type="password" name="member_pw"><br/>
		<label for="fuck" style="cursor:pointer">
			<input type="checkbox" id="fuck" <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>name="remember" value="1">아이디 기억하기 <br/>
		</label>
		<!-- 아이디를 기억하는 기능이 활성여부를 결정. 
		체크박스의 value는 뭘 써도 상관없어요.
		중요한 것은 체크박스의 값과 동일한 값이 왔느냐, 아니냐 구분이 중요한 거죠.
		-->
		
		<input type="submit" value="로그인">
	</form>

</body>
</html>