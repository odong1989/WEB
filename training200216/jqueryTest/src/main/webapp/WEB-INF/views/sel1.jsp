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
	//jquery 코드 작성
	function selectFunc1(){
		resetFunc();
		$("*").css("border-color","red");
	}	
	function selectFunc2(){
		resetFunc();
		$("div#idtest").css("border-color","red");
	}	
	function selectFunc3(){
		resetFunc();
		$("div > ul").css("border-color","red");
		//div태그인데 자식으로 ul태그인 것.
	}	
	function selectFunc4(){
		resetFunc();
		$("div > ul > li").css("border-color","red");
	}	
	function selectFunc5(){
		resetFunc();
		$("div li").css("border-color","red");
	}	
	function selectFunc6(){
		resetFunc();
		$(".clstest").css("border-color","red");
	}	
	function selectFunc7(){
		resetFunc();
		$("div * ").css("border-color","red");
		//div 밑에 있는 모든 태그들을 설정
	}	
	
	function resetFunc(){
		$("*").css("border-color","gray");
	}		

</script>

	<!-- 모든 선택자를 지정합니다. -->
<style>
	* { 
		border-style :solid;
		border-color : gray;
		padding : 5px;
		margin : 15px;
	}
</style>

</head>
<body>

<!-- <h1 id="abc"> 테스트</h1> -->	

<input type="button" value="*" onclick="selectFunc1()"><br>
<input type="button" value="div#idtest" onclick="selectFunc2()"><br>
<input type="button" value="div > ul" onclick="selectFunc3()"><br>
<input type="button" value="div > ul > li" onclick="selectFunc4()"><br>
<input type="button" value="div li" onclick="selectFunc5()"><br>
<input type="button" value=".clstest" onclick="selectFunc6()"><br>
<input type="button" value="div * " onclick="selectFunc7()"><br>
<input type="button" value="reset" onclick="resetFunc()"><br>

	body
	<div id="idtest" >
		div#idtest<!-- 의미 : "div 속성이며 id(#)는 idtest이다" -->
		
		<ul>
			div#idtest > ul
			<li>div#idtest > ul > li</li>
			<li class="clstest"> div#idtest > ul > li > li.clstest </li>
			<li>div#idtest > ul > li</li>
			<li class="clstest"> div#idtest > ul > li > li.clstest </li>
		</ul>
		<!-- 일부러 짝수 홀수 끼리 똑같게 하였다.-->
	</div>

</body>
</html>