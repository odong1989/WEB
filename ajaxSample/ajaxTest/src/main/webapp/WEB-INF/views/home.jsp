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
				
						});	

					},//result : 매개변수이며 arrayList를 보관한다.
				error   : function(){alert("실패");}
			});
 	 	});


		//[방법6]
		//방법5는 arraylist를 바로 출력, 
		//방법6은 arraylist를 해시맵에 담은 후에 이를 꺼내서 출력.
 		$("#btn6").click(function(){
			$.ajax({
				url  : "test6",	//서버에 보내는 요청주소
				type : "post",	//get써도 상관없다.
				dataType : "json", 
				success : function(result){//result : 해시맵map을 받고 이를 제이슨 방식으로 변경하여 저장한 것.
					console.log(result);
					$(result.list).each(function(index,item){   //$(result.list) : jQuery문서 객체로 선언.
						var temp ="<tr>";
						temp += "<td>" + item.id +"</td>";
						temp += "<td>" + item.name +"</td>";
						temp += "</tr>"						
						$("table").append(temp);

						});	//step1.문서객체로 변환시켜줍니다.

					},//result : 매개변수이며 arrayList를 보관한다.
				error   : function(){alert("실패");}
			});
 	 	});

		//[방법7]
 		$("#btn7").click(function(){
			var form = $("#test4")[0]; //JS로 치면 var form = document.getElementById("test4");과 같다.(#JS로 해도 상관없음)
			console.log("form : "+form);
			var formdata = new FormData(form); //FormData()는 JS의 var객체만 받을 수 있어요

			$.ajax({
				url  : "test7",	//서버에 보내는 요청주소
				type : "post",	//get써도 상관없다. //dataType는 전송받는게 없기에 데이터타입은 적지 않는다.고 하심.
				data : formdata,
				contentType : false, //<form>의 enctype="multi-part"와 같은 효과를 낸다.(#form에서 파일전송하는데 enctype없다면 여기서 처리한거.)
				processData : false, //이 예제에서는 파일자체를 그대로 올리기 때문에 false로 선택하여 파일자체가 올라가도록 합니다.(true시 예전처럼 파일명만 가져옴)
				success : function(){alert("test7 success");},
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
		<input type="file" name="uploadFile">
	</form>
	
	<input type="button" id="btn1" value="전송1"><br>
	<input type="button" id="btn2" value="전송2"><br>
	<input type="button" id="btn3" value="전송3"><br>
	<input type="button" id="btn4" value="전송4"><br>
	<input type="button" id="btn5" value="전송5"><br>
	
	<input type="button" id="btn6" value="전송6"><br>	
	<input type="button" id="btn7" value="전송7"><br>		
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
