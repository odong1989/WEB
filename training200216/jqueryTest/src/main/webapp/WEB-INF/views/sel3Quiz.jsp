<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- HW1번입니다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제이쿼리 2일차 퀴즈</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>
<script>

$(function() {
    //jquery 코드 작성
     
	var total = $("#id:text").val()  +' '
	           +$("#name:text").val()+' '
	           +$(":radio:checked").val();
	var htmlTop = document.getElementById('DivTop');
	
	console.log("total : " +total);
	console.log("DivTop : " +DivTop);


	DivTop.innerHTML += total; //
	DivTop.innerHTML += '<br>';
	});
});

</script>
</head>
<body>
<div id="DivTop">
아이디   이름    종류 <br>

</div>
<hr>
아이디 : <input type="text" id="id"><br>
이름 :  <input type="text" id="name"><br>
종류 :  
<input type="radio" name="chinaFood" value="부먹">부먹
<input type="radio" name="chinaFood" value="찍먹 ">찍먹 
<input type="radio" name="chinaFood" value="둘다">둘다<br>
<input type="button" id="showHTML" value="등록">
</body>
</html>