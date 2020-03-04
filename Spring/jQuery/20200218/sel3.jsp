<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$("#btn1").click(function() {
// 			alert($("input:text").val());
			alert($(":text").val());
		});

		$("#btn2").click(function() {
// 			alert($("input:checkbox").val());
// 			alert($(":checkbox").val());
// 			alert($(":checkbox:checked").val());
			alert($(":checked").val());
		});

		$("#btn3").click(function() {
// 			alert($("input:radio").val());
// 			alert($(":radio").val());
// 			alert($(":radio:checked").val());
			alert($(":checked").val());
		});

		$("#btn4").click(function() {
			alert($(":selected").val());
		});
	});
</script>
</head>
<body>
	<input type="button" id="btn1" value="text 값 확인"><br>
	<input type="button" id="btn2" value="checkbox 값 확인"><br>
	<input type="button" id="btn3" value="radio 값 확인"><br>
	<input type="button" id="btn4" value="select 값 확인"><br>
	
	<br>
	<br>
	
	아무거나 입력 : 
	<input type="text"><br>
	취미 : 
	<input type="checkbox" value="운동">운동
	<input type="checkbox" value="독서">독서
	<input type="checkbox" value="영화">영화<br>
	좋아하는 동물 : 
	<input type="radio" name="animal" value="고양이">고양이
	<input type="radio" name="animal" value="멍멍이">멍멍이
	<input type="radio" name="animal" value="둘다">둘다<br>
	
	<br>
	<br>
	
	<select>
		<option value="부먹">부먹</option>
		<option value="찍먹">찍먹</option>
		<option value="둘다">둘다</option>
	</select>
	
</body>
</html>