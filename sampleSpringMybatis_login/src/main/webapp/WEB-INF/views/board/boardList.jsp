<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- SQL에서 가져온 글 목록들을list들을 깔끔하게 나오도록 해봅시다!  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<tr>
				<td>${status.count }</td>
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
	
	<input type="button" value="글 등록" onclick="boardWriteForm()">
</body>
</html>