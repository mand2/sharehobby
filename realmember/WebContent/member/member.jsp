<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="sharehobby.model.member.MemberInfo"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<style>
* {
	margin: 0;
	padding: 0;
}

.contents{
	width : 700px;
	margin: 50px auto;
	border: 0;
}
table {
	width: 100%;
	margin: 0 auto;
	border: 0;
	border-collapse: collapse;
}
table td {
	padding: 3px;
	border: 1px solid #DDD;
	text-align: center;
}
img.mImg {
	height: 25px;
	margin: 2px;
}

table tr:first-child>td {
	text-align: center;
	background-color: #EEE;
	font-weight: bold;
}

a {
	text-decoration: none;
	color: #000;
}
</style>
</head>
<body>

	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->

	<!-- contents 시작 -->
	<%
		request.setCharacterEncoding("utf-8");
		String sessonId = (String) session.getAttribute("sessionId");
		boolean login = sessonId == null ? false : true;

		if (login == false) {
			out.println("<script>");
			out.println("alert('로그인 후 사용 가능합니다.')");
			out.println("location.href='../home/login.jsp'");
			out.println("</script>");

		} else {
	%>
	<div class="contents">
	<table>
		<tr>
			<td>NO.</td>
			<td>ID</td>
			<td>NAME</td>
			<td>NUM.</td>
			<td>PROFILE</td>
			<td colspan="2">관리</td>
		</tr>
		<%
			
				Connection conn = null;
				Statement stmt = null;
				//PreparedStatement pstmt = null;
				ResultSet rs = null;
				int u_num = 0;
				
				try {

					conn = ConnectionProvider.getConnection();
					String u_id = request.getParameter("u_id");
					
					MemberDao dao = MemberDao.getInstance();
					u_num = dao.find_uNum(conn, u_id);
					MemberInfo memberInfo = dao.select(u_num);
					
					//String sql = "select u_num,u_id,u_name,u_pnum,u_photo from member "; 
					String sql = "select u_num,u_id,u_name,u_pnum,u_photo from project.member "; 
					
					stmt = conn.createStatement();
					//pstmt = conn.prepareStatement(sql);
					//pstmt.setInt(1, u_num);
					
					//rs = pstmt.executeQuery();

					rs = stmt.executeQuery(sql);

					while (rs.next()) {
		%>


		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getString(5)%></td>
			<td><a href="confirmUpdate.jsp?u_num=<%=rs.getInt(1)%>">수정</a></td>
			<td><a href="confirmDelete.jsp?u_num=<%=rs.getInt(1)%>">삭제</a></td>
		</tr>
		
		<%}
				
				} catch (SQLException ex) {
					out.println(ex.getMessage());
					ex.printStackTrace();
				} finally {
					// 6. 사용한 Statement 종료
					if (rs != null)
						try {
							rs.close();
						} catch (SQLException ex) {
						}
					if (stmt != null)
						try {
							stmt.close();
						} catch (SQLException ex) {
						}
					// 7. 커넥션 종료
					if (conn != null)
						try {
							conn.close();
						} catch (SQLException ex) {
						}
				}
		}
		%>

	</table>
	</div>
	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->

</body>
</html>