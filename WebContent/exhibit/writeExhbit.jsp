<%@page import="sharehobby.model.Exhibition"%>
<%@page import="sharehobby.dao.ExhibitionDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%
	String u_id = (String)session.getAttribute("u_id");

	Connection conn = ConnectionProvider.getConnection();
	ExhibitionDao dao = ExhibitionDao.getInstance(); 
	
	int u_num = dao.find_uNum(conn, u_id);
	
	/* 현재 전시중인 리스트 */
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기_전시::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_board.css" rel="stylesheet" type="text/css">

<style></style>
</head>
<body>
<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- header 시작 -->
	<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->


<!-- contents 시작 -->
    

<h1>전시회 후기</h1>
<hr>
<form action="writeExhbit_p.jsp" method="post">
	<table>
		<tr>
			<td></td> <!-- 삭제해야할요소 확인용임 -->
			<td><input type="hidden" name="u_num" value=<%=u_num %>>
			</td>
		</tr>
		<tr>
			<td>전시명</td> <!-- 전시코드에서 넘어와서 연결해줘야함 -->
			<td>
				<select name="he_num" required>
					<option selected="selected" disabled="disabled">선택하세요</option>
				<%
				/*--show list of msg --*/					
					for(Exhibition exhb : dao.showEnumList(conn)) {
				%>
					<option value="<%= exhb.getHe_num()%>"><%= exhb.getHe_name() %> | <%= exhb.getHe_artist()%></option>
				<% } %>
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="be_title" required></td>
		</tr>
		<tr>
			<td>평점</td>
			<td>
				<select name="be_star">
					<option selected="selected" disabled="disabled">선택하세요</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td><textarea rows="25" cols="80" name="be_cont" required></textarea></td>
		</tr>
		<tr>
			<td>사진</td>
			<td><input type="file" name="be_photo"></td>
		</tr>
		
	</table>
		<input type="submit" value="제출">
<!-- contents 끝 -->
		
<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</form>
</body>
</html>