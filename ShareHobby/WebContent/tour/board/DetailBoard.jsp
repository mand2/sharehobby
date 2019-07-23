<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.model.tour.Comment"%>
<%@page import="java.util.List"%>
<%@page import="sharehobby.dao.tour.BoardDao"%>
<%@page import="sharehobby.model.tour.Board"%>
<%@page import="sharehobby.service.tour.DetailBoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	int pk = Integer.parseInt(request.getParameter("pk"));
	
	DetailBoardService service = DetailBoardService.getInstance();
	
	Board board = service.detail(pk);
	
	String idCheck = (String)session.getAttribute("u_id");
	
	BoardDao dao = BoardDao.getInstance();
	
	Connection conn = ConnectionProvider.getConnection();
	
	List<Comment> comment = dao.commentList(conn,pk);
	
	Comment comm = new Comment();
	
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <!-- Bootstrap core CSS -->
  <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="../css/heroic-features.css" rel="stylesheet">

<title>Shard Bobby - 리뷰 보기</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>
$(document).ready(function(){
	
	$('input').click(function(){
		$.ajax({
			url: 'CommentProcess.jsp',
			type: 'POST',
			dataType : 'text',
			data: {
				r_num : '<%=board.getPk()%>',
				comment : $('#comment').val()
			},
			success : function(data){
				$('test').html(data);

			}
		});//ajax	
	});
	

});

</script>
<style>
body {
	margin: 40px auto;
	width: 800px;
}

label {
	font-weight: bold;
	text-align: center;
}

table {
	width: 800px;
	heght: 1000px;
}

table td {
	border: 1px solid #ddd;
	padding: 5px;
}


img {
	width: 500px;
	height: 400px;
}

a {
	text-align: center;
}


</style>
</head>
<body>
  <%@ include file="../frame/nav.jsp" %>
	
<div id="content">
		<table>
			<tr>
				<td><label>리뷰 번호</label></td>
				<td><%=board.getPk()%></td>
			<tr>
				<td><label for="title">리뷰 제목</label></td>
				<td><%=board.getTitle()%></td>
			</tr>
			
			<tr>
				<td><label>포토 뷰</label></td>
				<td><img src="<%=board.getPhoto()%>"></td>
			</tr>
			<tr>
				<td><label>리뷰 내용</label></td>
				<td><%=board.getContent()%></td>
			</tr>
			<tr>
				<td><label>리뷰 평점</label></td>
				<td><%=board.getStar()%></td>
			</tr>
			
			<tr>
				<% if(idCheck.equals(board.getU_id())) { %>
				<td colspan="2">
					<a href="UpdateBoard.jsp?pk=<%=board.getPk()%>">수정하기</a> | 
					<a href="DeleteBoard.jsp?pk=<%=board.getPk()%>">삭제하기</a> <br>
				</td>
				<% } %>
			</tr>
			<% if(comment == null) { %>
			<tr>
				<td> 댓글 0 </td>
			</tr>
			<% } else { %>
			<% for( Comment com : comment ) { %>
			<tr>
				<td> <%= com.getU_name() %></td>
				<td> <%= com.getComment() %>
				<% if(idCheck.equals(com.getU_name())) { %>
				<a href="DeleteCommentProcess.jsp?comment=<%= com.getComment() %>"><span id="x">x</span></a>
				<% } %>
				</td>
			</tr>
			
			<% } }%>
			
		</table>
		<form  method="post">
			<input type="hidden" name="r_num" value="<%=board.getPk()%>">
			<textarea rows="5" cols="100" id="comment" name="comment"></textarea><br>
			<input type="submit" value="댓글 등록"> 
		</form>

		<h4 id="test"></h4>
	
</div>
	

</body>
</html>