<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="/test/resources/jquery-3.4.1.js"></script> 절대 경로로 링크하는 경우(자동갱신 불가/비추천) -->
<script src="<c:url value='/resources/jquery-3.4.1.js'/>"></script> <!-- 절대 경로로 링크하는 경우(자동갱신 됩니다) --><!-- 크롬 개발자 모드의 네트워크에서 제이쿼리 파일이 나오는지 확인한 다음 아래의 내용들을 작성합시다. -->
<script>
$(function(){
	//text() 함수는 innerText과 같다.
	//html() 함수는 innerHTML과 같다.

	var result = "<h2>html과 text 함수 사용 예</h2>";

	$("#result1").text(result);

	//innerHTML = result;와 같습니다. 즉 덮어씌우기와 같은 명령이라는 것.
	$("#result2").html(result);

	$("#result2").click(function(){
		alert($(this).text());	//text node(태그안의 문자들만)를 반환합니다.
		alert($(this).html());	//엘리먼트(html태그까지 포함한것을 말함)를 반환합니다.
	})
})
</script>
</head>
<body>
<div id="result1">
</div>

<div id="result2">
</div>
</body>
</html>