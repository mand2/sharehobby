
<%@page import="sharehobby.service.music.MemberRegService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberInfo" class="sharehobby.model.music.MemberInfo"/>
<jsp:setProperty property="*" name="memberInfo"/>
<%
	MemberRegService service = MemberRegService.getInstance();
	int cnt = service.reg(memberInfo);
%>
<%
	if (memberInfo.getU_photo() == null) {
		memberInfo.setU_photo("noImg.jpg");

		application.setAttribute(memberInfo.getU_id(), memberInfo);
	} else {
		memberInfo.getU_photo();

		application.setAttribute(memberInfo.getU_id(), memberInfo);
	}
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

	<%= cnt > 0 ? "회원가입 되었습니다." : "회원가입이 되지 않았습니다."%>
</body>
</html>