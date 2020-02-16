<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!DOCTYPE>
<html>
<head>
	<title>메모확인</title>
<script type="text/javascript">
	function deleteMemoSelect(pk){
		var pwCheck = document.getElementById("pwCheck"+pk);
		console.log("pwCheck : "+pwCheck.value);
		if(pwCheck.value.length ==0){
			alert("비밀번호를 입력해주십시오.");
			return false;
			}
		var hiddenForm = document.getElementById("hiddenForm");
		var memo_pw = document.getElementById("memo_pw");
		var memo_no = document.getElementById("memo_no");

		memo_pw.value = pwCheck.value;
		memo_no.value = pk;

		console.log("memo_no.value : "+memo_no.value);
		console.log("memo_pw.value : "+memo_pw.value);
		
		hiddenForm.submit("memo_no.value : "+memo_no.value);
	}

</script>
</head>
<body>
<h1>
	[나만의 메모장]  
</h1>

<table>
	<tr>
		<th>번호</th>
		<th>내용</th>
		<th>등록일</th>		
		<th>비밀번호</th>	
		<th>삭제버튼</th>
	</tr>
	<c:forEach items="${list}" var="memoshow">
	<tr>
		<td>${memoshow.memo_no}</td>
		<td>${memoshow.memo_content}</td>
		<td>${memoshow.memo_indate}</td>
		<td><input type="password" id="pwCheck${memoshow.memo_no}"></td>
		<td><input type="button" value="삭제" onclick="deleteMemoSelect('${memoshow.memo_no}')" ></td>
	</tr>
	</c:forEach>
</table>

<!-- 히든 폼 -->
<form action = "deleteMemo" method="post" id="hiddenForm">
		<input type="hidden" id ="memo_pw" name="memo_pw">
		<input type="hidden" id ="memo_no" name="memo_no">
</form>
</body>
</html>