<%@page import="sharehobby.model.Board"%>
<%@page import="sharehobby.service.UpdateBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="board" class="sharehobby.model.Board" />
<jsp:setProperty property="*" name="board"/>
<%
	UpdateBoardService service = UpdateBoardService.getInstance();

	int pk = Integer.parseInt(request.getParameter("pk"));
	
	
	Board select = service.updateView(pk);
	
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
	<form action="UpdateBoardProcess.jsp" method="post">
		<table>
			<tr>
				<td><input type="hidden" id="pk" name="pk" value="<%=pk%>"></td>
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title" value="<%= select.getTitle() %>"></td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><input type="text" id="content" name="content" value="<%= select.getContent() %>"></td>
			</tr>
			<tr>
				<td><label for="photo">사진</label></td>
				<td><input type="file" id="photo" name="photo" value="<%= select.getPhoto()%>"></td>
			</tr>
			<tr>
				<td><label for="star">평점</label></td>
				<td><input type="text" id="start" name="start" value="<%= select.getStar()%>"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
			</tr>
		</table>
	
	
	</form>
</body>
</html>