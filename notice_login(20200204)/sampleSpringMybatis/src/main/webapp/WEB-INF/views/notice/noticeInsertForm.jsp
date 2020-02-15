<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1>noticeInsertForm (게시글 등록폼)</H1>

<!-- 
	private int notice_no;
	private String notice_title;   [폼 입력]
	private String notice_context; [폼 입력
	private String notice_name; 	[폼
	
	private int notice_hits;
	private String notice_indate;
	private String notice_savedfile;
	private String notice_originfile;
 -->
			
<form action="/notice/noticeInsert" method="POST" enctype="multipart/form-data"><!-- enctype의 multipart/form-data는 파일업로드시 사용합니다.(스프링 책 495페이지 참고)-->
							<!-- 파일을 multipart형태로 바꾸어 자바도 multipart형태의 파일을 받습니다  -->
	제목 : <input type="text" name="notice_title"> <br/>
	내용 : <textarea name= "notice_context"></textarea><br/>
	작성자 : <input type="text" name="notice_name"> <br/>

	<!-- 첨부파일은 VO로 받게 하기보다는 따로 하기에 이름을 똑같이 하지 않아도 됩니다. -->
	첨부파일 : <input type="file" name="upload"><br/>
	<input type="submit" value="등록">
	<!-- 유효성 검사는 생략되었는데 이건 수업 시간상 문제로 생략인거지 시험이든 실무든 작성해야 합니다 -->
	
</form>
</body>
</html>