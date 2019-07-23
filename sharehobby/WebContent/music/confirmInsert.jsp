<%@page import="sharehobby.service.music.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="post" class="sharehobby.model.music.BoardPost" />
<jsp:setProperty property="*" name="post" />
<%
	WritePostService writeService = WritePostService.getInstance();
	int cnt = writeService.writePost(post);

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
	alert("등록완료"); 
	
	<%} else { %>
		alert("등록 실패!");
		
		
	<%} %>
	
	location.href="${pageContext.request.contextPath}/music/boardMusicList.jsp";
	
	</script>
</body>
</html>