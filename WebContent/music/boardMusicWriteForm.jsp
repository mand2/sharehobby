<%@page import="sharehobby.model.LoginInfo"%>
<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.dao.BoardMusicDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="sharehobby.model.BoardPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
<script
  src="https://code.jquery.com/jquery-2.2.4.js"></script>

</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h1 id="main-title">취미 공유 커뮤니티</h1>
			<div id="nav">
				<ul class="nav-list">
					<li>홈</li>
					<li>로그인</li>
					<li>회원가입</li>
					<li>마이페이지</li>
					<li>맛집</li>
					<li>여행</li>
					<li>전시</li>
					<li>음악</li>
				</ul>
			</div>
		</div>
		<div id="main">
			<div id="container">
								
					<div id="board-list">
						<h3>리뷰를 작성하세요.</h3>
						<form action="confirmInsert.jsp" method="post">
							<table border="1" style="border-collapse: collapse">
								<tr>
									<td>작성자</td>
									<!-- 회원번호 hidden값으로 받아서 처리함. -->
									<!-- session login정보 가져와서 처리함 -->
									<td><input type="hidden" name="uNum" value="<%= uNum %>"><%=uId %></td>
								</tr>
								<tr>
									<td>제목</td>
									<td><input type="text" name="bmTitle"></td>
								</tr>
								<tr>
									<td>별점</td>
									<td>
										<select name="bmStar">
											<option value="5">5</option>
											<option value="4">4</option>
											<option value="3">3</option>
											<option value="2">2</option>
											<option value="1">1</option>										
										</select>
									</td>
								</tr>
								<tr>
									<td>음악코드</td>
									<!-- hmNum : 테스트용으로 value 임의로 넣음 -->
									<td><input type="text" name="hmNum" value="1"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea name="bmCont" cols="100" rows="40"></textarea></td>
								</tr>
								<tr>
									<td><input type="submit" value="등록"></td>
									<td><input type="reset" value="취소"></td>
								</tr>
							</table>
						</form>
					</div>
			
			</div>
		</div>
		<div id="footer">
			
		</div>
	</div>
</body>
</html>