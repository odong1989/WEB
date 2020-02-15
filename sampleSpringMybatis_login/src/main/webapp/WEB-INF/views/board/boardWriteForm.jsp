<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>[ 글등록폼(boardWriteForm) ]</h1>
<!-- 글등록시 사용자에게 받을 것은 
필수는 1)글 제목 2)글내용
위의 2개뿐입니다. (보드넘버등은 자체적으로 내부처리이니까)

이외부속으로는 첨부파일 정도죠(#옵션)

	/*
 create table board(
	board_no			number					primary key
	,member_id			varchar2(50)			not null --글을 쓴 사람이 누구인지 알기위해서 왜래키로 적용하고자 한다.(외래키 설정은 아래서 설정)--
	,board_title		varchar2(200)			not null
	,board_content		carchar2(2000)			not null
	,board_hits			number					default 0
	,board_savedfile	varchar2(200)
	,board_originfile	varchar2(200)
	,board_indate		date					default sysdate 
	
	*/
 -->

<form action="boardWrite" method="post" enctype="multipart/form-data">
	글 제목    : <input type="text" name ="board_title" > <br/>
	글 내용    : <input type="text" name = "board_content"> <br/>
	첨부파일  : <input type="file" name = "upload"> <br/>
	<input type="submit" value="글 등록">
</form>


</body>
</html>