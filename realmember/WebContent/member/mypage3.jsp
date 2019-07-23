<%@page import="sharehobby.model.member.BoardComment"%>
<%@page import="sharehobby.model.member.MyReviewListView"%>
<%@page import="sharehobby.service.member.GetMyReviewListService"%>
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
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<script>
	$(document).ready(function() {
		$('#morerev').click(function() {
			location.href = '../exhibit/detailReview.jsp';
		})
	});
</script>
<style>
* {
	margin: 0;
	padding: 0;
}

.contents {
	width: 700px;
	margin: 30px auto;
	border: 0;
}

.myInfo_wrap {
	text-align: center;
}

#modBtn, #delBtn {
	width: 100px;
	margin: 0 10px;
	height: 30px;
	box-sizing: border-box;
	background-color: #FAF19E;
	border: 0px;
	border-radius: 3px;
}

.input {
	border: 0;
	height: 30px;
	line-height: 30px;
	display: block;
	box-sizing: border-box;
	text-align: center;
}

#morerev {
	width: 140px;
	margin: 0 10px;
	height: 42px;
	box-sizing: border-box;
	background-color: #FAF19E;
	border: 0px;
	border-radius: 3px;
	background-color: #FAF19E;
}

#val {
	text-align: center;
}

table {
	width: 500px;
	margin: 100px auto;
	border: 0;
	border-collapse: collapse;
}

table td {
	padding: 3px;
	border: 0;
	text-align: center;
}

table tr>td:last-child {
	width: 50%;
	text-align: right;
}

table tr>td:first-child {
	width: 50%;
	text-align: left;
}

table tr:first-child>td {
	width: 100%;
	text-align: center;
}

table tr:last-child>td {
	width: 100%;
	text-align: center;
}

#cont_wrap {
	border: 1px solid #ddd;
	height: 100px;
	overflow: auto;
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
				BoardComment exhbcont = null;
				int u_num = 0;

				try {

					conn = ConnectionProvider.getConnection();
					String u_id = request.getParameter("u_id");

					MemberDao dao = MemberDao.getInstance();
					u_num = dao.find_uNum(conn, u_id);
					//MemberInfo memberInfo = dao.viewMypage(u_id);

					String sql = "select u_num,u_id,u_name,u_pnum,u_photo from member where u_id = ? ";
					String sql_exhb = "select be_title, be_time, u_id, be_hit, be_star, be_star, be_cont from member m, board_exhb e where m.u_num = e.u_num and m.u_id = ?";

					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);

					rs = pstmt.executeQuery();

					while (rs.next()) {
		%>

		<div id="mypage">
			<!--input 의 width값을 길게 주면 아래 행으로 넘어가니까 효과 있음!-->
			<!--.inputbox는 박스 클릭시 색상 주기, .input은 width설정-->
			<div class="myInfo_wrap">
				<span class="input"><label for="id"><h4>아이디</h4></label><input
					id="val" value="<%=rs.getString(2)%>"> </span> <span class="input"></span><span><label
					for="name"><h4>이름</h4></label> <input id="val"
					value="<%=rs.getString(3)%>"> </span> <span><label
					for="phone"><h4>전화번호</h4></label></span> <span> <input id="val"
					value="<%=rs.getString(4)%>">
				</span> <br> <br>
				<div id="btn">
					<input type="button" id="modBtn" value="수정" onclick="location.href='confirmUpdate.jsp'"><input
						type="button" id="delBtn" value="삭제" onclick="location.href='confirmDelete.jsp'">
				</div>
			</div>

			<div>
				<%
					pstmt = conn.prepareStatement(sql_exhb);
								pstmt.setString(1, id);
								rs = pstmt.executeQuery();

								while (rs.next()) {
				%>
				<table>
					<tr>
						<td colspan="2"><h3 class="title-header">My Review</h3>
					<tr>

						<td colspan="2">전시명 | <%=rs.getString("be_title")%></td>
					</tr>
					<tr>
						<td>작성날짜 | <%=rs.getDate("be_time")%></td>
					</tr>

					<tr>
						<div class="title-info">
							<td>아이디 | <%=rs.getString("u_id")%></td>
							<td>조회수 | <%=rs.getInt("be_hit") + 1%>
							</td>
					</tr>

					<tr>
						<td>좋아요 |<%--  <%=rs.getInt("bm_like")%>  --%>| <a href="#">좋아요</a>
						</td>
						</div>
						<div class="cont-wrap"></div>

						<td>
							<div class="album-info">

								평점
								<%=rs.getInt("be_star")%>
							</div>
						</td>
					</tr>
					<tr>

						<td colspan="2"><div id="cont_wrap"><%=rs.getString("be_cont")%></div></td>

					</tr>
					</div>

					</div>
					<tr>
						<td colspan="2"><input type="button" id="morerev"
							value="페이지로 이동"> <td>
						
					</tr>
					</div>
				</table>
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
%> <!-- contents 끝 -->

					<!-- footer 시작 -->
					<%@ include file="../frame/footer.jsp"%>
					<!-- footer 끝 -->

						</body>
</html>