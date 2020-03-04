<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$('#test').mouseenter(function() {
			var temp = $("#test").css('height');
			alert(temp);
		});
		
// 		$('#test').click(function() {
// 			// $('#test').css('height', 500);
// 			$(this).css('height', 500);
// 		});
		
		$("img").click(function() {
			$(this).css('height', 500);
		});
		
		$(":button").click(function() {
			$("img").css('height', 'auto');
		});
	});
</script>
</head>
<body>
	<img id="test" src="http://bit.ly/goback11" />
	<img src="http://bit.ly/goback11" />
	<img src="http://bit.ly/goback11" />
	<br>
	<input type="button" value="리셋" >
</body>
</html>
