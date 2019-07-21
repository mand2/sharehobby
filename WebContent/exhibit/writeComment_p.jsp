<%@page import="sharehobby.service.exhb.comment.WriteCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>   

<%
	request.setCharacterEncoding("utf-8");
	WriteCommentService service = WriteCommentService.getInstance();

	String bc_cont = request.getParameter("bc_cont");
	int be_num = Integer.parseInt(request.getParameter("be_num"));
	int u_num = Integer.parseInt(request.getParameter("u_num"));
	int bc_parent = Integer.parseInt(request.getParameter("bc_parent"));
	
	int result = service.write(bc_cont, be_num, u_num, bc_parent);
	
	if(result > 0) {
		out.print("Y");
	} else {
		out.print("N");
	}
%>