<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.dao.tour.BoardDao"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%


String u_id = (String)session.getAttribute("u_id");

Connection conn = ConnectionProvider.getConnection();
BoardDao dao = BoardDao.getInstance();

int u_num = dao.find_uNum(conn, u_id);

int r_num = Integer.parseInt(request.getParameter("r_num"));

String comment = request.getParameter("comment");

int rCnt = dao.createCommnet(conn, u_num, r_num, comment);


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


</body>
</html>