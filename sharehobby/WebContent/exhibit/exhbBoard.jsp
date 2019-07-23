<%@page import="sharehobby.model.exhb.BoardExhibition"%>
<%@page import="sharehobby.model.exhb.ExhbListView"%>
<%@page import="sharehobby.service.exhb.ShowExhbitService"%>
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
<link href="/sh/css/default_board_ny.css" rel="stylesheet" type="text/css">
<link href="/sh/css/search_board_ny.css" rel="stylesheet" type="text/css">
<script text="text/javascript" src="/sh/exhibit/searchChk.js"> </script>

<style>
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
	            <h2><a href="exhbBoard.jsp?page=1">전시회 관련 게시판 (총 <%= view.getMsgTotalCnt()%>개)</a></h2>
	            <span><a href="writeExhbit.jsp">글쓰기</a></span>
	        </div>

		<% 
		/*--show list of msg --*/
			for(BoardExhibition exhb : view.getMsgList()) {
				
				int be_num = exhb.getBe_num();
		%>
		
			<a href="detailReview.jsp?be_num=<%= be_num %>">
			<div class="review">
	            
	            <h6><%= exhb.getBe_num() %> 번째 글 | 조회수 <%= exhb.getBe_hit() %></h6>
	            <h3><%= exhb.getBe_title() %></h3>
				<span class="star">전시명 <%= service.getExhbInfo(be_num).getHe_name() %> | 평점 <%= exhb.getBe_star() %> </span>
				<span class="cont"><%= exhb.getBe_cont() %></span>
				<h5>
					작성시간 <%= exhb.getBe_time()%> | 작성자 <%= exhb.getU_num() %>
				</h5>
			</div>
			</a>
		<% 
			} 
		}%>
		
		<!-- page 네비게이션 시작 -->
			<div id="pageNav"> 
		<%
			for(int i = 1 ; i <= view.getPageTotalCnt(); i++){
		%>
			<a href="exhbBoard.jsp?page=<%= i%>"><%=i %></a>
		<%
			}
		%> 
			</div> 
		<!-- page 네비게이션 끝 -->
	
	<hr>
	
	<!-- 리뷰검색 -->
        <form action="searchReview.jsp" method="post">
        
        <!--formsubmit 옵션 줘야 함.-->
        <!--빈값 넣을 때 유효성검사-->
            <div id="sForm">
                <select id="opt" name="opt">
                    <option value="1">제목</option>   
                    <option value="2">내용</option>   
                    <option value="3">제목+내용</option>   
                </select>
                
                <input type="text" id="condition" name="condition" maxlength="25">
                <span id="submit" name="submit">검색</span> 
                <p></p>
            </div>
            
        </form>
    
	
	</div>
<!-- contents 끝 -->


<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>