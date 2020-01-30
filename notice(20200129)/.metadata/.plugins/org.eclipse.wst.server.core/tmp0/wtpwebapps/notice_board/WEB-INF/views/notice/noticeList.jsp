<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function noticeReadForm(notice_no){
	location.href = "/notice/noticeReadForm?notice_no="+notice_no;
	//쿼리스트링을 쓰기위해 ? 사용, = 을 뺴먹으면 전달이 안됩니다... ㅜ.ㅜ
}

</script>


</head>

<body>
<h1>[게시글 목록] zzzzzzzz</h1>
<table>
	<tr>
		<th>글번호 </th>
		<th>제목 </th>
		<th>작성자 </th>
		<th>조회수 </th>
		<th>작성일 </th>
	</tr>
	<c:forEach items="${list }" var="notice">
	<tr>
		<td>${notice.notice_no }</td>
		<td><a href="javascript:noticeReadForm('${notice.notice_no }')">${notice.notice_title }</a></td>	
		<td>${notice.notice_name }</td>
		<td>${notice.notice_hits }</td>	
		<td>${notice.notice_indate }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>