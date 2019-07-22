<%@page import="sharehobby.model.member.MusicReview"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="sharehobby.model.member.MemberInfo"%>
<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<style>
* {
	margin: 0;
	padding: 0;
}

.contents {
	width: 700px;
	margin: 50px auto;
	border: 0;
}
</style>
</head>
<body>
	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->

	<!-- contents 시작 -->

	<%
		request.setCharacterEncoding("utf-8");
		String id = (String) session.getAttribute("u_id");
		boolean login = id == null ? false : true;

		if (login == false) {
			out.println("<script>");
			out.println("alert('로그인 후 사용 가능합니다.')");
			out.println("location.href='../home/login.jsp'");
			out.println("</script>");

		} else {
	%>
	<div class="contents">
		<%
			Connection conn = null;
				Statement stmt = null;
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				MemberInfo memberInfo = null;
				MusicReview music = null;
				int u_num = 0;

				try {

					conn = ConnectionProvider.getConnection();
					String u_id = request.getParameter("u_id");

					//MemberDao dao = MemberDao.getInstance();
					//u_num = dao.find_uNum(conn, u_id);
					//MemberInfo memberInfo = dao.viewMypage(u_id);

					String sql = "select u_num,u_id,u_name,u_pnum,u_photo from member where u_id = ? ";
					String sql_music = "select c.bm_title, c.bm_time, m.u_id, c.bm_cnt, c.bm_star, c.bm_cont "
							+"from member m, board_music c where c.u_num = m.u_num and  m.u_id = ? ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);

					rs = pstmt.executeQuery();

					while (rs.next()) {
		%>

		<div id="regForm">
			<!--input 의 width값을 길게 주면 아래 행으로 넘어가니까 효과 있음!-->
			<!--.inputbox는 박스 클릭시 색상 주기, .input은 width설정-->


			<label for="id"><h4>아이디</h4></label>
			<%=rs.getString(2)%>

			<label for="name"><h4>이름</h4></label>
			<%=rs.getString(3)%>

			<label for="phone"><h4>전화번호</h4></label>
			<%=rs.getString(4)%>

			<label for="img"><h4>전화번호</h4></label>
			<%=rs.getString(5)%>

			<!-- <div class="warning">
					<label for="y"><h4>생년월일</h4></label>
					<div id="birthbox">
						<span class="inputbox birth"><input id="y" class="input"
							placeholder="연도"></span> <span class="inputbox birth"> <select
							id="m" class="input">
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
						</select>
						</span> <span class="inputbox birth"><input id="d" class="input"
							placeholder="날짜"></span>
					</div>
					birthbox
					<h5></h5>
				</div> -->
			<!-- id pw 저장여부 -->
			<!--                <h4><input type="checkbox"> 아이디 저장 </h4> -->

			<div>
				<input type="button" id="modBtn" value="수정"> <input
					type="button" id="delBtn" value="삭제">

			</div>

			<div>
				<%
					pstmt = conn.prepareStatement(sql_music);
								pstmt.setString(1, id);
								rs = pstmt.executeQuery();

								while (rs.next()) {
				%><h3 class="title-header">리뷰 상세보기</h3>
				<div id="detail-cont-wrap">
					<h4 class="detail-title">

						<%=rs.getString("bm_title")%>
						<span> <%=rs.getDate("bm_time")%>
						</span>
					</h4>
					<div class="title-info">
						<span> <%=rs.getString("u_id")%></span> <span>조회수 <%=rs.getInt("bm_cnt")%>
						</span> <span>좋아요<%-- <%=rs.getInt("bm_like")%> --%>
						</span> <a href="#">좋아요</a>
					</div>

					<div class="cont-wrap">
						<%-- 음악코드
					<%=myreview.getHmNum() %> --%>
					</div>
					<div class="album-info">
						<%-- <img src="<%=myreview.getmPhoto() %>" alt="<%=myreview.getmName() %>이미지" width="250">										
					<p class="hm-title">
					<%=myreview.getHmTitle() %> </p>
					<p><%=myreview.getmName() %> | <%=myreview.getmSinger() %></p>
					<%=myreview.getmGenre() %>--%>
						<p class="cont-star">
							평점
							<%=rs.getFloat("bm_star")%>
						</p>
					</div>
					<p class="bm-cont"><%=rs.getString("bm_cont")%></p>
					}
				</div>

				<%
					}
							}

						} catch (SQLException ex) {
							out.println(ex.getMessage());
							ex.printStackTrace();
						} finally {
							// 6. 사용한 Statement 종료
							if (rs != null)
								try {
									rs.close();
								} catch (SQLException ex) {
								}
							if (stmt != null)
								try {
									stmt.close();
								} catch (SQLException ex) {
								}
							// 7. 커넥션 종료
							if (conn != null)
								try {
									conn.close();
								} catch (SQLException ex) {
								}
						}
					}
				%>


				<!-- contents 끝 -->

				<!-- footer 시작 -->
				<%@ include file="../frame/footer.jsp"%>
				<!-- footer 끝 -->
</body>
</html>