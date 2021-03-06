<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1>게시글 수정 </H1>
			
<form action="/notice/noticeUpdate" method="POST" enctype="multipart/form-data">
	제목 : <input type="text" name="notice_title" value="${notice.notice_title}"> <br/>
	내용 : <textarea name= "notice_context">${notice.notice_context}</textarea><br/>
	작성자 : <input type="text" name="notice_name" value="${notice.notice_name}"> <br/>

	<!-- 첨부파일은 VO로 받게 하기보다는 따로 하기에 이름을 똑같이 하지 않아도 됩니다. -->
	첨부파일 : <input type="file" name="upload"><br/>
	<c:if test="${notice.notice_originfile != null}">
	${notice.notice_originfile}
	</c:if>
	<br />
	<!-- 수정을 위해서도 PK는 필요합니다-->
	<input type="hidden" name="notice_no" value="${notice.notice_no}"><!-- pk -->
	<input type="submit" value="수정">
	<!-- 수정에 대한 경우의 수
	경우의수 : notNULL이 아닌 항목들이 비었는지, 아닌지.
	        notNULL이야 무조건 올려져있찌만 notNULL이 아닌 항목들은 올렸을 수도, 안 올렸을 수도 있기 때문.
	                   그래서  옵션 -첨부파일의 유따라 처리)가 있었던 것이다.
	         
	                        기존 파일유무       |     수정시 파일유무           |실시해야할 사항
--------------------------|--------------------|---------------- 
        경우의 수1) 파일 X          | 파일 X                | 아무것도 안해줘도 된다.
        경우의 수2) 파일 X          | 파일 O               | 등록처리 해준다.
        경우의 수3) 파일 O          | 파일 O(기존거 유지)       | 아무것도 안해줘도 된다.        
        경우의 수4) 파일 O          | 파일변경                              | 기존파일을 삭제하고, 새로운 파일을 등록한다.
        
    - PK정보를 조회, 가져왔는데 savedfile이 null이면 업로드 않은 것이다.(단순히 파일의 유무구분)
    - 컨트롤러에서 멀티파트(mpart)파일이 empty가 아닐때(#아무것도 할 것 /안할것을 먼저 구분)
    
                 멀티파트파일을 먼저 확인하는게 좋아요.
                 멀티파트를 먼저 확인하면 아무것도 아닌 경우(empty인 경우라고 부릅니다. 1,3번이 해당되죠)면 아무것도 않고 바로 빨리 끝내면 되고,
    	2,4번 처럼 신규업로드 또는 변경시에는 그에 맞춰서 행동한다.
    
	 -->
 	
	
</form>
</body>
</html>