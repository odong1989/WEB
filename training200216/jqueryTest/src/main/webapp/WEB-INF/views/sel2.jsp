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
		//	<h2 id="sel1">a[href] : a 태그이면서 href 속성을 갖는 것</h2> 에 대한 이벤트 걸기 시작
		$("#sel1").click(function(){
			resetBGC();
			$("a[href]").css("background-color","pink");
		//	$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel1 이라고 생각하면 됩니다.
		});    


		$("#sel2").click(function(){
			resetBGC();
			$("a[href='https://www.naver.com']").css("background-color","pink");
			$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel2 이라고 생각하면 됩니다.
		});    


		$("#sel3").click(function(){
			resetBGC();
			$("a[href$='.com']").css("background-color","pink");
			$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel3 이라고 생각하면 됩니다.
		});  

		$("#sel4").click(function(){
			resetBGC();
			$("a[href*='goo']").css("background-color","pink");
			$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel4 이라고 생각하면 됩니다.
		});  

		$("#sel5").click(function(){
			resetBGC();
			$("a[href^='https']").css("background-color","pink");
			$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel5 이라고 생각하면 됩니다.
		});  

		$("#sel6").click(function(){
			resetBGC();
			$("a[name~='test']").css("background-color","pink");
			$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel6 이라고 생각하면 됩니다.
		});  

		$("#sel7").click(function(){
			resetBGC();
			$("a[name|='test']").css("background-color","pink");
			$("#this").css("background-color","pink"); //[수환씨 팁] 뭘 클릭했는지 알수 있어요!
			//id가 this = sel7 이라고 생각하면 됩니다.
		});  

		
		function resetBGC(){
			$("a, h2").css("background-color","");
		}		
	})
</script>
</head>
<body>
	<h2 id="sel1">a[href] : a 태그이면서 href 속성을 갖는 것</h2>
	<h2 id="sel2">a[href='https://www.naver.com'] : a 태그이면서 href 속성이 https://www.naver.com인  것</h2>
	
	<h2 id="sel3">a[href$='.com'] : a 태그이면서 href 속성이 .com으로 끝나는 것.</h2>
	<h2 id="sel4">a[href*='goo'] : a 태그이면서 href 속성이 goo를 포함하는 것</h2>	
	<h2 id="sel5">a[href^='https'] : a 태그이면서 href 속성이 https으로 시작하는 것</h2>
	<h2 id="sel6">a[name~='test'] : a 태그이면서 name 속성이 test로 시작하는 것(공백포함입니다)</h2>	
	<h2 id="sel7">a[name|='test'] : a 태그이면서 name 속성이 test로 시작하는 것(-(하이픈)포함입니다)</h2>
	
     <a href="https://www.naver.com" name="test-name">https://www.naver.com</a>
     <a href="https://www.google.com" name="test name">http://www.google.com</a>
     <a href="https://www.wikipedia.org" name="test">http://www.wikipedia.org</a>
<!-- 
태그[속성$=값]
태그[속성*=값]
위의 2개의 속성선택자는 필수이고 이외의 선택자는 몰라도 그만이다.
 -->
</body>
</html>