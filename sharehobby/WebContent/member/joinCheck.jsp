<%@page import="sharehobby.dao.member.MemberDao"%>
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
<%
	request.setCharacterEncoding("UTF-8");
	
	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	MemberDao dao = MemberDao.getInstance();
	if(dao.idchk(u_id)){
		%>
		<script>
		alert('아이디가 중복되었습니다. 다른아이디를 선택해주세요.');
		history.go(-1);
		</script>
		<%
	}else{
		%>
		<script>
		alert('사용가능한 아이디입니다.');
		history.go(-1);
		</script>
		<%
	}
	%>
</body>
</html>