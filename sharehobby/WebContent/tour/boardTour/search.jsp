<%@page import="java.util.List"%>
<%@page import="sharehobby.model.tour.Board"%>
<%@page import="sharehobby.service.tour.SearchBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String search = request.getParameter("search");

	SearchBoardService service = SearchBoardService.getInstance();

	List<Board> board = service.search(search);
	
	
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
	<%
	for( Board hh : board ) { %>
	<div>
		<br> 리뷰 번호 : <%=hh.getPk()%><br> 
		리뷰 제목 : <%=hh.getTitle()%><br> 
		리뷰 내용 : <%=hh.getContent()%><br> 
		리뷰 사진 : <%=hh.getPhoto()%><br> 
		평점 : <%=hh.getStar()%><br> 
		<a href="UpdateBoard.jsp?pk=<%=hh.getPk()%>">수정하기</a> | 
		<a href="DeleteBoard.jsp?pk=<%=hh.getPk()%>">삭제하기</a> <br>

	</div>
	<% } %>
</body>
</html>