<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="member.MemberInfo"%>
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
		
		MemberInfo memberInfo = (MemberInfo) application.getAttribute(u_id);
		
		
		Connection conn = ConnectionProvider.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select u_pw from project.member where u_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, u_id);

			rs = pstmt.executeQuery();
			
			String id;
			String pw;

			id = rs.getString(u_id);
			pw = rs.getString(u_pw);

			if (rs.next()) {
				if (id.equals(u_id) && pw.equals(u_pw)) {
					session.setAttribute("loginInfo", memberInfo.toLoginInfo());
					out.println("<script>");
					out.println("alert('로그인 되었습니다.')");
					out.println("location.href='../home/home.jsp'");
					out.println("</script>");
				}
			} else {
				out.println("<script>");
				out.println("alert('로그인에 실패했습니다.')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
			pstmt.executeUpdate();
			
		} catch (SQLException ex) {
			ex.printStackTrace();
			
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException ex) {
				}
			}
		}
	%>

</body>
</html>