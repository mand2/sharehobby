<%@page import="sharehobby.service.WriteExhbitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="exhbit" class="sharehobby.model.BoardExhibition"/>
<jsp:setProperty property="*" name="exhbit"/>

<%
	WriteExhbitService service = WriteExhbitService.getInstance();

	int cnt = service.write(exhbit);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
	<h1>
		<%= cnt>0 ? "메세지 남김" : "오류"%>
	</h1>
	
	<a href="writeExhbit.jsp">다시쓰기</a>
</body>
</html>