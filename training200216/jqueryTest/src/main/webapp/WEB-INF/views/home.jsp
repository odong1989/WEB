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

<br>
<h2>3일차</h2>
<h2><a href = "<c:url value='/hw1' />">필터 선택자 quiz(과제1 풀이)</a> </h2>
<h2><a href = "<c:url value='/each' />">each</a> </h2>
<h2><a href = "<c:url value='/css' />">css</a> </h2>
<h2><a href = "<c:url value='/Class' />">Class</a> </h2>
<h2><a href = "<c:url value='/hw2_myStyle' />">3일차숙제 - hw2_myStyle</a> </h2>


</body>
</html>