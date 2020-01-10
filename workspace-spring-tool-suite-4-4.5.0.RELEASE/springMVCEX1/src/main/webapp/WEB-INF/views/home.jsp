<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>


<!--  <a href="index.jsp">index.jsp로 이동</a> 
	처럼 바로 직접 다이렉트로 연결가는 ㅂ것은 불가능합니다.
	스프링에서 컨트롤러를 통해서만 갈수 있도록 막아둔 것이죠.
-->
	<a href="index">index.jsp로 이동</a> 
</body>
</html>
