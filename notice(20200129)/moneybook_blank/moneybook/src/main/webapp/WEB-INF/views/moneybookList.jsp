<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>todoList</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/moneybook.css"/>" />
<script src='<c:url value="/js/jquery-3.4.1.js" />'></script>
<script>
	
</script>
</head>
<body>
<div id="wrap">
	<div>
		<div class="menu">
			<form>
				<table>
					<tr>
						<td class="center">
							<select>
								<option value="수입" selected="selected">수입</option>
								<option value="지출">지출</option>
							</select>
							<input type="date">
						</td>
					</tr>
					<tr>
						<th class="center">메모</th>
						<th class="center">금액</th>
					</tr>
					<tr>
						<td class="center">
							<input type="text" placeholder="내용 입력"><br>
						</td>
						<td class="center">
							<input type="text" placeholder="금액 입력"><br>
						</td>
						<td>
							<input type="button" value="등록">
						</td>
						<td>
							<input type="button" value="삭제">
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div> <!-- input form end -->
	<hr>
	<div> <!-- print form -->
		<table id="printTable">
			<tr>
				<th>메모</th>
				<th>금액</th>
				<th></th>
			</tr>
		</table>
		
	</div>
</div>
</body>
</html>
