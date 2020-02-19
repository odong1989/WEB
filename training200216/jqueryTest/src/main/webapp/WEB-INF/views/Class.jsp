<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 20.02.19  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- .bgcolor, bgcolor0 : 클래스(.)가 bgcolor이거나 bgcolor0인 것 -->
<style>
	.bgColor, bgColor0{  
		background-color: orange;
	}

	.bgColor1{
		background-color: aqua;
	}
	
	.bgColor2{
		background-color: green;
	}
	
	.bgColor3{
		background-color: olive;
	}
	
	.bgColor4{
		background-color: lime;
	}

	.bgColor5{
		background-color: black;
	}
</style>

<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>
<script>
$(function() {
	$("#btn1").click(function(){
		$("div>*").addClass("bgColor");
	}); //<h1>가</h1> => <h1 bgColor>가</h1>

	$("#btn2").click(function(){
		$("div>*").removeClass("bgColor");
	});

	$("#btn3").click(function(){
		//call back function 콜백함수
		//function의 매개변수로 전달된 function
		$("div>*").addClass(function(index){
			return "bgColor"+index;
		})
	});

	$("#btn4").click(function(){
		$("div>*").removeClass(function(index,item){
			console.log(item);
			return item;
		})
	});

	$("#btn5").click(function(){
		$("div>*").removeClass();
	});

	$("#btn6").click(function(){
		$("div>*").toggleClass("bgColor");
	});

	$("#btn7").click(function(){
		$("div>*").toggleClass();//매개변수를 아무것도 전달않는 경우입니다.값을 임시로 숨겨서 전등의 on/off같은 효과입니다.
	});

})
</script>
</head>
<body>
	<div>
		<h1>가</h1>	<!-- index=0 -->
		<h2>나</h2>	<!-- index=1 -->
		<h3>다</h3>	<!-- index=2 -->
		<h4>라</h4>	<!-- index=3 -->
		<h5>마</h5>	<!-- index=4 -->
		<h6>바</h6>	<!-- index=5 -->
	</div>
	
	<input type="button" id="btn1" value="class 속성추가1"><br><br>
	<input type="button" id="btn2" value="class 속성삭체2"><br><br>
	<input type="button" id="btn3" value="class 속성추가2"><br><br>
	<input type="button" id="btn4" value="class 속성추가2"><br><br>	
	<input type="button" id="btn5" value="class 속성삭제3"><br><br>	
	<input type="button" id="btn6" value="class 토글추가1"><br><br><!--똑딱이 스위치처럼 on/off가 가능한것 -->
	<input type="button" id="btn7" value="class 토글삭제1"><br><br>
	
	
</body>
</html>