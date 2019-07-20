<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page
	import="sharehobby.exception.member.InvalidMemberPasswordException"%>
<%@page import="sharehobby.exception.member.MemberNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="sharehobby.service.member.DeleteMemberService"%>
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
*{
	margin: 0;
	padding: 0;
}
div{
	width: 300px;
	margin: 100px auto;
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

		String id = (String) session.getAttribute("sessionID");

		int u_num = Integer.parseInt(request.getParameter("u_num"));
		String u_pw = request.getParameter("u_pw");

		DeleteMemberService service = DeleteMemberService.getInstance();

		MemberDao dao = MemberDao.getInstance();
		int chk = dao.deleteMember(u_num, u_pw);
		if (chk == 1) {
			session.invalidate();
	%>
	<div>
	탈퇴처리 되었습니다.
	<input type='button' value='MAIN' id='main_btn'>
	</div>
	<%
		} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>