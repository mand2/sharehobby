<%@page import="sharehobby.model.BoardExhibition"%>
<%@page import="sharehobby.model.ExhbListView"%>
<%@page import="sharehobby.service.ShowExhbitService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8"); 
	String pageNumStr = request.getParameter("page");
	
	int curPageNum = 1; //초기화-처음들어갈 때 무조건 첫 페이지화면
	
	if(pageNumStr != null){
		curPageNum = Integer.parseInt(pageNumStr);
	}
	
	ShowExhbitService service = ShowExhbitService.getInstance();
	
	ExhbListView view = 
	service.getMsgListView(curPageNum);
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판_전시::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_board.css" rel="stylesheet" type="text/css">


<style>
*{margin: 0; padding: 0}
div{width: 400px;}
</style>
</head>
<body>

<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- header 시작 -->
	<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->


<!-- contents 시작 -->    
	<% 
		if(view.isEmpty()){ 
	%> 
		<h4>등록된 메세지 없음</h4>
	<% } else { 
		%>
		<div class = "wrap">
        
	        <div id="title">
	            <h2>전시회 관련 게시판 (총 <%= view.getMsgTotalCnt()%>개)</h2>
	            <span> 글쓰기 </span>
	        </div>
	   
		
		<% 
		/*--show list of msg --*/
			for(BoardExhibition exhb : view.getMsgList()) {
		%>
		<div class="review">
            
            <h6><%= exhb.getBe_num() %> 번째 글</h6>
            <h3><%= exhb.getBe_title() %></h3>
			<span class="star">전시코드 <%= exhb.getHe_num() %> | 평점 <%= exhb.getBe_star() %> </span>
			<span class="cont"><%= exhb.getBe_cont() %></span>
			<h5>
				작성시간 <%= exhb.getBe_time()%> | 작성자 <%= exhb.getU_num() %>
			</h5>
		</div>
		<% 
			} 
		}%>
		
		<div id="pageNav"> 
	<%
		for(int i = 1 ; i <= view.getPageTotalCnt(); i++){
	%>
		<a href="exhbBoard.jsp?page=<%= i%>"><%=i %></a>
	<%
		}
	%> 
		</div> 
	<hr>
	</div>
<!-- contents 끝 -->


<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>