<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(function() {
 		$("#btn1").click(function(){
			$.ajax({
				//오브젝트 데이터 타입으로 넣습니다.
				// 키값 : 밸류값;
				//url,type,data,success,error 는 자바스크립트에서 미리 정의된 오브젝트 데이터 타입들이다.
				url  : "test1",	//서버에 보내는 요청주소
				type : "get",	//데이터전송방식(#get? #post? 양자택일)
					//id라는 키값으로 id가 userid인 녀석의 값
				data : {"userid" : $("#userid").val(), 
						"username" : $("#username").val() },
				success : function(){alert("성공");},
				error   : function(){alert("실패");}
			});
 	 	});
 	 	
 		$("#btn2").click(function(){
			$.ajax({
				//오브젝트 데이터 타입으로 넣습니다.
				// 키값 : 밸류값;
				//url,type,data,success,error 는 자바스크립트에서 미리 정의된 오브젝트 데이터 타입들이다.
				url  : "test2",	//서버에 보내는 요청주소
				type : "get",	//데이터전송방식(#get? #post? 양자택일)
					//id라는 키값으로 id가 userid인 녀석의 값
				data : {"id" : $("#userid").val(), 
						"name" : $("#username").val() },
				//testVO의 변수명 일치를 위해 "id", "name"
				success : function(){alert("성공");},
				error   : function(){alert("실패");}
			});
 	 	});

		//[방법3] json을 활용하여 전송 		
 		$("#btn3").click(function(){
			$.ajax({
				url  : "test3",	//서버에 보내는 요청주소
				type : "post",	//데이터전송방식(json은 무조건 post!)
				contentType : "application/json; charset=utf-8",
				//contentType : 서버에 전송하는 데이터 타입을 정의함.
				//방법1,2 같은 경우에는 자바가 알아서 처리하지만
				//json경우 무조건 contentType를 정의해야한 전송되고 글자가 깨지지 않음.
				data : JSON.stringify({"id" : $("#userid").val(), 
					"name" : $("#username").val() }),
					//id라는 키값으로 id가 userid인 녀석의 값
				//data : JSON.stringify({})는 json형으로 형변환을 시켜줍니다. 
				//testVO의 변수명 일치를 위해 "id", "name"
				success : function(){alert("성공");},
				error   : function(){alert("실패");}
			});
 	 	});

		//[방법4] form 활용하여 전송 		
 		$("#btn4").click(function(){
			$.ajax({
				url  : "test4",	//서버에 보내는 요청주소
				type : "post",	//get써도 상관없다.
				data : $("#test4").serialize(),
				//$("#test4") : 폼 태그를 문서 객체로 가져오다.
				success : function(){alert("성공");},
				error   : function(){alert("실패");}
			});
 	 	});

		//[방법5] 서버로부터 json 파일을 받아서 웹페이지에 출력	
		//JSTL forEach대신에 출력할 수 있는 방법입니다!!!
 		$("#btn5").click(function(){
			$.ajax({
				url  : "test5",	//서버에 보내는 요청주소
				type : "post",	//get써도 상관없다.
				dataType : "json", 
				success : function(result){
					console.log(result);
						$(result).each(function(index,item){
							$("table").append("<tr><td>"+item.id+"</td><td>"+item.name+"</td></tr>");
						});	//step1.문서객체로 변환시켜줍니다.

					},//result : 매개변수이며 arrayList를 보관한다.
				error   : function(){alert("실패");}
			});
 	 	});

		
});	
</script>
</head>
<body>
		<!-- div는  $("#test4").serialize, 방식이 안되네. -->
	<form id="test4">
		ID : <input type="text" id="userid" name="id"><br>
		NAME : <input type="text" id="username" name="name"><br>
	</form>
	
	<input type="button" id="btn1" value="전송1"><br>
	<input type="button" id="btn2" value="전송2"><br>
	<input type="button" id="btn3" value="전송3"><br>
	<input type="button" id="btn4" value="전송4"><br>
	<input type="button" id="btn5" value="전송5"><br>
	
	<div>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>NAME</th>
			</tr>
		</table>
	</div>
</body>
</html>
