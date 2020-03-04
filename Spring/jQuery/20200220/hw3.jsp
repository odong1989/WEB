<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	var data ='<tr>' 
		data += '<td><input type="text" /></td>'
		data += '<td><input type="text" /></td>'
		data += '<td><input type="date" /></td>'
		data += '<td>'
		data += '<input class="add" type="button" value="+" />'
		data += '<input class="delete" type="button" value="-" />'
		data += '</td>'
		data += '</tr>'
	
	$(function(){
		$('table').on('click', 'input[value="+"]', function(){
			$('table').append(data);
		});
		$('table').on('click', 'input[value="-"]', function(){
			$(this).parent().parent().remove();
		}); 
	});
</script>

</head>
<body>
<h2>[ 자격증 정보 관리 ]</h2>

<table border="1">
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