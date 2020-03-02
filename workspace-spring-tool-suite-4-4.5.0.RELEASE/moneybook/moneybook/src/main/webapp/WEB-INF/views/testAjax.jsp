<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
$(function(){
	$("#btn1").click(function(){
		location.href = "noajax1"
	});
})
$(function(){
	$("#btn2").click(function(){
		location.href = "noajax2"
	});
})
$(function(){
	$.ajax({
		url : "ajax1",
		dataType : "json",
		success : function(Result){
			$("#here1").val(Result.userid);
			$("#here2").val(Result.Userpwd);			
		},	
		error : function(){alert("에러");}
	})
});
</script>
</head>
<body>
<h2>영역1</h2>
ID : <input type="text" value="${id1} "><br>
이름 : <input type="text" value="${name1} "><br>
<hr>

<h2>영역2</h2>
ID : <input type="text" id="here1" value="${id2} "><br>
이름 : <input type="text" id="here2" value="${name2} "><br>
<hr>
<input type="button" id="btn1" value="영역1 / 이름가져오기(ajax 사용않을 시 )"><br>
<input type="button" id="btn2" value="영역2 / 이름가져오기(ajax 사용않을 시 )"><br>
<input type="button" id="btn3" value="영역2 / 이름가져오기(ajax 사용 시 )"><br>
</body>
</html>