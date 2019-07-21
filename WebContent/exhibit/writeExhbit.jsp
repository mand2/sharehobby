<%@page import="sharehobby.model.exhb.Exhibition"%>
<%@page import="sharehobby.dao.exhb.ExhibitionDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<%
	String u_id = (String)session.getAttribute("u_id");

	Connection conn = ConnectionProvider.getConnection();
	ExhibitionDao dao = ExhibitionDao.getInstance(); 
	
	int u_num = dao.find_uNum(conn, u_id);
	
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기_전시::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/write_board_ny.css" rel="stylesheet" type="text/css">

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
	    <h2>전시회 후기 쓰기</h2>
	</div>
	
	<form action="writeExhbit_p.jsp" method="post">
        <input type="hidden" name="u_num" value=<%=u_num %>>
        <div id="regForm">
        	<div class="warning">
                    <label for="he_num"><h4>전시명</h4></label>
                    <span class="inputbox">
                        <select name="he_num" id="he_num">
                        	<option selected="selected" disabled="disabled">선택하세요</option>
						<%
						/*--show list of msg --*/					
							for(Exhibition exhb : dao.showEnumList(conn)) {
						%>
                            <option value="<%= exhb.getHe_num()%>"><%= exhb.getHe_name() %> | <%= exhb.getHe_artist()%> </option>
						<% } %>
                        </select>
                    </span>
                    <h5></h5>
                </div>
                
                <div class="warning">
                    <label for="be_title"><h4>제목</h4></label>
                    <span class="inputbox"><input type="text" name="be_title" id="be_title"></span>
                    <h5></h5>
                </div>
                
                <div class="warning">
                    <label for="be_star"><h4>평점</h4></label>
                    <span class="inputbox">
                        <select name="be_star" id="be_star">
                            <option selected="selected" disabled="disabled">선택하세요</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </span>
                    <h5></h5>
                </div>
                
                <div class="warning">
                    <label for="name"><h4>내용</h4></label>
                    <span class="inputbox">
                            <textarea name="be_cont" id="be_cont"></textarea>
                    </span>
                    <h5></h5>
                </div>
                
                <div class="warning">
                    <label for="phone"><h4>사진</h4></label>
                    <span class="inputbox"><input type="file" name="be_photo"class="input"></span>
                    <h5></h5>
                </div>
                
                <input type="submit" value="제출">
            </div>
        </form>
    </div>
        
<!-- contents 끝 -->
		
<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</form>
</body>
</html>