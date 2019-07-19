<%@page import="sharehobby.service.DeletePostListService"%>
<%@page import="sharehobby.service.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String bmNumstr = request.getParameter("bmNum");
	int bmNum = 0;
	
	if(bmNumstr != null){
		bmNum = Integer.parseInt(bmNumstr);
	} else {
		
	}
%>
<%
	DeletePostListService service = DeletePostListService.getInstance();
	int rCnt = service.deletePost(bmNum);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	
<% 
	
	if(rCnt>0){
		
	%>
	alert("게시글을 삭제했습니다."); 
	
	<%} else { %>
		alert("삭제를 실패했습니다.");
		
		
	<%} %>
	
	location.href="boardMusicList.jsp";
	
	</script>
</body>
</html>