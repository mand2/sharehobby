<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<link href="/sh/css/regform_css.css" rel="stylesheet" type="text/css">

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
		<h2>회원가입</h2>
		<form action="../member/signup.jsp" method="post">
			<div id="regForm">
				<!--input 의 width값을 길게 주면 아래 행으로 넘어가니까 효과 있음!-->
				<!--.inputbox는 박스 클릭시 색상 주기, .input은 width설정-->

				<div class="warning">
					<label for="id"><h4>아이디</h4></label> <span class="inputbox"><input
						id="id" name="u_id" class="input"></span>
					<h5></h5>
				</div>

				<div class="warning">
					<label for="pw"><h4>비밀번호</h4></label> <span class="inputbox"><input
						id="pw" name="u_pw" class="input"></span>
					<h5></h5>
				</div>

				<div class="warning">
					<label for="pw2"><h4>비밀번호 재확인</h4></label> <span class="inputbox"><input
						id="pw2" class="input"></span>
					<h5></h5>
				</div>

				<div class="warning">
					<label for="name"><h4>이름</h4></label> <span class="inputbox"><input
						id="name" name="u_name" class="input"></span>
					<h5></h5>
				</div>

				<div class="warning">
					<label for="phone"><h4>전화번호</h4></label> <span class="inputbox"><input
						id="phone" name="u_pnum" class="input"></span>
					<h5></h5>
				</div>

				<div class="warning">
					<label for="y"><h4>생년월일</h4></label>
					<div id="birthbox">
						<span class="inputbox birth"><input id="y" class="input"
							placeholder="연도"></span> <span class="inputbox birth"> <select
							id="m" class="input">
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
						</select>
						</span> <span class="inputbox birth"><input id="d" class="input"
							placeholder="날짜"></span>
					</div>
					<!--birthbox-->
					<h5></h5>
				</div>
				<!-- id pw 저장여부 -->
				<!--                <h4><input type="checkbox"> 아이디 저장 </h4> -->
				<input type="submit" value="회원가입">
			</div>
		</form>
	</div>

	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>

</html>