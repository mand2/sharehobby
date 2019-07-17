<%@page import="sharehobby.service.BoardNotFoundException"%>
<%@page import="sharehobby.service.DeleteBoardService"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pk = Integer.parseInt(request.getParameter("pk"));
	
	int resultCnt = 0;
	boolean chk = false;
	String msg = "";
	
	// 서비스 객체 생성
	DeleteBoardService service = DeleteBoardService.getInstance();

	try { 
		resultCnt = service.deleteBoard(pk);
		chk = true;
	} catch ( SQLException e ) {
		msg = e.getMessage();
	} catch ( BoardNotFoundException e ) {
		msg = e.getMessage();
	} 
%>   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>

</style>
</head>
<body>
	
	<h1>
		<%
			if(chk) {
		%>
			<%= resultCnt %> 개의 행이 삭제 되었습니다.
		<%  } else { %>
			<%= msg %>
		<%  }%>
	</h1>
	
	<a href="boardmain.jsp">리스트</a>
	
</body>
</html>