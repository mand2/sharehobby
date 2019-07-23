
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="nav">
	<ul>
		<li><a href="${pageContext.request.contextPath}/home/home.jsp">HOME</a></li>

		<%
			if (session.getAttribute("u_id") == null) {
		%>
		<c:if test="${loginInfo == null}">
			<li><a href="${pageContext.request.contextPath}/home/login.jsp">LOGIN</a></li>
			<li><a
				href="${pageContext.request.contextPath}/home/join_terms.jsp">JOIN</a></li>
		</c:if>
		<%
			} else {
		%>
		
		<li>
			<a href="${pageContext.request.contextPath}/food/FoodMain.jsp">FOOD</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/music/exhbBoard.jsp">MUSIC</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/exhibit/exhbBoard.jsp">EXHIBIT</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/tour/tourinfo/tourmain.jsp">TOUR</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/member/member.jsp">MEMBER</a>
		</li>

		<li>
			<a href="${pageContext.request.contextPath}/member/mypage.jsp">MYPAGE</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/member/logout.jsp">LOGOUT</a>
		</li>
		<li><span><%=session.getAttribute("u_id")%>님</span></li>
		<%
			}
		%>
	</ul>
</nav>