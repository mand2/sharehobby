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
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>

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
				<option value="1001">1001</option>
				<option value="1002">1002</option>
				<option value="2001">2001</option>
				<option value="2002">2002</option>
				<option value="3001">3001</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="be_title" required></td>
		</tr>
		<tr>
			<td>작성시간</td>
			<td></td>
		</tr>
		<tr>
			<td>평점</td>
			<td><input type="number" name="be_star" min="1" max="5" required></td>
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
</form>
</body>
</html>