<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="/test/resources/jquery-3.4.1.js"></script> 절대 경로로 링크하는 경우(자동갱신 불가/비추천) -->
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script> <!-- 절대 경로로 링크하는 경우(자동갱신 됩니다) --><!-- 크롬 개발자 모드의 네트워크에서 제이쿼리 파일이 나오는지 확인한 다음 아래의 내용들을 작성합시다. -->

<script>
	$(function(){
		$("div").append("<H2>append추가</H2>");
		$("div").prepend("<H2>prepend추가</H2>");
		$("div").before("<H2>before추가</H2>");
		$("div").after("<H2>after추가</H2>");

		$("#btn1").click(function(){
			$("div").empty();//div태그는 살아있지만 div태그의 내용들은 사라져버립니다.
		})

		$("#btn2").click(function(){
			$("div").remove();
		})	

		var temp = $("#aa").parent();		
		//id가 aa인 객체의 부모 
		//id가 aa인 객체 = <h1 id="aa">a</h1> 이다.
		// <h1 id="aa">a</h1> 는 div내에 있다. 
		//div = 부모 역할 인 셈이다.
		temp.css("background-color","green");

		var temp2 = $("div").children();	
		//div의 자식에 속한다 = div 내에 있는 태그들
		// append, prepend, a, b가 해당된다.
		temp2.css("background-color","pink");
	})
</script>
</head>
<body>
	<input id="btn1" type="button" value="empty"><br>
	<input id="btn2" type="button" value="remove"><br>

	<div>
		<h1 id="aa">a</h1>
		<h1 id="bb">b</h1>
	</div>
	
	

</body>
</html>