<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="sharehobby.service.member.UpdateMemberService"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>


<%-- <%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	int u_num = 0;
	int chk = 0;
	String u_id = request.getParameter("u_id");
	//String u_id = (String) session.getAttribute("sessionId");
	
	MemberDao dao = MemberDao.getInstance();
	u_num = dao.find_uNum(conn, u_id);
	
	String u_name = request.getParameter("u_name");
	String u_pw = request.getParameter("u_pw");
	String u_pnum = request.getParameter("u_pnum");
	String u_photo = request.getParameter("u_photo");

	conn = ConnectionProvider.getConnection();
	
	//String sql = "update member set u_name = ?, u_pw = ?, u_pnum = ?, u_photo = ?  where u_num =?";
	String sql = "update project.member set u_name = ?, u_pw = ?, u_pnum = ?, u_photo = ?  where u_num =?";
	pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, u_name);
	pstmt.setString(2, u_pw);
	pstmt.setString(3, u_pnum);
	pstmt.setString(4, u_photo);
	pstmt.setInt(5, u_num);

	chk = pstmt.executeUpdate();
	
	conn.commit();
%> --%>
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
	%>
	<jsp:useBean id="memberInfo" class="sharehobby.model.member.MemberInfo" />
	<jsp:setProperty property="*" name="memberInfo" />

	<%
		MemberDao dao = MemberDao.getInstance();
		int chk = dao.updateMember(u_num, memberInfo);
		if (chk > 0) {

			out.println("<script>");
			out.println("alret('수정이 완료되었습니다.')");
			out.println("location.href='../home/home.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alret('수정 놉')");
			out.println("here.go(-1)");
			out.println("</script>");
		}
	%>
</body>
</html>