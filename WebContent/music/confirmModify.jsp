<%@page import="sharehobby.service.ModifyPostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="post" class="sharehobby.model.BoardPost" />
<jsp:setProperty property="*" name="post" />
<%
	ModifyPostService service = ModifyPostService.getInstance();
	int cnt = service.modifyPost(post.getBmNum(),post);
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
	alert("수정완료"); 
	
	<%} else { %>
		alert("수정실패!");
		
		
	<%} %>
	
	location.href="boardMusicList.jsp";
	</script>
</body>
</html>