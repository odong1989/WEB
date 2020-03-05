<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css"/>" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<!-- 
<td><input type="button" id="changeName" name="changeName" value="이름 변경하기"></td>
<td><input type="button"  id="changeAddress" name="changeAddress" value="주소 변경하기"></td>
 -->
<script>
	$(function(){

	  function printMydata(){
		  $.ajax({
				url  : "mydata",
				type : "get",
				data : {"changeName",$("changeName").val(), "changeAddress":$("changeAddress").val() },
				success : function() {alert("ok");},
				error : function() {alert("error up");}
			  })
	  }
	});
</script>
</head>
<body>
<div id="wrapMypage">
	<div class="header">
	<h2>${sessionScope.loginId}님의 개인정보(myPage)입니다</h2>
	</div>
<hr>
	<div class="myPageID">
		<dl>
			<dd>아이디(변경불가)</dd>
			<dd id=myID></dd>
		</dl>
	</div>
<hr>
	<div class="myPageID">
			<table>
				<tr>
					<td>가입자 성명</td>
					<td id=myName>sample</td>
					<td><input type="button" id="changeName" name="changeName" value="이름 변경하기"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td id=myAddress>sample</td>
					<td><input type="button"  id="changeAddress" name="changeAddress" value="주소 변경하기"></td>
				</tr>						
			
			</table>
			<dl>

			</dl>
	</div>
</div>

</body>
</html>