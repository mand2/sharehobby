<%@page import="sharehobby.model.member.LoginInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.dao.music.BoardMusicDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.model.music.BoardPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%
	// 임의로 속성 값 추가, 처리 실제 sessiong값 얻어올 거임
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LoginInfo");
	String uId = (String)session.getAttribute("u_id");



	Connection conn = ConnectionProvider.getConnection();
	BoardMusicDao dao = BoardMusicDao.getInstance();
	
	int uNum = dao.find_uNum(conn,uId);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/default_board.css">
<script src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
	<script>
	</script>
	<%@include file="../frame/nav.jsp"%>
	<%@include file="../frame/header.jsp"%>
	<div id="main">
		<% if(uId != null) { %>
		<div id="container">
				<h3 class="title-header">리뷰를 작성하세요.</h3>
				<div class="form-wrap">
				<form action="${pageContext.request.contextPath}/music/confirmInsert.jsp" method="post">
					<table border="1" style="border-collapse: collapse">
						<tr>
							<td>작성자</td>
							<!-- 회원번호 hidden값으로 받아서 처리함. -->
							<!-- session login정보 가져와서 처리함 -->
							<td><input type="hidden" name="uNum" value="<%= uNum %>" required><%=uId %></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" name="bmTitle" style="width: 400px" required></td>
						</tr>
						<tr>
							<td>별점</td>
							<td><select name="bmStar">
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
							<td><input type="text" name="hmNum" value="1" required></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea name="bmCont" cols="100" rows="40" required></textarea></td>
						</tr>
						<tr>
							<td colspan="2" style="text-align:center" ><input type="submit" value="등록"><input type="reset" value="취소"></td>
							
						</tr>
					</table>
				</form>
			</div>

		</div>
	</div>
	<div id="footer">
	<%@ include file="../frame/footer.jsp" %></div>
	<% } else { %>
	<div>
		로그인 된 회원만 이용 가능한 서비스 입니다. <a
			href="${pageContext.request.contextPath}/member/loginForm.jsp">로그인
			하세요.</a>
	</div>
	<%} %>
	<script>
		$(document).ready(function(){
			$('input[type=reset]').click(function(){
				history.go(-1);
			});
		});
		</script>
</body>
</html>