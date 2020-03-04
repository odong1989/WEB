<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bgColor, .bgColor0 {
		background-color: orange;
	}
	
	.bgColor1 {
		background-color: blue;
	}
	.bgColor2 {
		background-color: aqua;
	}
	.bgColor3 {
		background-color: green;
	}
	.bgColor4 {
		background-color: olive;
	}
	.bgColor5 {
		background-color: lime;
	}
</style>

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		
		$("#btn1").click(function () {
			$("div > *").addClass("bgColor");
		});
		
		$("#btn2").click(function () {
			$("div > *").removeClass("bgColor");
		});
		
		$("#btn3").click(function () {
			$("div > *").addClass(function(index) {
				return "bgColor" + index;
			});
		});
		
		$("#btn4").click(function () {
			$("div > *").removeClass(function(index, item) {
				// return "bgColor" + index;
				return item;
			});
		});
		
		$("#btn5").click(function () {
			$("div > *").removeClass();
		});
		
		$("#btn6").click(function () {
			$("div > *").toggleClass("bgColor");
		});
		
		$("#btn7").click(function () {
			$("div > *").toggleClass();
		});
	});
</script>
</head>
<body>
	<div>
		<h1>가</h1>
		<h2>나</h2>
		<h3>다</h3>
		<h4>라</h4>
		<h5>마</h5>
		<h6>바</h6>
	</div>
	
	<input type="button" value="class 속성 추가1" id="btn1" ><br>
	<input type="button" value="class 속성 삭제1" id="btn2" ><br>
	<input type="button" value="class 속성 추가2" id="btn3" ><br>
	<input type="button" value="class 속성 삭제2" id="btn4" ><br>
	<input type="button" value="class 속성 삭제3" id="btn5" ><br>
	<input type="button" value="class 속성 토글1" id="btn6" ><br>
	<input type="button" value="class 속성 토글2" id="btn7" ><br>
</body>
</html>
