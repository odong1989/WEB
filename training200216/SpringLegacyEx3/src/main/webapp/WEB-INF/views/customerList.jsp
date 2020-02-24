<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ 회원 목록 ]</title>
<script type="text/javascript">
function deleteCustomer(pk){
	//컨트롤러의 삭제기능 요청주소로 연결
	//쿼리 스트링
	//요청을 보낼때 요청주소에 데이터를 연결하여 보내는 방식
	//location.href = "deleteCustomer?custid="+pk;
	var pwCheck = document.getElementById("pwCheck"+pk);

	if(pwCheck.value.length == 0){
		alert("비밀번호를 입력해 주세요.");
		return false;
	}

	var hiddenForm = document.getElementById("hiddenForm");
	var password = document.getElementById("password");
	var custid = document.getElementById("custid");
	
	password.value = pwCheck.value;
	custid.value = pk;
	hiddenForm.submit();
	
}

</script>
</head>
<body>
	<table>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>이메일</th>
			<th>구분</th>
			<th>주소</th>
			<th>비밀번호</th>
			<th>버튼</th>
		</tr>
		<c:forEach items="${list }" var="cust">
			<tr>
				<td>
					<a href="updateCustomerForm?custid=${cust.custid }">${cust.custid }</a>
				</td>
				<td>${cust.name }</td>
				<td>${cust.email }</td>
				<td>
					<c:if test="${cust.division eq 'personal' }">
						개인
					</c:if>
					<c:if test="${cust.division == 'company' }">
						법인
					</c:if>
				</td>
				<td>${cust.address }</td>
				<td>
					<input type="password" id="pwCheck${cust.custid }">
				</td>
				<td>
					<input type="button" value="삭제" onclick="deleteCustomer('${cust.custid }')">
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 히든 폼 -->
	<form action="deleteCustomer2" method="post" id="hiddenForm">
		<input type="hidden" id="password" name="password">
		<input type="hidden" id="custid" name="custid">
	</form>







</body>
</html>