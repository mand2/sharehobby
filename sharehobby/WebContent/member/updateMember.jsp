<%@page import="java.sql.Connection"%>
<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="sharehobby.service.member.UpdateMemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberInfo" class="sharehobby.model.member.MemberInfo" />
<jsp:setProperty property="*" name="memberInfo" />
<%
	Connection conn = null;

	int u_num = Integer.parseInt(request.getParameter("u_num"));
	String u_id = (String) session.getAttribute("u_id");
	String u_pw = request.getParameter("u_pw");

	int resultCnt = 0;

	UpdateMemberService service = UpdateMemberService.getInstance();
	resultCnt = service.updateMember(u_num, u_pw, memberInfo);
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

	<%
		if (resultCnt > 0) {
	%>
	<script>
		alert('수정이 완료되었습니다.');
		location.href = '../home/home.jsp';
	</script>
	<%
		} else {
	%>
	<script>
		alert('수정안됐엄');
		here.go(-1);
	</script>
	<%
		}
	%>

</body>
</html>