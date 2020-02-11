<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SQL에서 가져온 글 목록들을list들을 깔끔하게 나오도록 해봅시다!  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.trhover:hover{background-color:#EEEEEE;}
a:link{text-decoration:none; color:black;}
a:visited{text-decoration:none; color:black;}
a:hover{text-decoration:none; color:blue;}
</style>
<Script type="text/javascript">
	function boardWriteForm(){
		location.href = "boardWriteForm"; //가야할 링크를 설정합니다.
		//location.href = "/board/boardWriteForm"; //경로를 이렇게 적어도 무방합니다.
		//[주의]	location.href = "/boardWriteForm"; 이건 안된다. 완전생뚱경로임. 
	}

	function boardReadForm(board_no){
	//쿼리스트링 방식 숙지필요!!!
		location.href = "boardReadForm?board_no="+board_no;	
	}

	function paging(page){
	//현재페이지의 값이 필요합니다. 그래서 파라미터로 page받는다.
		var pagingForm = document.getElementById("pagingForm");
		var currentPage = document.getElementById("currentPage");
		currentPage.value = page;
		pagingForm.submit(); //하단의 히든 폼을 통해 전달
	}
</Script>


</head>
<body>
<h1>[글 목록]</h1>
<!-- ${list } //우선 글이 정상적으로 나오는지 사전체크용.  prefix="c"를 사용하지 않아도 바로 출력이 가능합니다.-->	

<!-- sql문이 join처리되어야 비로소 제대로 정갈하게 나올수 있어요. -->
<table>
	<tr>
		<th>글번호	</th>
		<th>제목	</th>
		<th>글쓴이	</th>
		<th>조회수	</th>		
		<th>등록일	</th>
	</tr>
	

	<tr>
		<c:forEach items="${list }" var="item" varStatus="status">
			<tr class="trhover">
				<td>${(totalCount - status.index) - (navi.currentPage - 1) * navi.countPerPage}</td> <!-- 정수환반장의 글번호 카운트노하우2 -->
				<td>
				<a href="javascript:boardReadForm('${item.BOARD_NO}')">
						${item.BOARD_TITLE }</a></td>
				<td>${item.MEMBER_NM }</td>
				<td>${item.BOARD_HITS }</td>
				<td>${item.BOARD_INDATE }</td>
			</tr>
		</c:forEach>
	</tr>
</table>

	<br/>
	
	<!-- 20.02.10 2교시 페이징 처리 -->
	 <!-- 페이지를 위한 버튼을 그립시다 
	  ◁◁ ◀ 1 2 3 4 5  ▶  ▷▷
	 식으로 출력되도록 만듭시다. 각 페이지당 5개의 글이 배치되는 형태이죠. -->

	<!-- <a href="">태그를 통해 이동하게 되는데
		boardList에게 전달값인 currentPage값을 활용하여야 한다.
		javascript함수를 호출하는 javascript:를 활용합니다. -->

	 <a href="javascript:paging('${navi.currentPage - navi.pagePerGroup} ')">◁◁</a> <!-- 1그룹만큼 앞으로 갑니다. -->
	 <a href="javascript:paging('${navi.currentPage - 1} ')"> ◀ </a>
	 
	 <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
	 <a href="javascript:paging('${counter } ')"> ${counter }</a>
	 </c:forEach>
	 
	 <a href="javascript:paging('${navi.currentPage + 1} ')"> ▶</a>
	 <a href="javascript:paging('${navi.currentPage + navi.pagePerGroup} ')"> ▷▷</a> <!-- 1그룹만큼 뒤로 갑니다. -->
	 
	 

	 <!-- 20.02.10 3교시 페이징 또는 검색 요청시 전달할 폼-->
	 <!-- id가 있어야 자바스크립트에서 값을 넣을수 있습니다. -->	 
	  <form action="boardList" method="get" id="pagingForm">
			<input type="hidden" name="currentPage" id="currentPage">
	 <!-- 20.02.10 3교시 검색 처리도 겸사넣음  -->
			제목 : <input type="text" name="searchText" id="searchText" value="${searchText}">
				  <input type="button" value="검색" onclick="paging(1)">
	  </form>
		
	
	<input type="button" value="글 등록" onclick="boardWriteForm()">
</body>
</html>