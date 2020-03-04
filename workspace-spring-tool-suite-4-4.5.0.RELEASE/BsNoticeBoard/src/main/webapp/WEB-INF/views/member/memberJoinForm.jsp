<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/resources/css/styleSetting.css">	
	<script src="<c:url value='/resources/js/jquery-3.4.1.js' /> "> </script>
<script>
function idCheck(){
	 window.open("memberidCheckForm","newWin","left=300, top=300, width=500, height=300, resizeable=no");
	 }
function formCheck(){//id체크만 하는  함수.
	var member_id = document.getElementById("member_id");
	
	if(member_id.value == "" || member.id.value.length ){
		alert("ID 중복체크를 해야 회원가입이 가능합니다!");
		return false;
	}
}

</script>
</head>


<body>
<h1>회원가입</h1>
<div id="joinForm">
	<form action="memberJoin" method="post" onsubmit="return formCheck();">
		<table>
			<tr>
				<td>ID :</td>
				<td><input type="text" name="member_id" id="member_id" readonly="readonly"></td>
				<td><input type="button" value="중복체크" onclick="idCheck()">	</td>
			</tr>
			<tr>
				<td>PW :</td>
				<td colspan="2"><input type="password" id="member_pw" name="member_pw" ></td>
			</tr>
			<tr>
				<td>이름 : </td>
				<td colspan="2"> <input type="text" id="member_nm" name="member_nm" >  </td>
			</tr>
			<tr>
				<td>주소 : </td>
				<td colspan="2"> <input type="text" id="member_addr" name="member_addr" >  </td>
			</tr>
			<tr id="buttonAlign">
			<td colspan="3"> <input type="submit" value="회원가입"> <input type="button" value="취소(메인화면으로)"></td>
			</tr>	
		</table>
	</form>
</div>
</body>
</html>