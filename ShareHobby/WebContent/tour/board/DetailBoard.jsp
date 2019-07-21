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
	
	$('#x').click(function(){
			$.ajax({
				url: 'deleteCommentProcess.jsp',
				type: 'GET',
				dataType : 'text',
				data: {
					com : '<%= comm.getComment() %>'
				},
				success : function(data){
					if(data=='Y'){
						alert('completed!');
						/* location.href="exhbBoard.jsp"; */
					} else {
						alert('denied!');
					}
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
	heght: 800px;
	
}

#content {
	width: 600px;
	height: 700px;
	margin: 10px 5px;
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
				<td><label>리뷰 평점은 ?</label></td>
				<td><%=board.getStar()%></td>
			</tr>
			<% if(idCheck==board.getU_id()) { %>
			<tr>
				<td colspan="2" id="last">
					<a href="UpdateBoard.jsp?pk=<%=board.getPk()%>">수정하기</a> | 
					<a href="DeleteBoard.jsp?pk=<%=board.getPk()%>">삭제하기</a> <br>
				</td>
			</tr>
			<% } %>
			<% if(comment == null) { %>
			<tr>
				<td> 리뷰 0 </td>
			</tr>
			<% } else { %>
			<% for( Comment com : comment ) { %>
			<tr>
				<td> <%= com.getU_name() %></td>
				<td> <%= com.getComment() %><a href="DeleteCommentProcess.jsp?comment=<%= com.getComment() %>"><span id="x">x</span></a></td>
			</tr>
			
			<% } }%>
			
		</table>
		<form  method="post">
			<input type="hidden" name="r_num" value="<%=board.getPk()%>">
			댓글 입력 <textarea rows="5" cols="30" id="comment" name="comment"></textarea>
			<input type="submit" value="등록"> 
		</form>

		<h4 id="test"></h4>
	
</div>
	

</body>
</html>