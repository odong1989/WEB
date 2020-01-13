<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>formData1화면입니다.</h1>
	<!-- 	<form action="formDataVo" method="post"> -->
	<!-- 	<form action="formDataVo" method="post"> -->
	
	<form action="formDataLB" method="post">
	<!-- form action=""에는 @RequestMapping의 value를 적습니다. -->
	
		Id : <input type="text" name="str"><br/>
		Pw : <input type="text" name="password"><br/>
		hobby :<br/>
		<input type="checkbox" name="hobby" value="축구">축구<br/>
		<input type="checkbox" name="hobby" value="야구">야구<br/>	
		
		<input type="submit" value="전송">
		<!-- 한글을 전송할 경우 깨짐이 발생합니다.
 			  아직 한글 전송시 깨짐을 방지해주는 코드를 않은 상태입니다. 
 			  web.xml에 추가해야 합니다.
		 -->
	</form>	
	
	
	
</body>
</html>