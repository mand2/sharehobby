<%@page import="sharehobby.service.tour.UpdateBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="sharehobby.model.tour.Board" />
<jsp:setProperty property="*" name="board"/>
<%
	UpdateBoardService service = UpdateBoardService.getInstance();
	
	int pk = Integer.parseInt(request.getParameter("pk"));

	int cnt = service.updateBoard(pk,board);
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
	<h1>
	<%= cnt>0 ? "리뷰를 성공적으로 수정하였습니다." : "리뷰 수정이 되지 않았습니다. " %>
	</h1>

	<a href="boardmain.jsp">리뷰 목록</a>
</body>
</html>