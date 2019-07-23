<%@page import="sharehobby.service.member.MemberRegService"%>
<%@page import="sharehobby.model.member.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("UTF--8");
%>
<jsp:useBean id="memberInfo" class="sharehobby.model.member.MemberInfo" />
<jsp:setProperty property="*" name="memberInfo" />
<%
	MemberRegService service = MemberRegService.getInstance();
	int cnt = service.reg(memberInfo);
%>
<%
	if (memberInfo.getU_photo() == null) {
		memberInfo.setU_photo("../images/noImg.jpg");

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

<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">

<style>
* {
	margin: 0;
	padding: 0;
}

body {
	min-width: 900px;
	font-size: 0.9em;
	font-family: 'Nanum Gothic', sans-serif;
}

#join_content {
	width: 300px;
	margin: 100px auto;
	font-size: 22px;
	font-weight: bold;
	text-align: center;
}

tr {
	width: 300px;
}

#main_btn, #my_btn {
	margin: 150px 0;
	width:140px;
	height: 42px;
	box-sizing: border-box;
	background-color: #FAF19E;
	border: 0px;
	border-radius: 3px;
}

#join_btn {
	margin: 150px 0;
	width: 100%;
	height: 42px;
	box-sizing: border-box;
	background-color: #FAF19E;
	border: 0px;
	border-radius: 3px;
}
</style>
</head>
<body>

	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->



	<!-- contents 시작 -->
	<div id="join_content">
		<%=cnt > 0 ? memberInfo.makejoin_succ_html() : memberInfo.notmakejoin_html()%>
	</div>
	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>