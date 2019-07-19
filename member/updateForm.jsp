
<%@page import="member.MemberInfo"%>
<%@page import="sharehobby.dao.member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//String id = (String)session.getAttribute("sessionID");
	int u_num = Integer.parseInt(request.getParameter("u_name"));
	MemberDao dao = MemberDao.getInstance();
	MemberInfo memberInfo = dao.select(u_num);
%>

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
	<form action="updateProcess.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_name"
					readonly><%= memberInfo.getU_id() %></td>
			</tr>
			<tr>
				<td>비밀번호 수정</td>
				<td><input type="password" name="u_pw"></td>
			</tr>
			<tr>
				<td>이름 수정</td>
				<td><input type="text" name="u_name"></td>
			</tr>

			<tr>
				<td>전화번호 수정</td>
				<td><input type="text" name="u_pnum"></td>
			</tr>

			<tr>
				<td>사진 수정</td>
				<td><input type="file" name="u_photo"></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>