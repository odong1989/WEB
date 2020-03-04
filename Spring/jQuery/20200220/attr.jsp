<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuert each</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		var cnt = 0;
		var link = [
			'http://bit.ly/goback11',
			'http://bit.ly/goback22',
			'http://bit.ly/goback33'
			];
		
		$(":button").click(function() {
			var temp = $(this).val();
			if(temp === '->') cnt >= link.length-1 ? cnt = 0 : cnt++;
			else cnt <= 0 ? cnt = link.length-1 : cnt--;
			$("img").attr("src", link[cnt]);
		});
	});
</script>

</head>
<body>
	<img src="http://bit.ly/goback11" /><br>
	<input type="button" value="<-" >
	<input type="button" value="->" >
	<br>
</body>
</html>
