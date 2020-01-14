<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
				alert("아이디는 4~8글자를 입력해주세요.");
				id.focus();
				return false;
			}
			if(pw.value.length > 8 || pw.value.length < 4){
				alert("비밀번호는 4~8글자를 입력해주세요.");
				pw.focus();
				return false;
			}
			if(age.value == ""){
				alert("나이를 입력해주세요");
				age.focus();
				return false;
			}
			
			if(isNaN(age.value)) {
				alert("나이는 숫자만 입력해주세요");
				age.focus();
				return false;
			}
			
			if(name == null) {
				alert("이름을 입력해주세요");
				name.focus();
				return false;
				}		
			return true;	
		}


	</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<form action = "join" method="post" onsubmit="return formCheck();">
<!-- action = "join" = join컨트롤러에게 폼submit를 보냅니다. -->
	ID: <input type="text" id = "id"			 name="id" 		placeholder = "아이디는 4~8글자"> <br>
	PW: <input type="password" id = "password"	 name="password"placeholder="비밀번호는 4~8글자"><br>
	AGE: <input type="text" id = "age" 			 name="age"		placeholder = "나이는 숫자만"> <br>
	NAME: <input type="text" id = "name" 		 name="name"	placeholder = "이름은 필수"> <br>
	<input type = "submit" value="가입">
</form>


<a href="jstlCore">JSTL-Core</a>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
