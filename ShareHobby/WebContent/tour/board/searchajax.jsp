<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sharehobby.model.tour.Board"%>
<%@page import="java.util.List"%>
<%@page import="sharehobby.service.tour.SearchBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%
	request.setCharacterEncoding("utf-8");

	String search = request.getParameter("search");

	List<Board> list = new ArrayList<Board>();
		
	Connection conn = ConnectionProvider.getConnection();
	
		Board board = null;
		
		PreparedStatement pstmt = null;
		
		ResultSet rs = null;
		
		String sql = "SELECT BT_NUM,BT_TITLE,BT_CONT,BT_STAR,BT_PHOTO "
				+ "FROM BOARD_TOUR WHERE BT_TITLE like %?% order by BT_NUM desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board = new Board();
				board.setTitle(rs.getString(2));	
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
	
	
	
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
	for( Board hh : list ) { %>

		리뷰 제목 : <%=hh.getTitle()%><br>

	<% } %>
</body>
</html>