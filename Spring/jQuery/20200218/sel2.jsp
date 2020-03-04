<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
		$("#sel1").click(function() {
			resetBGC();
			$("a[href]").css("background-color", "pink");
		});
		
		$("#sel2").click(function() {
			resetBGC();
			$("a[href='https://www.naver.com']").css("background-color", "pink");
		});

		$("#sel3").click(function() {
			resetBGC();
			$("a[href$='.com']").css("background-color", "pink");
		});

		$("#sel4").click(function() {
			resetBGC();
			$("a[href*='goo']").css("background-color", "pink");
		});

		$("#sel5").click(function() {
			resetBGC();
			$("a[href^='https']").css("background-color", "pink");
		});

		$("#sel6").click(function() {
			resetBGC();
			$("a[name~='test']").css("background-color", "pink");
		});

		$("#sel7").click(function() {
			resetBGC();
			$("a[name|='test']").css("background-color", "pink");
		});

		function resetBGC() {
			$("a").css("background-color", "");
		}
	});

</script>
</head>
<body>
	<h2 id="sel1">a[href] : a 태그이면서 href 속성을 갖는 것</h2>
	<h2 id="sel2">a[href='https://www.naver.com'] : a 태그이면서 href 속성이 https://www.naver.com 인 것</h2>
	<h2 id="sel3">a[href$='.com'] : a 태그이면서 href 속성이 .com 으로 끝나는 것</h2>
	<h2 id="sel4">a[href*='goo'] : a 태그이면서 href 속성이 goo 를 포함하는 것</h2>
	<h2 id="sel5">a[href^='https'] : a 태그이면서 href 속성이 https 로 시작하는 것</h2>
	<h2 id="sel6">a[name~='test'] : a 태그이면서 name 속성이 test 로 시작하는 것(공백 포함)</h2>
	<h2 id="sel7">a[name|='test'] : a 태그이면서 name 속성이 test 로 시작하는 것(하이픈 포함)</h2>
	
	<a href="https://www.naver.com" name="test-name">https://www.naver.com (name="test-name")</a><br>
	<a href="http://www.google.com" name="test name">http://www.google.com (name="test name")</a><br>
	<a href="http://www.wikipedia.org" name="test">http://wikipedia.org (name="test")</a><br>
	
</body>
</html>
