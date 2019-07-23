<%@page import="sharehobby.dao.tour.BoardDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%


String comment = request.getParameter("comment");

Connection conn = ConnectionProvider.getConnection();
BoardDao dao = BoardDao.getInstance();

int rCnt = dao.deleteComment(conn, comment);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
			<% if(rCnt>0){ %>
				alert('삭제되었습니다.');
				history.back(-1);
				location.reload(true);
			<%} else { %>
				alert('denied!');
			<%} %>
	
</script>
<style>

</style>
</head>
<body>


</body>
</html>