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
<script>
<%if (cnt > 0) {%>
	alert('리뷰가 수정되었습니다');
	location.href = 'boardmain.jsp';
<%} else {%>
	alert('다시 입력해주세요.');
	history.back(-1);
<%}%>
</script>
<style>

</style>
</head>
<body>
</body>
</html>