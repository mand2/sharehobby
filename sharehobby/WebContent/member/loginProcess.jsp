<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.model.member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->



	<!-- contents 시작 -->

	<%
		request.setCharacterEncoding("UTF-8");

		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		MemberInfo memberInfo = (MemberInfo) session.getAttribute(u_id);
		
		String ch = request.getParameter("idSave");
		
		boolean chk = false;

		MemberDao dao = MemberDao.getInstance();
		int check = dao.loginChk(u_id, u_pw);
		if (check == 1) {
			//session.setAttribute("loginInfo", memberInfo.toLoginInfo());
			session.setAttribute("u_id", u_id);
			out.println("<script>");
			out.println("alert('로그인 되었습니다.')");
			out.println("location.href='../home/home.jsp'");
			out.println("</script>");
			
		} else if (check == 0) {
			out.println("<script>");
			out.println("alert('로그인에 실패했습니다.')");
			out.println("history.go(-1)");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('등록된 회원정보가 없습니다.')");
			out.println("location.href='../home/join_form.jsp'");
			out.println("</script>");
		}
	%>
	<!-- contents 끝 -->
	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->

</body>
</html>