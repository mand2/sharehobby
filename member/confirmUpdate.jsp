<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
	<h1>회원정보 수정 비밀번호 확인</h1>
	<form action="updateForm.jsp" method="post">
		수정 하시려면 비밀번호를 입력해주세요.<br> <input type="hidden" name="u_num"
			value="<%=request.getParameter("u_num")%>">
		<!-- 사용자에게 보이지않지만 전송할떄 같이 전송해야하므로 사용 -->
		<input type="password" name="u_pw" required> <input
			type="submit" value="수정">
	</form>
</body>
</html>