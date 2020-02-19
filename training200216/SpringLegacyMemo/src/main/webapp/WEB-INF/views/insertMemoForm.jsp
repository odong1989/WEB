<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[메모장]</title>
</head>
<body>
	<div class="wrap">
		<h1>[나만의 메모장]</h1>
		<form action="/insertMemo" method="post" onsubmit="return formCheck();">
			<table class="table">
				<tr>
					<td>내용</td>
					<td>
						<input type="text" name="memo_content" id="memo_content">
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="memo_pw" id="memo_pw">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록">
					</td>
				</tr>
			</table>
		
		</form>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>