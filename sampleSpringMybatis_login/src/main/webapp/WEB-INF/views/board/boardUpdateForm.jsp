<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function fileDownLoad(board_no){
		location.href = "download?board_no="+board_no;
			//board_no값도 전달하기 위해 ?를 활용 쿼리스트링
		//다운로드라는 요청을 보내는데,이때 board_no값을 보냅니다. (#컨트롤러가 수신함.)
	}
</script>
</head>
<body>
<h1>[ 글수정폼 ]</h1>
<!-- 기존의 정보(model을 통해 갖고 온 값)를 보여줄 수 있도록  
value="${board.BOARD_TITLE}"
${board.BOARD_CONTENT }


-->
<form action="boardUpdate" method="post" enctype="multipart/form-data">
	글 제목    : <input type="text" name ="board_title" value="${board.BOARD_TITLE}"> <br/>
	글 내용    : <textarea name = "board_content">${board.BOARD_CONTENT } </textarea> <br/>
	조회수     : ${board.BOARD_HITS} <br/> 
	등록일     : ${board.BOARD_INDATE} <br/> 
	첨부파일  : <input type="file" name = "upload"> <br/>
	 <!-- 클릭하면 다운로드 되도록 합니다. -->
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				<a href="javascript:fileDownLoad(${board.BOARD_NO})">
				${board.BOARD_ORIGINFILE } </a>
			</c:if>		
	
	
	<!-- 글번호  value="${board_no.BOARD_NO}"가 있어야 SQL은 어떤 글을삭제할지정할수 있다.-->
	<input type="hidden" name="board_no" value="${board.BOARD_NO}">	
	<input type="submit" value="글 수정">

</form>



</body>
</html>