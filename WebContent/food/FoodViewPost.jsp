<%@page import="sharehobby.model.food.FoodStore"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@page import="sharehobby.service.food.ViewPostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

	int bf_num = 0;
	
	String str = request.getParameter("bf_num");

	if (str != null) {
		bf_num = Integer.parseInt(str);
	}

	ViewPostService service = ViewPostService.getInstance();
	FoodPost foodpost = service.viewPost(bf_num);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 맛집 :: <%=foodpost.getBf_title()%></title>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
</head>
<body>

	<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp"%>
	<!-- nav 끝 -->

	<!-- header 시작 -->
	<%@ include file="../frame/header.jsp"%>
	<!-- header 끝 -->

	<!-- contents 시작 -->

	<div id="main">
		<div class="wrap">
		<table>
			<tr>
				<td>제 목</td>
				<td><%=foodpost.getBf_title()%></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><%=foodpost.getU_id()%></td>
			</tr>
			<tr>
				<td>평 점</td>
				<td><%=foodpost.getBf_star()%></td>
			</tr>
			<tr>
				<td>식당이름</td>
				<td><%=foodpost.getHf_name()%></td>
			</tr>
			<tr>
				<td>식당주소</td>
				<td><%=foodpost.getHf_address()%></td>
			</tr>
			<tr>
				<td>식당 전화번호</td>
				<td><%=foodpost.getHf_pnum()%></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td><%=foodpost.getBf_cont()%></td>
			</tr>
			<tr>
				<td>사진</td>
				<td><%=foodpost.getBf_photo()%></td>
			</tr>
		</table>

		</div>
		<a href="FoodDeletePost.jsp?bf_num=<%=foodpost.getBf_num()%>">삭제하기</a>
		<a href="FoodUpdatePost.jsp?bf_num=<%=foodpost.getBf_num()%>">수정하기</a>

	</div>
	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->

</body>
</html>