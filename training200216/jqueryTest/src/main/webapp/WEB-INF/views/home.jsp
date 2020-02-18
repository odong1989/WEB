<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>1일차</h2>
<h2><a href = "<c:url value='/sel1' />">   선택자</a> </h2>
<br>
<h2>2일차</h2>
<h2><a href = "<c:url value='/sel2' />">속성 선택자</a> </h2>
<h2><a href = "<c:url value='/sel3' />">필터 선택자</a> </h2>
<h2><a href = "<c:url value='/sel3Quiz' />">필터 선택자 quiz</a> </h2>
</body>
</html>