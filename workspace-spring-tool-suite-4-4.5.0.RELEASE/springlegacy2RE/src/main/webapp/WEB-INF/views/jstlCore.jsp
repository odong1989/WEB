<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <!-- 코어태그를 쓸수 있게 해줍니다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstlCore</title>
</head>
<body>
<h1>jstlCore</h1>

<h2>* set - attribute 저장</h2>
<c:set var="n" value="100" /> <!-- 기본형  <c:set>  </c:set>-->
n = ${n} <!-- 100이라는 문구가 떠야 합니다. n에게 100이란 값을 줬으니까요. -->


<h2>* remove - attribute 삭제</h2>
<c:remove var="n"/>
n = ${n}
</body>
</html>