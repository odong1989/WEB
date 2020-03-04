<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		function addInfo() {
			var useridVal = $("#userid").val();
			var usernameVal = $("#username").val();
			var userTypeVal = $(":radio:checked").val();
			var infoTableDoc = document.getElementById("infoTable");
			
			infoTableDoc.innerHTML += "<tr><td>"+useridVal+"</td><td>"+usernameVal+"</td><td>"+userTypeVal+"</td></tr>";
		}
		
		$("#btn").click(addInfo);
	});
</script>
</head>
<body>
<div>
	<div>
		<table id="infoTable">
			<tr>
				<th>아이디</th><th>이름</th><th>종류</th>
			</tr>
		</table>
	</div>
	<hr>
	
	<div>
		아이디:<input type="text" id="userid"><br>
		이름:<input type="text" id="username"><br>
		종류:
		<input type="radio" name="usertype" value="부먹">부먹
		<input type="radio" name="usertype" value="찍먹">찍먹
		<input type="radio" name="usertype" value="둘다" checked="checked">둘다
	</div>
	<button id="btn">등록</button>
</div>
</body>
</html>
