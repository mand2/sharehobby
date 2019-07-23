<%@page import="sharehobby.model.tour.Board"%>
<%@page import="sharehobby.service.tour.UpdateBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    	request.setCharacterEncoding("utf-8");
    %>
<jsp:useBean id="board" class="sharehobby.model.tour.Board" />
<jsp:setProperty property="*" name="board"/>
<%
	UpdateBoardService service = UpdateBoardService.getInstance();

	int pk = Integer.parseInt(request.getParameter("pk"));
	
	
	Board select = service.updateView(pk);
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Shard Bobby - 리뷰 수정하기</title>

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/heroic-features.css" rel="stylesheet">
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
body {
	margin: 40px auto;
	width: 800px;
}

#container {
	height: 500px;
}


label {
	font-weight: bold;
	text-align: center;
}

table td:nth-child(1) {
	text-align: center;
}
table {
	width: 800px;
	heght: 800px;
	
}

#title {
	width: 600px;
	margin: 10px 5px;
	
}

#content {
	width: 600px;
	height: 700px;
	margin: 10px 5px;
}

#star {
	margin: 10px 5px;
}
#last {
	text-align: center;
}

</style>
</head>
<body>

<%@ include file="../frame/nav.jsp" %>


	<div id="create">
	<form action="UpdateBoardProcess.jsp" method="post">
		<table>
			<tr>
				<td><input type="hidden" id="pk" name="pk" value="<%=pk%>"></td>
			</tr>
			<tr>
				<td><label for="title">리뷰 제목</label></td>
				<td><input type="text" id="title" name="title" value="<%= select.getTitle() %>"></td>
			</tr>
			
			<tr>
				<td><label for="photo">사진 올리기</label></td>
				<td><input type="file" id="photo" name="photo" value="<%= select.getPhoto() %>"></td>
			</tr>
			<tr>
				<td><label for="content">리뷰 내용</label> <br>
					사진과 함께 <br> 상세 리뷰를 적어주세요 !
				</td>
				<td><textarea id="content" name="content"><%= select.getContent() %></textarea></td>
			</tr>
			<tr>
				<td><label for="star">나의 평점은 ?</label></td>
				<td><input type="text" id="star" name="start" value="<%= select.getStar() %>"></td>
			</tr>
			<tr>
				<td colspan="2" id="last">
				<input type="submit" value="등록">
				<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	
	</form>
	</div>
</body>
</html>