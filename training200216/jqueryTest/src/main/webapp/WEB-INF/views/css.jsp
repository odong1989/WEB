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

		$("#test").mouseenter(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
			var temp = $("#test").css("height") //id가 test인 것의 높이를 받아옵니다.			
			alert(temp);
		});

		/* 이미지가 여러개인 경우 일일이 id를 통해 제어하는 것은 비효율적이기에 아래처럼 img 태그인 것들을 전체로 타겟으로 한다.
		$("#test").click(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
			$("#test").css("height",500) //id가 test인 것의 높이를 받아옵니다.			
		})
		*/
		$("img").click(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
			$(this).css("height",500) // this=클릭된 img태그의 문서개게를 			
		})
			
			
		$(":button").click(function(){ //mouseenter : 마우스가 위에 올라가있음을 의미함.
			$("img").css("height","auto") //$("img") : 모든 img태크들을 의미합니다.	//원래크기("auto")로 돌아가게 됩니다.		
		})	
		
	})
</script>

</head>

<body>
	<img id="test" src="http://bit.ly/goback11" />
	<img id="test2" src="http://bit.ly/goback11" />
	<img id="test3" src="http://bit.ly/goback11" />
	<br>
	<img src='/resources/img1.daumcdn.png' />
	
	<input type="button" value="리셋">	
</body>
</html>