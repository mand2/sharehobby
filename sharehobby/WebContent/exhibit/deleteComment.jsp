<%@page import="sharehobby.service.exhb.comment.DeleteCommentService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
	DeleteCommentService service = DeleteCommentService.getInstance();

	int bc_num = Integer.parseInt(request.getParameter("bc_num"));
	
	int result = service.delete(bc_num);
	
	if(result > 0) {
		out.print("Y");
	} else {
		out.print("N");
	}
%>