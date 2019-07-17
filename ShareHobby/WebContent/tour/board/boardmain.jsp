<%@page import="sharehobby.model.Board"%>
<%@page import="sharehobby.model.BoardListView"%>
<%@page import="sharehobby.service.GetBoardListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


	request.setCharacterEncoding("utf-8");

	String pageNumberstr = request.getParameter("page");

	int pageNumber = 1;
	
	if(pageNumberstr != null) {
		pageNumber = Integer.parseInt(pageNumberstr);
	}
	
	// 핵심 처리할 서비스 객체
	GetBoardListService service = GetBoardListService.getInstance();

	// 응답 데이터의 결과
	BoardListView viewData = service.getBoardListView(pageNumber);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>

</style>
</head>
<body>

		<a href="CreateBoard.jsp">리뷰 작성</a>
		<hr>
		<br>

<%
		if(viewData.isEmpty()) {
			%>
			<h3>등록된 메시지가 없습니다.</h3>
			<%
		} else {
			
			for( Board board : viewData.getBoardList() ) {
				
			%>
			<div>
				<br>
				리뷰 번호 : <%= board.getPk() %><br>
				리뷰 제목 : <%= board.getTitle() %><br>
				리뷰 내용 : <%= board.getContent() %><br>
				리뷰 사진 : <%= board.getPhoto() %><br>
				평점  : <%= board.getStar() %><br>
				<a href="UpdateBoard.jsp?pk=<%= board.getPk() %>">수정하기</a> | <a href="DeleteBoard.jsp?pk=<%= board.getPk() %>">삭제하기</a> <br>
				
			</div>
			
			<%
			}
		}
	
	// [1] [2] [3]
	for(int i=1; i<=viewData.getPageTotalCount(); i++){
	%>	
	<a href="boardmain.jsp?page=<%= i %>">[<%= i %>]</a>
	
	<%
	}
	 %>

</body>
</html>