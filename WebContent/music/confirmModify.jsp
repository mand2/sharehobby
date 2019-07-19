<%@page import="sharehobby.service.ModifyPostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

%>

<jsp:useBean id="modifypost" class="sharehobby.model.BoardPost" />
<jsp:setProperty property="*" name="modifypost" />
<jsp:setProperty property="*" name="modifypost" />
<%
	String bmNumstr = request.getParameter("bmNum");
	
	
	int bmNum = 0;
	if(bmNumstr!=null){
		bmNum = Integer.parseInt(bmNumstr);
	}
	ModifyPostService service = ModifyPostService.getInstance();
	int cnt = service.modifyPost(bmNum, modifypost);
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