<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>

</style>
</head>
<body>
	<form action="CreateBoardProcess.jsp" method="post">
		<table>
			<tr>
				<td><label for="title">제목</label></td>
				<td><input type="text" id="title" name="title"></td>
			</tr>
			<tr>
				<td><label for="content">내용</label></td>
				<td><input type="text" id="content" name="content"></td>
			</tr>
			<tr>
				<td><label for="photo">사진</label></td>
				<td><input type="file" id="photo" name="photo"></td>
			</tr>
			<tr>
				<td><label for="star">평점</label></td>
				<td><input type="tesx" id="start" name="start"></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록"></td>
			</tr>
		</table>
	
	
	
	</form>
	
</body>
</html>
