<%@page import="sharehobby.service.food.ViewPostService"%>
<%@page import="sharehobby.service.food.WritePostService"%>
<%@page import="sharehobby.model.food.FoodPostList"%>
<%@page import="sharehobby.service.food.GetPostListService"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String bfNumstr = request.getParameter("bf_num");

	FoodPost post = null;
	
	int bf_num = 0;
	
	if (bfNumstr != null) {
		bf_num = Integer.parseInt(bfNumstr);
		
		ViewPostService service = ViewPostService.getInstance();
		post = service.viewPost(bf_num);
	}

	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 맛집 리뷰 작성</title>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
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
	<div class="wrap">
		<div id="title">
		<h1>리뷰 수정</h1>
		</div>
		<br><hr><br>
		<form action="FoodUpdatePostCheck.jsp" method="post">
			<table border="1" style="border-collase: collapse">
				<input type="hidden" name="bf_num" value="<%=bf_num%>">
				<tr>
					<th>제목</th>
					<td style="width: 500px;"><input type="text" value="<%=post.getBf_title()%>" name="bf_title"></td>
				</tr>
				<tr>
					<th>평점</th>
					<td><input type="text" value="<%=post.getBf_star() %>" name="bf_star"></td>
				</tr>
				<tr>
					<th>식당코드</th>
					<td><input type="text" value="<%=post.getHf_num()%>" name="hf_num"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="bf_cont" cols="100" rows="40"><%=post.getBf_cont()%></textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정완료"> <input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
		<br>
		<hr>
	</div>
	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>
</html>