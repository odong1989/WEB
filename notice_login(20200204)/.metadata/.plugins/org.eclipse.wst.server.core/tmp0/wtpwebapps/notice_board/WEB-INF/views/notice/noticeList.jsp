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

function movePage(page){
	var pageForm = document.getElementById("pageForm");
	var currentPage = document.getElementById("page");
	currentPage.value = page;
	pageForm.submit();
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
	<!-- list는 현재 모든 게시글이 들어가있는 상태입니다.
		 페이징이 1로 선택되어 있다면 1페이지에 관련된 내용만 보여주고,
		 페이징이 4로 선택되어 있다면 4페이지에 관련된 내용만 보여주도록 하며
		 총 1000개의 페이지가 있는데 이중 10개씩만 화면에 보여주고자 하고자 하는것,
		 이를 통해 필요한 정보만 보여주도록 하고자 하는 것이 페이징의 목표입니다. 
		  -->
	<tr>
		<td>${notice.notice_no }</td>
		<td><a href="javascript:noticeReadForm('${notice.notice_no }')">${notice.notice_title }</a></td>	
		<td>${notice.notice_name }</td>
		<td>${notice.notice_hits }</td>	
		<td>${notice.notice_indate }</td>
	</tr>
</c:forEach>
</table>

<div>
<!-- ◁◁  ◀  1 2 3 4 5 ▶   ▷▷ 
  	 형식으로 페이징 나오도록 합시다. -->

<a href="javascript:movePage('${navi.currentPage - navi.pagePerGroup}')">◁◁</a>
<a href="javascript:movePage('${navi.currentPage - 1}')">◀</a>
<c:forEach var="counter" begin="${navi.startPageGroup }" end="${navi.endPageGroup }">
	<!-- 페이지 이동은 가능한데 현 페이지가 어딘지 알 수 가 없어서 choose를 통해 해당 페이지의 글씨를 진하게 표기 -->
	<c:choose>
		<c:when test="${counter == navi.currentPage }">
			<b><a href="javascript:movePage('${counter }')"> ${counter }</a></b>
		</c:when>
		<c:otherwise>
			<small><a href="javascript:movePage('${counter }')"> ${counter }</a></small>			
		</c:otherwise>
	</c:choose>
</c:forEach>
<a href="javascript:movePage('${navi.currentPage + 1 }')">▶</a>   
<a href="javascript:movePage('${navi.currentPage + navi.pagePerGroup}')">▷▷</a>

<!-- 2020.02.04 검색작성
	1)검색결과는 무조건 1페이지에 나옵니다(#검색결과개수가 무한개여도 최초출력은 무조건 1페이지!)	-->
<form action="noticeList" method="get" id="pageForm">
<!-- 페이징을 위해 만들어 두었떤  function movePage(page)를 활용하고자 한다.
	 즉 페이지전송만 하던 것을 검색어까지 1+1하여 추가 전송을 가능하게 튜닝하는 것이다.
	-->
	<input type="hidden" id="page" name="page">
	제목
	<input type="text"  name="searchText" value="${searchText}">
	<!-- [?] value="${searchText}"는 무슨 용도에요??
	   : NoticeController.java에서  model.addAttribute("searchText", searchText);를 받아옵니다.
	     이는 검색후 1이외의 페이지로 이동하여도 검색결과를 유지할 수 있또록 합니다. -->
	<input type="button" value="검색" onclick="movePage(1)">
	<!-- 검색결과는 어떻게 되든 무조건 1페이지에서부터 출력하니까 파라미터를 1으로 입력하고 자바스크립트를 호출. -->
</form>
</div>

<!-- 페이징을 처리할 수 있도록 해줍니다. -->
<form action ="noticeList" method="get" id="pageForm">
	<input type="hidden" id="page" name="page">
<!-- 이동할 페이지를 히든으로 하여 전송합니다. -->
</form>
<br>
<a href="/notice/noticeInsertForm">글 등록 </a>

</body>
</html>