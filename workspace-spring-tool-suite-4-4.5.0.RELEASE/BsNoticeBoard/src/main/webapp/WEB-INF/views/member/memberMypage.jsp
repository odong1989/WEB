<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='<c:url value="/resources/js/jquery-3.4.1.js" />'></script>
<script>
$(function(){
	$("#btnChangeName").click(function(){
		$.ajax({
			url  : "MypageChangeName",
			type : "get",
			data : {"member_nm":$("#member_nm").val()},
			success : function(data){
				var output = "";
				output +="<tr><td>성명</td>"
				output +="<td><b>"+ data +" </b></td>"
				output +="<td><input type='text' id='member_nm' name='member_nm' value='변경할 이름 입력'></td>"
				output +="<td><input type='button' id='btnChangeName' value='이름 변경하기'></td></tr>"

				output +="<td>주소</td>"
				output +="<td><b> ${MemberData.member_addr}</b></td>"
				output +="<td><input type='text' id='member_addr' name='member_addr' placeholder='변경할 주소 입력'</td>"
				output +="<td><input type='button'  id='btnChangeAddress' value='주소 변경하기'></td>"
					
				$("#changeTable").html(output);
				alert("이름변경이 완료되었습니다.");
			},
			error : function() {alert("이름변경이 실패하였습니다.");}
		});
	});
	
	$("#btnChangeAddress").click(function(){
		 $.ajax({
			url  : "MypageChangeAddress",
			type : "get",
			data : {"member_addr":$("#member_addr").val()},
			success : function(data){
				var output = "";
				output +="<tr><td>성명</td>"
					output +="<td><b> ${MemberData.member_nm} </b></td>"
					output +="<td><input type='text' id='member_nm' name='member_nm' value='변경할 이름 입력'></td>"
					output +="<td><input type='button' id='btnChangeName' value='이름 변경하기'></td></tr>"

					output +="<td>주소</td>"
					output +="<td><b>" +data+ "</b></td>"
					output +="<td><input type='text' id='member_addr' name='member_addr' placeholder='변경할 주소 입력'</td>"
					output +="<td><input type='button'  id='btnChangeAddress' value='주소 변경하기'></td>"
				$("#changeTable").html(output);
				alert("주소 변경이 완료되었습니다.");
			},
			error : function() {alert("주소변경이 실패하였습니다.");}
		});
	});	
});
</script>
</head>
<body>
<div id="wrapMypage">
	<h2>${sessionScope.loginId}님의 개인정보(myPage)입니다</h2>
<hr>
	<div class="myPageID">
	<table>
		<tr>
			<td>아이디 : </td>
			<td>${MemberData.member_id}</td>
		</tr>
		<tr>
			<td>가입일 : </td>
			<td>${MemberData.member_indate}</td>
		</tr>
	</table>	
	</div>
<hr>
	<div class="myPageID">
	<table id="changeTable">
		<tr>
			<!-- <input type="hidden" name="member_id" value="${MemberData.member_id }">  -->	
				<td>성명</td>
				<td><b> ${MemberData.member_nm} </b></td>
				<td><input type="text" id="member_nm" name="member_nm" placeholder="변경할 이름 입력"></td>
				<td><input type="button" id="btnChangeName" value="이름 변경하기"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><b> ${MemberData.member_addr}</b></td>
				<td><input type="text" id="member_addr" name="member_addr" placeholder="변경할 주소 입력"></td>
				<td><input type="button"  id="btnChangeAddress" value="주소 변경하기"></td>
			</tr>	
		</table>
	</div>
</div>

</body>
</html>