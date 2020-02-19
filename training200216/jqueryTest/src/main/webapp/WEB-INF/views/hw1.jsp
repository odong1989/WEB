<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이쿼리 2일차 퀴즈(숙제) - 선생님의 풀이</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>
<script>

$(function() {
    //jquery 코드 작성
	$("#btn").click(function(){ //id가 btn인 애가 클릭외었을 때 아래의 기능들을 실행합니다.
		var useridVal = $("#userid").val();
		var usernameVal = $("#username").val();
		var usertypeVal = $(":radio:checked").val();				
	
		var infotableDoc = document.getElementById("infoTable");

		//테이블 안에 넣어야 하므로 html-table 태그도 같이 작성하여 넣는다
		infotableDoc.innerHTML += "<tr><td>"+ useridVal +"</td><td>"
								  +"</td><td>"+usernameVal+"</td><td>"
								  +"</td><td>"+usertypeVal+"</td><tr>";

	});

    /*이외의 방법
	function addInfo(){ //id가 btn인 애가 클릭외었을 때 아래의 기능들을 실행합니다.
		var useridVal = $("#userid").val();
		var usernameVal = $("#username").val();
		var usertypeVal = $(":radio:checked").val();				
	
		var infotableDoc = document.getElementById("infoTable");

		//테이블 안에 넣어야 하므로 html-table 태그도 같이 작성하여 넣는다
		infotableDoc.innerHTML += "<tr><td>"+ useridVal +"</td><td>"
								  +"</td><td>"+usernameVal+"</td><td>"
								  +"</td><td>"+usertypeVal+"</td><tr>";

	};
	*/
});

</script>
</head>
<body>
<div>
	<!-- 선생님의 경우에는 테이블로 구성 -->
	<div>
		<table id="infoTable">
			<tr>
				<th>아이디 </th>
				<th>이름</th>	
				<th> 종류</th>		
			</tr>		
		</table>
	</div>
	
	<!-- 아이디등 정보 입력도 div로 구성 -->
	<div>
		아이디 : <input type="text" id="userid"><br>
		이름 :  <input type="text" id="username"><br>
		종류 :  
		<input type="radio" name="usertype" value="부먹">부먹
		<input type="radio" name="usertype" value="찍먹 ">찍먹 
		<input type="radio" name="usertype" value="둘다" checked>둘다
	</div>
		<input type="button" id="btn" value="등록">	

</div>
<hr>

</body>
</html>