
<%@page import="sharehobby.model.member.LoginInfo"%>
<%@page import="sharehobby.dao.food.FoodPostDao"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@page import="sharehobby.model.food.FoodPostList"%>
<%@page import="sharehobby.service.food.GetPostListService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	LoginInfo loginInfo = (LoginInfo) session.getAttribute("LoginInfo");
	String uId = (String) session.getAttribute("u_id");
	Connection conn = ConnectionProvider.getConnection();
	FoodPostDao dao = FoodPostDao.getInstance();

	int uNum = dao.find_uNum(conn, uId);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 맛집 리뷰 작성</title>
<link href="../css/default_css.css" rel="stylesheet" type="text/css">
<style>
review {
	border: 3px solid;
	margin: 5px 0px;
	width: 300px;
}

td {
	height: 30px;
}

input[type=text] {
	height: 20px;
	margin: 0 2px;
}

textarea {
	margin: 2px;
}
#wrap {
	weight: 900px;
	width: 900px;
	margin: auto;
}
#writeForm {
	margin: auto;
}

#writeForm>input[type=submit] {
	width: 50px;
	height: 30px;
	margin: 0 3px;
	box-sizing: border-box;
	background-color: #FAF19E;
	border: 0px;
	border-radius: 3px;
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>

	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->

	<!-- contents 시작 -->
	<div id="wrap">
	<h1>맛집 리뷰 작성</h1>
	<br>
	<hr>
	<br>
	<form calss=review action="FoodWritePostCheck.jsp" method="post">
		<div id="wrap">
			<table id="writeForm" width="700" border=1>

				<tr>
					<td>작성자</td>
					<td><input type="hidden" name="u_num" value="<%=uNum%>"><%=uId%></td>
				</tr>
				<tr>
					<td id="title">제 목</td>
					<td><input name="bf_title" type="text" size="70" value="" /></td>
				</tr>
				<tr>
					<td id="title">식당 번호</td>
					<td>
						<select name="hf_num">
							<option>10</option>
							<option>20</option>
					</select>
					</td>
				</tr>
				<tr>
					<td id="title">평 점</td>
					<td>
						<select name="bf_star">
							<option>10</option>
							<option>9</option>
							<option>8</option>
							<option>7</option>
							<option>6</option>
							<option>5</option>
							<option>4</option>
							<option>3</option>
							<option>2</option>
							<option>1</option>
							
					</select>
					</td>
				</tr>
				<tr>
					<td id="title">내 용</td>
					<td><textarea name="bf_cont" cols="72" rows="20"></textarea></td>
				</tr>
				<tr align="center" valign="middle">
					<td colspan="2"><input type="submit" value="등록"></td>
				</tr>
			</table>
		</div>
	</form>
</div>
</body>
</html>