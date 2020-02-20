<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- 힌트 최초 추가 이후 추가커맨드 안되는 것
	방법1 : on(,,) on을 파라미터3개 받게하여 사용
	방법2 : input type="button" onclick=""
 -->
<script>
	$(function(){
		$(".add").click(function(){
			var tableData = $("#certificateTable");
			alert("tableData : "+tableData);

			var newline ="<tr><td><input type=\"text\" \/></td>"
						    +"<td><input type=\"text\" \/></td>"
							+"<td><input type=\"date\" \/></td>"
			    			+"<td><input class=\"add\" type=\"button\" value=\"+\" \/>"
			    			    +"<input class=\"del\"type=\"button\" value=\"-\" \/></td></tr>";

			tableData.html(function(index,oldData){
				return oldData+newline;
			})
		});
	});
</script>

</head>
<body>
<h2>[ 자격증 정보 관리 ]</h2>

<table border="1" id="certificateTable" >
	<tr>
		<th>자격증 명</th>
		<th>시행처</th>
		<th>취득 날짜</th>
		<th></th>
	</tr>
	<tr>
		<td><input type="text" /></td>
		<td><input type="text" /></td>
		<td><input type="date" /></td>
		<td>
			<input class="add" type="button" value="+" />
		</td>
	</tr>
</table>
</body>
</html>