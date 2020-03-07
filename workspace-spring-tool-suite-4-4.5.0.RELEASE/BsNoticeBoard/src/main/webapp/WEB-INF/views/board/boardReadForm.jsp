<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 첨부파일을 조건부처리 하기 위해 사용합니다. -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글읽기(boardReadForm)</title>
	<link rel="stylesheet" href="/resources/css/styleSetting.css">	
	<script src="<c:url value='/resources/js/jquery-3.4.1.js' /> "> </script>
	<script>
	function fileDownLoad(board_no){
		location.href = "download?board_no="+board_no;
	}

	function boardDelete(board_no){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "boardDelete?board_no="+board_no;	
			}
	}

	function boardUpdateForm(board_no){
		location.href ="boardUpdateForm?board_no="+board_no;	
	}

	function replyDelete(reply_no,board_no){
		if(confirm("정말 삭제하시겠습니까?")){		
		location.href ="replyDelete?reply_no="+reply_no+"&board_no="+board_no;
		}
	}
	function replyUpdateForm(reply_no, board_no, reply_content){
		console.log("reply_no :" + reply_no, 
					"board_no :" + board_no,
					"reply_content :" + reply_content); 

		//스텝1. 리플번호를 받습니다.
		var updateForm = document.getElementById("updateForm"+reply_no);

		//id는 복붙이 낫다. 어제 에러이유보니 updateForm이 아니라 UpdateForm이라서 대문자하나달라서 인식못했음...
		console.log(updateForm); 
		//온 클릭하면 실행할 폼내용을 넣습니다
		var str = ''; 
		    str += '<form action="replyUpdate" method="post">';								//console.log(str); 
			str += '<input type="hidden" name="reply_no" value="'+reply_no+'">';			//console.log(str);//20.2.13 추가/해당 리플만 삭제위해 필요
			str += '<input type="hidden" name="board_no" value="'+board_no+'">';			//console.log(str);//20.2.13추가/삭제후 본 페이지로 리턴위해 필요/
			str += '<input type="text" name="reply_content" value="'+reply_content+'">';	//console.log(str);
			str += '<input type="submit", value="수정">';										//console.log(str);
			str += '<input type="button", value="취소", onclick="updateCancel(\''+reply_no+'\')">';
			str += '</form>';																//console.log(str);
			updateForm.innerHTML = str;

	}


	function updateCancel(reply_no){
	var updateForm = document.getElementById("updateForm"+reply_no);
	if(confirm("리플 수정을 취소합니까?")){		
		updateForm.innerHTML = '';	
		}

	}
	
</script>
</head>

<body>
<div class="boardOneRead">
	글 제목 : ${board.BOARD_TITLE } <br/>
	글 내용 : ${board.BOARD_CONTENT } <br/>
	글쓴이  : ${board.MEMBER_NM }<br/>
	조회수  : ${board.BOARD_HITS }<br/>
	작성일  : ${board.BOARD_INDATE } <br/>
	
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				<a href="javascript:fileDownLoad(${board.BOARD_NO})">
				${board.BOARD_ORIGINFILE } </a>
			</c:if>			

	
	<c:if test="${board.MEMBER_ID==sessionScope.loginId}">
		<input type="button" value="수정" onclick="boardUpdateForm('${board.BOARD_NO}')"> <br/>
		<input type="button" value="삭제" onclick="boardDelete('${board.BOARD_NO}')"> <br/>		
	</c:if>
	<br/>		
</div>

<div class="boardReplyTable">			
	<form action="replyInsert" method="post" >
		<input type="hidden" name="board_no" value="${board.BOARD_NO }">
		<input type="text" name="reply_content" placeholder="댓글을 달아 주세요!!">
		<input type="submit" value="저장">
	</form>		
	<div class="boardReplyTable">
	<table>
			<tr>
				<td>리플번호</td>
				<td>작성자</td>
				<td>리플내용</td>
				<td>작성일</td>
			</tr>
		<c:forEach items="${replyList}" var="reply">
			<tr>
				<td>${reply.reply_no }</td>
				<td>${reply.member_id }</td>
				<td>${reply.reply_content }</td>
				<td>${reply.reply_indate }</td>
					<!-- 아래의 JSTL 조건문은 리플도 자신이 작성한 것만 삭제버튼이 가능토록 숨김설정 함. -->
				<td>
					<c:if test="${reply.member_id == sessionScope.loginId }">
					
						<input type="button", value="수정", onclick="replyUpdateForm('${reply.reply_no}','${reply.board_no}','${reply.reply_content}')">
					</c:if>
				</td>
				<td>
					<c:if test="${reply.member_id == sessionScope.loginId }">
						<input type="button", value="삭제", onclick="replyDelete('${reply.reply_no}','${reply.board_no}')">
					</c:if>	
				</td>
			</tr>	
			<tr>
				<td id="updateForm${reply.reply_no}" colspan="6">
				</td>
			</tr>	
		</c:forEach>
	</table>		
	</div>
</div>
</body>
</html>