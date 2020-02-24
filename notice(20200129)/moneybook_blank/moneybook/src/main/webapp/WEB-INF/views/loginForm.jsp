<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script type="text/javascript">

	function loginFormCheck(){
		var userid = document.getElementById("userid");
		var userpwd =document.getElementById("userpwd");

//		alert("userid:"+userid.value);
//		alert("userpwd:"+userpwd.value);		
		if( 3<= userid.value.length &&userid.value.length<=10 ){
//			//alert("계정 ㅇㅋ");
		}
		else{
			alert("아이디는 3~10글자내");
			return false;
		}
		if(3<= userpwd.value.length && userpwd.value.length<=10){
//			alert("비번 ㅇㅋ");
		}
		else{
			alert("비번는 3~10글자내");
			return false;
		}
		return true;
	}

	
	function returnMain(){
		location.href ="/";
	}

</script>
</head>
<body>
로그인 폼
<h2>[로그인]</h2>
<form action="login" method="POST" onsubmit="return loginFormCheck()">
아이디   : <input type="text" 	  id="userid"  name="userid"> 
비밀번호 : <input type="password" id="userpwd" name="userpwd"> 
<input type="submit" value="로그인">
<input type="button" value="취소" onclick="returnMain()">
</form>
</body>
</html>
