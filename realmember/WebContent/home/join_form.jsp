<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join::Share Hobby!</title>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<link href="/sh/css/regform_css.css" rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script>
	$(document).ready(function() {
						$('#chkBtn').click(function(){
							location.href="../member/joinCheck.jsp";
						});
						
						for (var i = 1; i <= 12; i++) {
							$('#m').append('<option>' + i + '월</option>')
						}

						$('.inputbox').focus(
								function() {
									$(this).closest('.inputBox').css(
											'border-color', '#08a600');
								});
						$('.inputbox')
								.focusout(
										function() {
											$(this).closest('.inputBox').css(
													'border-color', '#dadada');
											$('#idbox')
													.focusout(
															function() {
																//5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.
																var pattern = /[a-z0-9_-]{5,20}/;
																if ($(this)
																		.val().length > 0) {
																	if (pattern
																			.test($(
																					this)
																					.val())
																			&& $(
																					this)
																					.val().length < 21) {
																		$(
																				'#idbox h5')
																				.html(
																						'<h5>멋진 아이디네요!</h5>')
																				.css(
																						'color',
																						'#08A600');
																	} else {
																		$(
																				'#idbox h5')
																				.html(
																						'<h5>5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.</h5>')
																				.css(
																						'color',
																						'red');
																		restric[$(
																				this)
																				.attr(
																						'id')] = 0;
																	}
																	;
																} else {
																	$(
																			'#idbox h5')
																			.html(
																					'<h5>필수사항</h5>')
																			.css(
																					'color',
																					'red');
																}
															})

										});

					});

	function joinCheck() {

		var id = $('#id').val();
		$.ajax({
			type : 'POST',
			url : 'join_form.jsp',
			data : {
				u_id : u_id
			},
			success : function(result) {
				if (result == 1) {
					$('#idbox h5').html("you can use this ID");
				} else {
					$('#idbox h5').html("you can not use this ID");
				}
			}
		})
	}

</script>
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
		<form action="../member/signup.jsp" method="post" >
			<div id="regForm">
				<!--input 의 width값을 길게 주면 아래 행으로 넘어가니까 효과 있음!-->
				<!--.inputbox는 박스 클릭시 색상 주기, .input은 width설정-->

				<div id="idbox" class="warning">
					<label for="id"><h4>아이디</h4></label> <span class="inputbox"><input
						id="id" name="u_id" class="input form-control"></span>
					<h5></h5>
				</div>
				<input type="botton" id="chkBtn" value="아이디중복">
				<div class="warning">
					<label for="pw"><h4>비밀번호</h4></label> <span class="inputbox"><input
						id="pw" name="u_pw" class="input"></span>
					<h5></h5>
				</div>

				<div id="pwbox" class="warning">
					<label for="pw2"><h4>비밀번호 재확인</h4></label> <span class="inputbox"><input
						id="pw2" name="u_pw2" class="input"></span>
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
								<option>월</option>
								<!--<option value="1">1월</option>
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
								<option value="12">12월</option> -->
						</select>
						</span> <span class="inputbox birth"><input id="d" class="input"
							placeholder="날짜"></span>
					</div>
					<!--birthbox-->
					<h5></h5>
				</div>
				<!-- id pw 저장여부 -->
				<!--                <h4><input type="checkbox"> 아이디 저장 </h4> -->
				<input type="submit" id="joinBtn" value="회원가입">
			</div>
		</form>
	</div>

	<!-- contents 끝 -->


	<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp"%>
	<!-- footer 끝 -->
</body>

</html>