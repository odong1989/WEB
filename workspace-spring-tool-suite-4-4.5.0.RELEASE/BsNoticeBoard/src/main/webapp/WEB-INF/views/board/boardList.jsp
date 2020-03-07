<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		location.href = "boardWriteForm"; 
	}

	function boardReadForm(board_no){
		location.href = "boardReadForm?board_no="+board_no;	
	}

	function paging(page){
		var pagingForm = document.getElementById("pagingForm");
		var currentPage = document.getElementById("currentPage");
		currentPage.value = page;
		pagingForm.submit(); 
	}
</Script>


</head>
<body>
<h1>[글 목록]</h1>
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
	 <a href="javascript:paging('${navi.currentPage - navi.pagePerGroup} ')">◁◁</a> <!-- 1그룹만큼 앞으로 갑니다. -->
	 <a href="javascript:paging('${navi.currentPage - 1} ')"> ◀ </a>
	 
	 <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
	 <a href="javascript:paging('${counter } ')"> ${counter }</a>
	 </c:forEach>
	 
	 <a href="javascript:paging('${navi.currentPage + 1} ')"> ▶</a>
	 <a href="javascript:paging('${navi.currentPage + navi.pagePerGroup} ')"> ▷▷</a> <!-- 1그룹만큼 뒤로 갑니다. -->
	 
	 

	  <form action="boardList" method="get" id="pagingForm">
			<input type="hidden" name="currentPage" id="currentPage">
			제목 : <input type="text" name="searchText" id="searchText" value="${searchText}">
		    <input type="button" value="검색" onclick="paging(1)">
	  </form>
		
	
	<input type="button" value="글 등록" onclick="boardWriteForm()">
</body>
</html>