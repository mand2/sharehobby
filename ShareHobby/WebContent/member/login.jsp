<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		Connection conn = ConnectionProvider.getConnection();
		String sql = "select * from member where u_id = ? and u_pw = ? ";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, u_id);
		pstmt.setString(2, u_pw);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			String id;
			String pw;
			id = rs.getString("u_id");
			pw = rs.getString("u_pw");
			if (id.equals(u_id) && pw.equals(u_pw)) {
				session.setAttribute("u_id", u_id);
				out.println("<script>");
				out.println("alert('로그인 되었습니다.')");
				out.println("location.href='../tour/board/boardmain.jsp'");
				out.println("</script>");
			}
		}out.println("<script>");
		out.println("alert('로그인에 실패했습니다.')");
		out.println("history.go(-1)");
		out.println("</script>");
		
		rs.close();
		pstmt.close();
		conn.close();
		//response.sendRedirect("../tour/boardmain.jsp");
	%>

</body>
</html>