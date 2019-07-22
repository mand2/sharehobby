<%@page import="java.sql.SQLException"%>
<%@page import="sharehobby.service.food.DeletePostService"%>
<%@page import="sharehobby.service.food.WritePostService"%>
<%@page import="sharehobby.model.food.FoodPostList"%>
<%@page import="sharehobby.service.food.GetPostListService"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String bf_numstr = request.getParameter("bf_num");
	int bf_num = 0;

	if (bf_numstr != null) {
		bf_num = Integer.parseInt(bf_numstr);
	} else {

	}

	// 서비스 객체 생성
	DeletePostService service = DeletePostService.getInstance();

	int resultCnt = service.deletePost(bf_num);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 맛집 리뷰 작성</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>

		<script>

	alert("삭제완료"); 
	
	
	
	location.href="FoodListPost.jsp";
	
	</script>
</body>
</html>




