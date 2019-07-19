<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page
	import="sharehobby.exception.member.InvalidMemberPasswordException"%>
<%@page import="sharehobby.exception.member.MemberNotFoundException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="sharehobby.service.member.DeleteMemberService"%>
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

	String id = (String) session.getAttribute("sessionID");

	int u_num = Integer.parseInt(request.getParameter("u_num"));
	String u_pw = request.getParameter("u_pw");
	
	
	DeleteMemberService service = DeleteMemberService.getInstance();
	
	MemberDao dao = MemberDao.getInstance();
	int chk = dao.deleteMember(u_num, u_pw);
	if (chk == 1 ) {
		session.invalidate();
%>
<b>회원정보가 삭제되었습니다.</b>

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
</body>
</html>