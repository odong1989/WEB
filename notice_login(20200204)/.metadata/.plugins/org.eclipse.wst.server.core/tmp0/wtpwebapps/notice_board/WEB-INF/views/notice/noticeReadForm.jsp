<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function download(notice_no){
	location.href="download?notice_no="+notice_no;
}
function noticeUpdateForm(notice_no){
	location.href="noticeUpdateForm?notice_no="+notice_no;
} 
</script>

</head>
<body>
<h1>[게시글 읽기(noticeReadForm)]</h1>
글번호 : ${notice.notice_no }<br/>
글제목 : ${notice.notice_title }<br/>
작성자 : ${notice.notice_name }<br/> 
조회수 :  ${notice.notice_hits }<br/>
글내용 :  ${notice.notice_context }<br/>
작성일 :  ${notice.notice_indate }<br/>
첨부파일 : 
<!-- 첨부파일 확인은 코어 태그 필요합니다. -->
<c:if test="${notice.notice_originfile != null }">
<!-- 다운로드를 위해서는 업로된 파일을 구분하기 위해 PK로 ${notice.notice_no }를 활용합니다.-->
	<a href="javascript:download('${notice.notice_no }')">${notice.notice_originfile }</a>
</c:if>
<br/>

<a href="javascript:noticeUpdateForm('${notice.notice_no }')">수정하기</a>



</body>
</html>