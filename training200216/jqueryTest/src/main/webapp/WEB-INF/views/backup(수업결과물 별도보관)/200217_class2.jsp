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
//순서가 맞지 않는다고 하시면서 이렇게 빼셨다.(#로딩되어 있지 않다고 표현하심.)
//간단히 말하자면 보자기 속에 싸여 있는 것과 같기에 내용을 모르는 상태이므로 프로그랜은 정의가 안되었다 라고 콘솔에 에러를 리턴하였다.
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



//작성방법3
$(function() {
	//jquery 코드 작성	
//	var abcDoc = document.getElementById("abc");//자바스크립트 경우
//	$("#abc").css("color","red"); //jquery 경우(CSS처럼 $을 활용함. / CSS와 방식이 동일하다고도 생각해도 무방하다!)
	/*자바스크립트와 제이쿼리의 차이점
	공통점 : 작업할 태크를 지정한다.이때 id를 통하여 지정한다는 것이 공통점!
	차이점 : 자바스크립트 경우 
  	      document.getElementById("id명")를 활용하여 id를 갖고옴.

  	               반면 jqery경우 
  	       $("id명")으로 갖고오는 방법이 심플하다!
      
          1) . : class 선택자
	      2) > : 자식 선택자(#특정 태그 바로 밑에 있는 태그.)
	      3) $ : 자손 선택자(#특정 태그 밑에 소속된 태그(#바로밑은 아니지만 결국은 밑의소속임.))
	*/ 
});

/*	제이쿼리의 작성방법은 3가지 방법이 있습니다(#결과는 똑같습니다.)
         선생님은  작성방법3을 활용하여 수업진행합니다.
         
 	//작성방법1
	window.onload = function{
		//jquery 코드 작성 
	}

	//작성방법2
	$(document).ready(function (){
		//jquery 코드 작성 
	});

	//작성방법3
	$(function() {
		//jquery 코드 작성 
	});

[팁] 아래의 단축키를 활용하면 여러줄을 동시에 같은 내용 기입이 가능하다고 합니다. 
ctrl + /
ctrl +shift + c

*/	
	
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