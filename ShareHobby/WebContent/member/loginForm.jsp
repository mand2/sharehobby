<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/mm/css/default.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
	<h3>LOGIN PAGE</h3>
	
		<form action="login.jsp" method="post">
			<table>
				<tr>
					<td>ID</td>
					<td><input type="text" name="u_id"></td>
				</tr>
				<tr>
					<td>PASSWORD</td>
					<td><input type="password" name="u_pw" required></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="LOGIN"></td>
				</tr>
			</table>
		</form>

</body>
</html>