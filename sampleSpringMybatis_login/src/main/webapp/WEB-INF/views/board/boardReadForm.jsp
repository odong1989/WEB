<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 첨부파일을 조건부처리 하기 위해 사용합니다. -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기(boardReadForm)</title>
<script type="text/javascript">
	function fileDownLoad(board_no){
		location.href = "download?board_no="+board_no;
			//board_no값도 전달하기 위해 ?를 활용 쿼리스트링
		//다운로드라는 요청을 보내는데,이때 board_no값을 보냅니다. (#컨트롤러가 수신함.)
	}
</script>
</head>

<body>
	글 제목 : ${board.BOARD_TITLE } <br/>
	글 내용 : ${board.BOARD_CONTENT } <br/>
	글쓴이  : ${board.MEMBER_NM }<br/>
	조회수  : ${board.BOARD_HITS }<br/>
	작성일  : ${board.BOARD_INDATE } <br/>
	
	<!-- 
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				${board.BOARD_ORIGINFILE } 
			</c:if>
	 -->		
	 
	 <!-- 클릭하면 다운로드 되도록 합니다. -->
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				<a href="javascript:fileDownLoad(${board.BOARD_NO})">
				${board.BOARD_ORIGINFILE } </a>
			</c:if>			
			
</body>
</html>