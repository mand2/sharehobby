<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.service.music.AddLikeService"%>
<%@page import="sharehobby.dao.music.BoardMusicDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String bmNumstr = request.getParameter("bmNum");
	String uNumstr = request.getParameter("uNum");
	
	int bmNum = 0;
	int uNum = 0;
	
	if(bmNumstr != null && uNumstr!=null){
		bmNum = Integer.parseInt(bmNumstr);
		uNum = Integer.parseInt(uNumstr);
	}
	
	
	AddLikeService service = AddLikeService.getInstance();

	int chkLike = service.addLike(uNum, bmNum);
	out.print(chkLike);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>
<script>

	console.log("<%=uNum%>");
</script>
	
</body>
</html>