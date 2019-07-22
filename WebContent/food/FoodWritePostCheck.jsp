<%@page import="sharehobby.service.food.WritePostService"%>
<%@page import="sharehobby.model.food.FoodPostList"%>
<%@page import="sharehobby.service.food.GetPostListService"%>
<%@page import="sharehobby.model.food.FoodPost"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 1. 폼으로 부터 데이터를 받는다.
	// 2. Message 객체에 저장 : useBean 액션테그
	// 3. WriteMessageService  객체 생성
	// 4. write 메서드 실행  : 1/0
%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="foodpost" class="sharehobby.model.food.FoodPost" />
<jsp:setProperty property="*" name="foodpost" />
<%
	WritePostService service = WritePostService.getInstance();
	int cnt = service.write(foodpost);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HOBBY - 맛집 리뷰 작성</title>
<link href="../css/default_css.css" rel="stylesheet" type="text/css">
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
	<script>
	
<% 
	
	if(cnt>0){
		
	%>
	alert("리뷰가 작성되었습니다."); 
	
	<%} else { %>
		alert("리뷰가 등록되지 않았습니다.");
		
		
	<%} %>
	
	location.href="FoodListPost.jsp";
	
	</script>
	
	<!-- contents 끝 -->
	
	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
	
</html>
