<%@page import="sharehobby.service.DeletePostListService"%>
<%@page import="sharehobby.service.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="post" class="sharehobby.model.BoardPost" />
<jsp:setProperty property="*" name="post" />
<%
	DeletePostListService service = DeletePostListService.getInstance();
	int rCnt = service.deletePost();

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
	
	if(cnt>0){
		
	%>
	alert("게시글을 삭제했습니다."); 
	
	<%} else { %>
		alert("삭제를 실패했습니다.");
		
		
	<%} %>
	
	location.href="boardMusicList.jsp";
	
	</script>
</body>
</html>