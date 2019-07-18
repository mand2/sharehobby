<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
	<h2>회원가입</h2>
	<form action="signup.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="email" name="u_id" required></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pw"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="u_name"></td>
			</tr>
			
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="u_pnum"></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="u_photo"></td>
			</tr>
			<tr>
				<td><input type="submit" value="가입하기"></td>
	
			</tr>
		</table>
	</form>
</body>
</html>