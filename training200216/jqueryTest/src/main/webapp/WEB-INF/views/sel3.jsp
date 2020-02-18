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
		$("#btn1").click(function(){
			var temp = $(":text").val();//제이쿼리로 문서객체에서 값을 가져올 경우 val()이라고 해야합니다.
			console.log("temp : "+temp);
			alert(temp);
		});

		$("#btn2").click(function(){
			var temp = $(":checkbox:checked").val();//제이쿼리로 문서객체에서 값을 가져올 경우 val()이라고 해야합니다.
			console.log("temp : "+temp);
			alert(temp);
		});
		
		$("#btn3").click(function(){
			var temp = $(":radio:checked").val();//제이쿼리로 문서객체에서 값을 가져올 경우 val()이라고 해야합니다.
			console.log("temp : "+temp);
			alert(temp);
		});

		$("#btn4").click(function(){
			var temp = $(":selected").val();//제이쿼리로 문서객체에서 값을 가져올 경우 val()이라고 해야합니다.
			console.log("temp : "+temp);
			alert(temp);
		});
	})
</script>
</head>
<body>
<!-- 버튼을 클릭할 때마다 알림창을 통하여 입력한 텍스트/라디오/체크박스/ 세렐트 값을 출력하도록 합니다. -->
	<input type="button" id="btn1" value="text값 확인"><br>
	<input type="button" id="btn2" value="checkbox값 확인"><br>
	<input type="button" id="btn3" value="radio값 확인"><br>
	<input type="button" id="btn4" value="sellect값 확인"><br>		

	아무거나 입력 : 
	<input type="text" ><br>
	
	취미 : 
	<input type="checkbox" value="운동">운동
	<input type="checkbox" value="독서">독서
	<input type="checkbox" value="영화">영화<br>
	
	좋아하는 동물
	<!-- name="animal" 으로 하여 3개 중 하나의 값만 선택되도록 합시다 -->
	<input type="radio" name="animal" value="고양이" >고양이
	<input type="radio" name="animal" value="멍멍이" >멍멍이
	<input type="radio" name="animal" value="둘다" >둘다 <br>
	
	<select>
		<option value="부먹">부먹</option>
		<option value="찍먹">찍먹</option>
		<option value="둘다">둘다</option>		
	</select>



</body>
</html>