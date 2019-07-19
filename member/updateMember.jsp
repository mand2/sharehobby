<%@page import="sharehobby.dao.member.MemberDao"%>
<%@page import="sharehobby.service.member.UpdateMemberService"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberInfo" class="member.MemberInfo" />
<jsp:setProperty property="*" name="memberInfo" />
<%
	String id = (String)session.getAttribute("sessionID");
	memberInfo.setU_id(id);
	int chk = 0;
	
	MemberDao dao = MemberDao.getInstance();
	chk = dao.updateMember(memberInfo);
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
		if(chk==1){
			out.println("<script>");
			out.println("alret('수정이 완료되었습니다.')");
			out.println("location.href='mypage.jsp'");
			out.println("</script>");
		} else{
			out.println("<script>");
			out.println("alret('수정 놉')");
			out.println("here.go(-1)");
			out.println("</script>");
		}
	%>

</body>
</html>