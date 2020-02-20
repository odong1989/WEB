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
	.select{ background-color: pink; }
	.bgColor0{ background-color: orange; }
	.bgColor1{ background-color: aqua; }
	.bgColor2{ background-color: green; }
	.bgColor3{ background-color: olive; }
	.bgColor4{ background-color: lime; }
	.bgColor5{ background-color: black; }
</style>

<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>
<script>
$(function(){

	$("img").mouseenter(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
		$(this).css("height",700) // this=클릭된 img태그의 문서개게를 			
	})
		
		
	$("img").mouseleave(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
		$(this).css("height","auto") //$("img") : 모든 img태크들을 의미합니다.	//원래크기("auto")로 돌아가게 됩니다.		
	})	

	
	$("p").mouseenter(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
		//방법1. css 코드를  직접 입력합니다.
		//$(this).css('background-color','pink');
		//방법2. addClass명령을 사용하여  select라는 속성을 추가한다.
		$(this).addClass('select');	
	})
		
		
	$("p").mouseleave(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
		//방법1. css 코드를  직접 입력합니다.
		//$(this).css('background-color','');
		//방법2. addClass명령을 사용하여  select라는 속성을 추가한다.
		$(this).removeClass('select');	
	});


//	setTimeout(함수, 시간); 
//	setTimeout(함수, 5초);
//setTimeout(함수,index*500);//0.5초 간격으로 index가 함수를 실시합니다.
	
	$("button").click(function(){
		$("p").each(function(index,item){
			setTimeout(function() {
				$(item).addClass("bgColor"+index);			
			}, index*500);
		});
	});				
})
</script>
</head>
<body>

<h2>[css함수] 마우스가 올라가면 이미지크게, 내려가면 원래크기로</h2>
	<img src="resources/img1.daumcdn.png">
	<img src="resources/img1.daumcdn.png">
	<img src="http://bit.ly/goback11" />

	<br>
<hr>
<h2>[class함수] 마우스가 올라가면 배경색 나오게</h2>

	<div>
		<p id="p1">문장1</p>
		<p id="p2">문장2</p>
		<p id="p3">문장3</p>
		<p id="p4">문장4</p>
		<p id="p5">문장5</p>
		<p id="p6">문장6</p>
	</div>

<hr>
<h3>[each+setTimeOut] 버튼 누르면 순차적자동으로 배경색 들어오게</h2>
	<button>누르세요</button>
</body>
</html>