<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	/* 현재 session 객체를 소멸시킨다. */
	request.getSession(false).invalidate();

	response.sendRedirect("index.jsp");
%>
