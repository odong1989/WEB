<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<script type="text/javascript">
	function testInsert(){
		var memo = document.getElementById("memo");
		var pw_memo = document.getElementById("pw_memo");
		return true;
	}

</script>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p>우선 insert부터 잘되는지 확인</p>



<!-- 잘못12 액션 미설정 action="insert"이면 컨트롤러 설정도 가야지 얌마 -->
<form action="insertMemo" method="post" onsubmit="return testInsert();">
<table>

<tr>
<td>내용</td>
<td><input type="text" name="memo_content"></td>
</tr>
<tr>
<td>비밀번호</td>
<td><input type="password" name="memo_pw"></td>
</tr>
<tr>
<td rowspan="2"><input type="submit" value="등록"></td>
</tr>
</table>
</form>

<form action="selectAll" method="get">
<input type="submit" value="목록">
</form>



</body>
</html>
