<%@page import="sharehobby.service.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="post" class="sharehobby.model.BoardPost" />
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
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>
<style>
</style>
</head>
<body>

<h1>
		<%= cnt > 0? "방명록에 메시지를 남겼습니다." : "메시지 등록에 실패했습니다."%>
	</h1>
	<a href="boardMusicList.jsp">목록으로 돌아가기</a>



<script>

</script>
</body>
</html>