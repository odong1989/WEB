<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 절대경로 설정위해 할 것 1 - JSTL 로딩 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>

<script>
	$(function(){
		/*
		//이벤트 연결방법[1]
		//타입속성(:)이 텍스트인 녀석이 1개의키입력이 될때마다(keyup())
		$(":text").keyup(function(){
			var temp = $(this).val();
			//val()함수는 값을 가져오거나 넣을 수 있습니다!
			//클래스(.)값이 copied인 애들의 값(val)을 temp로 
			$(".copied").val(temp);
		})
		*/

		//방법 on을 활용(on은 이벤트를 연결하는 역할입니다)
		
		$(":text").on("keyup",function(){
			var temp = $(this).val();
			$(".copied").val(temp);
		});

		
		$(":text").off();//모든 이벤트와의 연결 끊기
		$(":text").off("keyup");//끊고 싶은 이벤트이름을 매개변수처럼 기입한다.
			
	})
</script>
</head>
<body>
	<input type="text" placeholder="여기에 텍스트를 입력"><br>
	<!-- 1타3피처럼 3개를 동시에 입력되게 하려고 함 -->
	<input class="copied" type="text" ><br>
	<input class="copied" type="text" ><br>
	<input class="copied" type="text" ><br>			
</body>
</html>