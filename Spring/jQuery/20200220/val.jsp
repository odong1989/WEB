<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$(":text").on("keyup", function() {
			var text = $(this).val();
			$(".copied").val(text);
		});
	})
</script>
</head>
<body>

<input type="text" placeholder="여기에 텍스트 입력"><br>
<br>

<input type="text" class="copied" readonly="readonly"><br>
<input type="text" class="copied" readonly="readonly"><br>
<input type="text" class="copied" readonly="readonly"><br>
<br>

</body>
</html>
