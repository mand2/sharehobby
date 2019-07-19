<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<link href="/sh/css/regform_css.css" rel="stylesheet" type="text/css">

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

    <div class = "wrap">
        <h2>로그인</h2>
        <form action="../member/loginProcess.jsp" method="post">
            <div id="regForm">
                <!--input 의 width값을 길게 주면 아래 행으로 넘어가니까 효과 있음!-->
                <!--.inputbox는 박스 클릭시 색상 주기, .input은 width설정-->
                
                <div class="warning">
                    <label for="id"><h4>아이디</h4></label>
                    <span class="inputbox"><input id="id" name="u_id" class="input"></span>
                    <h5></h5>
                </div>
                
                <div class="warning">
                    <label for="pw"><h4>비밀번호</h4></label>
                    <span class="inputbox"><input id="pw" name="u_pw" class="input"></span>
                    <h5></h5>
                </div>
                <!-- id pw 저장여부 -->
				<h4><input type="checkbox"> 아이디 저장 </h4> 
                <input type="submit" value="로그인">
            </div>
        </form>
    </div>
    
<!-- contents 끝 -->


<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>

</html>