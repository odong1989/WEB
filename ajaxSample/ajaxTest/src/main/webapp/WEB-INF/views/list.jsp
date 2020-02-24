<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 
		ArrayList<TestVO> list = new ArrayList<TestVO>();
		list.add(new TestVO("aaa","111"));
		list.add(new TestVO("bbb","222"));
		list.add(new TestVO("ccc","333"));
		list.add(new TestVO("ddd","444"));
		list.add(new TestVO("eee","555"));

 -->

<script>
	//바디&테이블 태그가 먼저 생성되면 이제 제이쿼리가 실시됩니다.
	$(function() {
 		$.ajax({
 	 		url  : "test5",
 	 		type : "post",
	 		dataType : "json",
	 		success : function(result){
				$(result).each(function(index, item){
					var temp= "<tr>";
					temp += "<td>" +item.id +"</td>";
					temp += "<td>" +item.name +"</td>";
					temp += "</tr>";
					$("table").append(temp);
				});
		 	},
		 	error : function(){alert("error!!!");}
 	 	});
 	 });
</script>
</head>
<body>
	<!-- 먼저 바디쪽 테이블이 먼저 구성&출력됩니다. -->
	<div>
		<table border="1">
			<tr>
				<td>ID</td>
				<td>NAME</td>
			</tr>
		</table>
	</div>
</body>
</html>
