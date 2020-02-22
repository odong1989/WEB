<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ jstlCore ]</title>
</head>
<body>
<h2>* set - attribute 저장</h2>
<c:set var="n" value="100" />
n = ${n }<br/>

<h2>* remove - attribute 삭제</h2>
<c:remove var="n" />
n = ${n }<br/>

<h2>* if - 조건 검사</h2>
<c:if test="${str == 'abc' }">
	str의 값은 'abc' 입니다. <br/>
</c:if>

<c:if test="${number > 0 }">
	number의 값은 0보다 크다. <br/>
</c:if>

<h2>* choose - 다중 분기</h2>

<!-- if ~ else 문 -->
<c:choose>
	<c:when test="${number == 1 }">
		number의 값은 1입니다. <br/>
	</c:when>
	<c:when test="${number == 2 }">
		number의 값은 2입니다. <br/>
	</c:when>
	<c:otherwise>
		numbe의 값은 그 외의 값이다. <br/>
	</c:otherwise>
</c:choose>

<h2>* forEach - 반복</h2>

<c:forEach var="cnt" begin="1" end="5">
	반복${cnt }
</c:forEach>
<br><br>

<!-- end 값은 컬렉션의 사이즈의 -1 까지  -->
<c:forEach var="i" begin="0" end="${list.size() -1 }">
	${list.get(i) }
</c:forEach>
<br><br>

<!-- java의 foreach문과 비슷한 유형 -->
<c:forEach var="value" items="${list }">
	${value }
</c:forEach>

<h2> * out - 데이터 출력(특수문자 포함)</h2>
EL로 출력 : ${data } <br/>
<c:out value="${data }" /> <br/>










<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>


</body>
</html>