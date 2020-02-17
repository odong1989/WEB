<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' />"></script>
<script>
$(function(){
	$("#abc").css("color","red");
});
</script>
</head>
<body>
<h1 id="abc">test</h1>
</body>
</html>