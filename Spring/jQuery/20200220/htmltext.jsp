<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function() {
		var result="<h2>html 과 text 함수의 사용 예</h2>";
		$('#result1').text(result);
		$('#result2').html(result);

		$("#result2").click(function() {
			alert("text >  " + $(this).text());
			alert("html >  " + $(this).html());
		});
	});
</script>
</head>
<body>

	<div id="result1"></div>
	<div id="result2"></div>

</body>
</html>