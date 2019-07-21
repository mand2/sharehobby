<%@page import="sharehobby.service.exhb.DeleteExhbitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>   
<%
	DeleteExhbitService service = DeleteExhbitService.getInstance();
	String num = request.getParameter("be_num");
	
	//int be_num = 0 ;
	
	if (num != null){
		int be_num = Integer.parseInt(num);
		service.deleteMessage(be_num);
		out.print("Y");
	} else {
		out.print("N");
	}
		
	//초기화 위험성 없음. 자기 아이디가 맞는 경우에만 delete메서드가 보임.
	
%>