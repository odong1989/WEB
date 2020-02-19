<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script type="text/javascript">
	function formCheck(){
		var id = document.getElementById("id");
		var pw = document.getElementById("password");
		var age = document.getElementById("age");
		var name = document.getElementById("name");

		if(id.value.length > 8 || id.value.length < 4){
			alert("아이디는 4~8글자를 입력하세요.");
			return false;
		}

		if(age.value == ""){
			alert("나이를 입력해 주세요");
			return false;
		}else if(isNaN(age.value)){
			alert("나이는 숫자만 입력해주세요.");
			return false;
		}

		return true;
		
	}
</script>
</head>
<body>

<form action="join" method="post" onsubmit="return formCheck();">
	ID : <input type="text" id="id" name="id" placeholder="아이디는 4~8글자"> <br/>
	PW : <input type="password" id="password" name="password" placeholder="비밀번호는 4~8글자"> <br/>
	AGE : <input type="text" id="age" name="age" placeholder="나이는 숫자만"> <br />
	NAME : <input type="text" id="name" name="name" placeholder="이름은 필수"> <br />
	<input type="submit" value="가입">
</form>

<br/>


<a href="JstlCore">JSTL-Core</a><br/>
<a href="Session1">Session 등록</a><br/>
<a href="resources">리소스 확인</a><br/>
<a href="forward">Forward 확인</a>









</body>
</html>
