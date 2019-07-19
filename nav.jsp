
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="nav">
	<ul>
		<li><a href="${pageContext.request.contextPath}/home/home.jsp">HOME</a></li>

		
		<li><a
			href="${pageContext.request.contextPath}/exhibit/exhbBoard.jsp">EXHIBIT</a></li>
			<li><a
			href="${pageContext.request.contextPath}/member/member.jsp">MEMBER</a></li>
		<%
			if (session.getAttribute("sessionId") == null) {
		%>
		<c:if test="${loginInfo == null}">
			<li><a href="${pageContext.request.contextPath}/home/login.jsp">LOGIN</a></li>
			<li><a
				href="${pageContext.request.contextPath}/home/join_terms.jsp">JOIN</a></li>
		</c:if>
		<%
			} else {
		%>

		<li><a
			href="${pageContext.request.contextPath}/member/mypage.jsp">MYPAGE</a></li>
		<li><a
			href="${pageContext.request.contextPath}/member/logout.jsp">LOGOUT</a></li>
		<li><span><%=session.getAttribute("sessionId")%>님</span></li>
		<%
			}
		%>
	</ul>
</nav>