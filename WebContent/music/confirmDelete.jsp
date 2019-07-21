<%@page import="sharehobby.service.music.PostNotFoundException"%>
<%@page import="sharehobby.service.music.DeletePostListService"%>
<%@page import="sharehobby.service.music.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String bmNumstr = request.getParameter("bmNum");
	int bmNum = 0;
	String msg = "";
	
	if(bmNumstr != null){
		bmNum = Integer.parseInt(bmNumstr);
	} else {
		
	}
%>
<%
	DeletePostListService service = null;
	int rCnt = 0;
	
	try{
		service = DeletePostListService.getInstance();
		rCnt = service.deletePost(bmNum);
	} catch(PostNotFoundException e){
		msg = e.getMessage();
	}
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>

	if(confirm("게시글을 삭제하시겠습니까? (게시글은 복구되지 않습니다.)")){
<% 
		if(rCnt>0){
		
		%>
		alert("게시글을 삭제했습니다."); 
	
	<%} else { %>
		alert("<%=msg%>");
		
		
	<%} %>
	} else {
		alert("취소했습니다.");
		history.go(-1);
	}
	
	location.href="boardMusicList.jsp";
	
	</script>
</body>
</html>