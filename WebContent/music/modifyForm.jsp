<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.dao.music.BoardMusicDao"%>
<%@page import="sharehobby.service.music.ShowPostService"%>
<%@page import="sharehobby.model.member.LoginInfo"%>
<%@page import="sharehobby.model.music.BoardMusicList"%>
<%@page import="sharehobby.service.music.BoardMusicListService"%>
<%@page import="sharehobby.model.music.BoardPost"%>
<%@page import="sharehobby.service.music.WritePostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%	
	String uId = (String)session.getAttribute("u_id");
	Connection conn = ConnectionProvider.getConnection();
	BoardMusicDao dao = BoardMusicDao.getInstance();
	
	int uNum = dao.find_uNum(conn,uId);
	int bmNum = 0;	
	String str = request.getParameter("bmNum");
	
	if(str!=null){
		bmNum = Integer.parseInt(str);
	}
	ShowPostService service = ShowPostService.getInstance();
	BoardPost post  = service.showPost(bmNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/default_board.css">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
	<%@include file="../frame/nav.jsp" %>
	<%@include file="../frame/header.jsp" %>
		<div id="main">
			<% if(uId !=null && uId.equals(post.getuId())){ %>
			<div id="container">
					<h3 class="title-header">
						음악 관련 게시판 
					</h3>
					<div class="form-wrap">
					<form action="${pageContext.request.contextPath}/music/confirmModify.jsp" method="post">
						<table border="1" style="border-collapse: collapse">
							<input type="hidden" name="bmNum" value="<%= bmNum %>">
							<tr>
								<td>작성자</td>
								<!-- 회원번호 hidden값으로 받아서 처리함. -->
								<!-- session login정보 가져와서 처리함 -->
								<td><input type="hidden" name="uNum" value="<%= uNum %>" required><%=uId %></td>
							</tr>
							<tr>
								<td>제목</td>
								<td style="width: 500px;"><input type="text" value="<%=post.getBmTitle() %>" name="bmTitle" required></td>
							</tr>
							<tr>
								<td>별점</td>
								<td><select name="bmStar" value="<%=post.getBmStar()%>">
										<option value="5">5</option>
										<option value="4">4</option>
										<option value="3">3</option>
										<option value="2">2</option>
										<option value="1">1</option>
								</select></td>
							</tr>
							<tr>
								<td>음악코드</td>
								<!-- hmNum : 테스트용으로 value 임의로 넣음 -->
								<td><input type="text" value="<%=post.getHmNum() %>" name="hmNum" required></td>
							</tr>
							<tr>
								<td>내용</td>
								<td><textarea name="bmCont" cols="100" rows="40" required><%=post.getBmCont()%></textarea></td>
							</tr>
							<tr>
								<td colspan="2" style="text-align:center" ><input type="submit" value="수정완료"><input type="reset" value="취소"></td>
								
							</tr>
						</table>
					</form>
					</div>
			</div>
		<% } else { %>
			<script>
				alert("잘못된 접근입니다.");
				location.href="${pageContext.request.contextPath}/music/boardMusicList.jsp"
			</script>
		<% } %>	
		</div>
		
		<div id="footer">
		</div>
		<script>
		$(document).ready(function(){
			$('input[type=reset]').click(function(){
				history.go(-1);
			});
		});
		</script>
</body>
</html>