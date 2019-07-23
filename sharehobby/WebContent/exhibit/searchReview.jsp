<%@page import="sharehobby.dao.exhb.ExhibitionDao"%>
<%@page import="sharehobby.model.exhb.BoardExhibition"%>
<%@page import="java.util.List"%>
<%@page import="sharehobby.service.exhb.SearchMsgService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page trimDirectiveWhitespaces="true" %>    
<% 
	request.setCharacterEncoding("utf-8"); 

	int opt = Integer.parseInt(request.getParameter("opt"));
	String condition = request.getParameter("condition");
	
	SearchMsgService service = SearchMsgService.getInstance();
	
	/* List<BoardExhibition> list = service.searchMsg(opt, condition); */
	
	int resultCnt = service.searchCnt(opt, condition);
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전시리뷰검색::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/sh/css/default_board_ny.css" rel="stylesheet" type="text/css">
<link href="/sh/css/search_board_ny.css" rel="stylesheet" type="text/css">
<script text="text/javascript" src="/sh/exhibit/searchChk.js"> </script>

<style></style>
</head>
<body>

<!-- nav 시작 -->
	<%@ include file="../frame/nav.jsp" %>
<!-- nav 끝 -->

<!-- header 시작 -->
	<%@ include file="../frame/header.jsp" %>
<!-- header 끝 -->


<!-- contents 시작 -->   

	<div class = "wrap">
		<div id="title">
	            <h2>전시회 관련 게시판 (총 <%= resultCnt %>개)</h2>
	            <span><a href="exhbBoard.jsp">목록</a></span>
	    </div>
		<% 
		/*--show list of msg --*/
			for(BoardExhibition exhb : service.searchMsg(opt, condition)) {
		%>
		
		<a href="detailReview.jsp?be_num=<%= exhb.getBe_num() %>">
		<div class="review">
            
            <h6><%= exhb.getBe_num() %> 번째 글 | 조회수 <%= exhb.getBe_hit() %></h6>
            <h3><%= exhb.getBe_title() %></h3>
			<span class="star">전시코드 <%= exhb.getHe_num() %> | 평점 <%= exhb.getBe_star() %> </span>
			<span class="cont"><%= exhb.getBe_cont() %></span>
			<h5>
				작성시간 <%= exhb.getBe_time()%> | 작성자 <%= exhb.getU_num() %>
			</h5>
		</div>
		</a>
		<% 
			} 
		%>
		
	
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