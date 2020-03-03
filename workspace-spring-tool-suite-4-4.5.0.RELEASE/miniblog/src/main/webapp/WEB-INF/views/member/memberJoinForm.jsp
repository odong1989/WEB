<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function idCheck(){
		window.open("memberJoinIdCheckForm","newWin","letf=500 right=500 top=500 height=500 resizeable=no");
	}

	function memberJoinCheck(){

	}
</script>
</head>
<body>
<h1>환영합니다! 회원가입입니다!</h1>
<form action="memberJoin" method="post" onsubmit="return memberJoinCheck()">
<table>
	<tr>
		<td>ID</td>
		<td><input type="text" id="miniblogmember_id" name="miniblogmember_id" placeholder="아이디는 3~8글자로 해주세요!" readonly="readonly"></td>
	  	<td><input type="button" value="ID중복체크" onclick="idCheck()"> </td>
	</tr>
		<tr>
		<td>비밀번호</td>
		<td cols="2"><input type="password" id="password" name="password"  placeholder="비밀번호는 3~8글자로 해주세요!"></td>
	</tr>
	<tr>
		<td>비밀번호확인</td>
		<td cols="2"><input type="password" id="passwordCheck"  placeholder="똑같이 입력해 주세요!"></td>
	</tr>	
	<tr>
		<td>성명</td>
		<td cols="2"><input type="text" id="membername" name="membername" placeholder="본명을 입력해주세요!"></td>
	</tr>
	<tr>
		<td>email</td>
		<td cols="2"><input type="text" id="email" name="email" placeholder="e메일입력은 선택사항입니다."></td>
	</tr>
	<tr>
		<td>phone</td>
		<td cols="2"><input type="text" id="membername" name="membername" ></td>
	</tr>
	<tr>
		<td><input type="submit" value="회원가입 "></td>
		<td cols="2"><input type="text" id="membername" name="membername" ></td>
	</tr>
</table>
</form>
</body>
</html>