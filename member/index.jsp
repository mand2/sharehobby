<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<input type="button" value="JOIN"
		onclick="location.href='signupForm.jsp'">

	<%
		if (session.getAttribute("u_id") == null) {
	%>
	<c:if test="${loginInfo == null}">
		<input type="button" value="LOG IN"
			onclick="location.href='loginForm.jsp'">
	</c:if>
	<%
		} else {
	%>
	<c:if test="${loginInfo != null }">
		<input type="button" value="MY PAGE"
			onclick="location.href='mypage.jsp'">
	</c:if>
	<input type="button" value="LOG OUT"
		onclick="location.href='logout.jsp'">

	<%
		String id = (String) session.getAttribute("u_id");
			out.println("<br>"+id + "님 반갑습니다.");
		}
	%>
</body>
</html>