<%@page import="sharehobby.model.exhb.BoardExhibition"%>
<%@page import="sharehobby.service.exhb.AlterExhbitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>    
<%
    	request.setCharacterEncoding("utf-8");
    %>
<jsp:useBean id="exhbit" class="sharehobby.model.exhb.BoardExhibition"/>
<jsp:setProperty property="*" name="exhbit"/>    

<%
	AlterExhbitService service = AlterExhbitService.getInstance();
	
 	int be_num = Integer.parseInt(request.getParameter("be_num"));
 
	int result = service.alterMsg(exhbit, be_num);
/*  	if(result>0){
 		out.print("Y");
 	} else {
 		out.print("N");
 	} */
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정확인::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>

<script>
	alert('completed!');
	location.href="exhbBoard.jsp"; 
</script>
</head>
<body>
</body>
</html>