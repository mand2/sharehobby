<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%

	/* 현재 session 객체를 소멸시킨다. */
	request.getSession(false).invalidate();
%>
<script>
	alert("로그아웃되었습니다.");
</script>
<%
	response.sendRedirect("../home/home.jsp");
%>
