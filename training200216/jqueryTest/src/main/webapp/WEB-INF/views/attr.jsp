<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 절대경로 설정위해 할 것 1 - JSTL 로딩 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<c:url value='/resources/jquery-3.4.1.js' /> "> </script>

<script>
	$(function(){			
	  //문서객체.attr(속성)
	  //문서객체.attr(속성,속성값)
		  var link = [
				"http://bit.ly/goback11",
				"http://bit.ly/goback22",				
				"http://bit.ly/goback33",		
			  ];
		  var cnt =0;

		//타입속성이 버튼이다 = ":button"
		 $(":button").click(function(){
				var temp = $(this).val();

				//왼쪽 버튼이냬?아니면 오른쪽 버튼이냐에 따라 구분하여 실시.
				if(temp === "->") cnt >= link.length -1 ? cnt= 0 : cnt++;
				$("img").attr("src",link[cnt]);
				//									   ?  참일시 , 거짓일시;
				else cnt <= 0 ? cnt = link.length-1  : cnt--;
				$("img").attr("src",link[cnt]);
		 });
	});
</script>
</head>
<body>
	<img src="resources/img1.daumcdn.png" >
	<input type="button" value="<-" >
	<input type="button" value="->" >
	
</body>
</html>