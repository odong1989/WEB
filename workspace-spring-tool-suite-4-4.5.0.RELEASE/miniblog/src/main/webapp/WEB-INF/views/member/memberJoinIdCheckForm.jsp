<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function idcheckPreview(){
	
}

</script>
</head>


<body>
<h3>[ID중복확인]</h3>
<form action="idcheck" method="get">
	<table>
		<tr>
			<td>가입하실 계정명</td>
			<td><input type="text" id="checkId" name="checkId"></td>
		</tr>
		<tr>
			<td><input type="submit" value="ID중복체크"></td>
			<td><input type="idcheckPreview()" value="ID중복체크"></td>
			<td><input type="returnToMain()" value="취소(첫화면으로 이동)"></td>
		</tr>		
	</table>
	
	<C:if test="${checkFlag}">
		<C:choose>
			<C:when test="">
			
			</C:when>
		
		</C:choose>	
	</C:if>
		
</form>
</body>
</html>