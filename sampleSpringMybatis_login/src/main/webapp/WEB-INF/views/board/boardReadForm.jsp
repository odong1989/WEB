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

	function boardDelete(board_no){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href = "boardDelete?board_no="+board_no;	
			}
		 /*confirm()함수 : 컨펌받는다의 컨펌 맞음. 휴지통 완전삭제 전에 예/아니오 묻는 것과 같은 이치. 
		      컨펌함수는 true/false 값을 리턴한다. 이를 활용한 조건문이다.*/
	}

	function boardUpdateForm(board_no){
		location.href ="boardUpdateForm?board_no="+board_no;	
	}

</script>
</head>

<body>
	글 제목 : ${board.BOARD_TITLE } <br/>
	글 내용 : ${board.BOARD_CONTENT } <br/>
	글쓴이  : ${board.MEMBER_NM }<br/>
	조회수  : ${board.BOARD_HITS }<br/>
	작성일  : ${board.BOARD_INDATE } <br/>
	
	 
	 <!-- 클릭하면 다운로드 되도록 합니다. -->
	첨부파일 : <c:if test="${board.BOARD_SAVEDFILE !=null}">
				<a href="javascript:fileDownLoad(${board.BOARD_NO})">
				${board.BOARD_ORIGINFILE } </a>
			</c:if>			
			
			
	<!--20.02.11
		 본인의 글이면 수정/삭제 버튼이 노출되도록 한다.
		[?]본인인지 아닌지 어떻게 압니까?
		[!]세션의 id와 글의 	member_id (primary key)가 동일하다면 본인의 글로 인정합니다.
		
		[?]세션의 id는 언제까지 보관됩니까?
		[!]브라우저가 종료되기 전까지 유지됩니다.
		   
		   
		글 읽기 폼으로 이동했을 경우   
		해당 글의  모든 정보를 DB를 통해서 가져오는데 
		글을 작성한 사람의 ID도 가져온다 
		selectBoardOne SQL을 통해서 가져온다.
		아래의 코드처럼 모조리 가져옴을 알 수 있씁니다.

	[?]세션의 정보는 어떻게 압니까?
	[!]${sessionScope.loginId } 라고 하면 세션스코프의가 저장한 계정값을 알 수 있씁니다.
	
		@RequestMapping(value="/memberLogin", method=RequestMethod.POST)
		public String memberLogin(Member member, String remember,HttpSession session, HttpServletResponse response,Model model) {	
			//....이전부분들은 생략...//
				//[스텝2] 동일하다고 판단하면 로그인 처리
				session.setAttribute("loginId", member.getMember_id());//세션에게 로근했다고 판단할 수 있는 정보를 입력해주는 것이 로그인 처리입니다.
				//세션의 로그인id가 있으면 로그인이 되었다/안되었다를 확인합니다.
				logger.info("로그인 프로세스 - 성공함. 세션 설정 session : {}",session.getAttribute("loginId"));
			//...이후 부분들도 생략...//			
	 -->		

	<!-- 로그인 정보를 비교할 값
	${board.MEMBER_ID } 		 리퀘스트 스코프(사용자에게 받는 종류의 스코프/값이 그때 그때 달라요)		
	${sessionScope.loginId }	 세션스코프(값의 유지는 브라우저의 종료여부만이 관건이다.) 		
		이렇게 총 2개입니다.
	-->		
	
	<c:if test="${board.MEMBER_ID==sessionScope.loginId}">
		<input type="button" value="수정" onclick="boardUpdateForm('${board.BOARD_NO}')"> <br/>
		<input type="button" value="삭제" onclick="boardDelete('${board.BOARD_NO}')"> <br/>		
	</c:if>
	<!-- 선생님의 팁 : 추가->삭제->수정 순으로 만드는게 좋아요. 수정은 고려할 사항이 많거든요. -->
			
</body>
</html>