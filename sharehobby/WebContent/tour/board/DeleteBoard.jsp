<%@page import="sharehobby.service.tour.BoardNotFoundException"%>
<%@page import="sharehobby.service.tour.DeleteBoardService"%>
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
<script>
<%if (chk) {%>
	alert('리뷰가 삭제되었습니다');
	location.href = 'boardmain.jsp';
<%} else { %>
	<%=msg%>; 		
	history.back(-1);
<%} %>
</script>
<style>

</style>
</head>
<body>

</body>
</html>