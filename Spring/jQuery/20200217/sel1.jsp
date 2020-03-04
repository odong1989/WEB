<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

/* input 태그를 제외한 모든 태그 */
*:not(input) {
	border-style: solid;
	border-color: gray;
	padding: 5px;
	margin: 15px;
}

</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function selectFunc1() {
		resetFunc();
		$("*").css("border-color", "red");
	}
	
	function selectFunc2() {
		resetFunc();
		$("div").css("border-color", "red");
	}
	
	function selectFunc3() {
		resetFunc();
		$("div > ul").css("border-color", "red");
	}
	
	function selectFunc4() {
		resetFunc();
		$("div > ul > li").css("border-color", "red");
	}
	
	function selectFunc5() {
		resetFunc();
		$("div#idtest1").css("border-color", "red");
	}
	
	function selectFunc6() {
		resetFunc();
		$("div#idtest1 > ul").css("border-color", "red");
	}
	
	function selectFunc7() {
		resetFunc();
		$("div#idtest1 > ul > li").css("border-color", "red");
	}
	
	function selectFunc8() {
		resetFunc();
		$("ul").css("border-color", "red");
	}
	
	function selectFunc9() {
		resetFunc();
		$("ul > li").css("border-color", "red");
	}
	
	function selectFunc10() {
		resetFunc();
		$("div li").css("border-color", "red");
	}
	
	function selectFunc11() {
		resetFunc();
		$("div *").css("border-color", "red");
	}
	
	function selectFunc12() {
		resetFunc();
		$("div > ul *").css("border-color", "red");
	}
	
	function selectFunc13() {
		resetFunc();
		$(".clstest").css("border-color", "red");
	}
	
	function resetFunc() {
		$("*").css("border-color", "gray");
	}
</script>
</head>
<body>

<input type="button" value="*" onclick="selectFunc1()"><br>
<input type="button" value="div" onclick="selectFunc2()">
<input type="button" value="div > ul" onclick="selectFunc3()">
<input type="button" value="div > ul > li" onclick="selectFunc4()"><br>
<input type="button" value="div#idtest1" onclick="selectFunc5()">
<input type="button" value="div#idtest1 > ul" onclick="selectFunc6()">
<input type="button" value="div#idtest1 > ul > li" onclick="selectFunc7()"><br>
<input type="button" value="ul" onclick="selectFunc8()">
<input type="button" value="ul > li" onclick="selectFunc9()"><br>
<input type="button" value="div li" onclick="selectFunc10()"><br>
<input type="button" value="div *" onclick="selectFunc11()">
<input type="button" value="div > ul *" onclick="selectFunc12()"><br>
<input type="button" value=".clstest" onclick="selectFunc13()"><br>
<input type="button" value="reset" onclick="resetFunc()"><br>

body

<div id="idtest1">
div#idtest1
	<ul>
	div#idtest1 > ul
		<li>div#idtest1 > ul > li</li>
		<li>div#idtest1 > ul > li</li>
		<li>div#idtest1 > ul > li</li>
		<li>div#idtest1 > ul > li</li>
	</ul>
</div>

<div>
div
	<ul>
	div > ul
		<li>div > ul > li</li>
		<li class="clstest">div > ul > li.clstest</li>
		<li>div > ul > li</li>
		<li class="clstest">div > ul > li.clstest</li>
	</ul>
</div>

</body>
</html>