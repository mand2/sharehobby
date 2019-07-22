<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%

	/* 현재 session 객체를 소멸시킨다. */
	request.getSession(false).invalidate();
%>
<script>
	alert("로그아웃되었습니다.");
</script>
<%
	response.sendRedirect("../home/home.jsp");
%>
 --%>
<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="utf-8"%>
<%
	String u_id = (String) session.getAttribute("u_id");

	Cookie c1 = CookieBox.createCookie("LOGIN", "", 0);
	response.addCookie(c1);
	Cookie c2 = CookieBox.createCookie("ID", u_id, 0);
	response.addCookie(c2);
	Cookie uId = CookieBox.createCookie("saveID", u_id, 60 * 30);
	response.addCookie(uId);
	
	/* 현재 session 객체를 소멸시킨다. */
	request.getSession(false).invalidate();
%>
<script>
	alert("로그아웃되었습니다.");
</script>
<%
	response.sendRedirect("../home/home.jsp");
%>
