<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>terms::Share Hobby!</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="/sh/css/default_css.css" rel="stylesheet" type="text/css">
<link href="/sh/css/regform_terms.css" rel="stylesheet" type="text/css">
<script text="text/javascript" src="/sh/home/check_join_terms.js"> </script>
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
        <h2>회원가입</h2>
        <form>
            <div id="regForm">
                <!--input 의 width값을 길게 주면 아래 행으로 넘어가니까 효과 있음!-->
                <!--.inputbox는 박스 클릭시 색상 주기, .input은 width설정-->
                
                <div id="terms">
                    <div id="all">
                        <input id="all_check" type="checkbox">
                        <label for="all_check">
                            <span id="all_check_span">
                                전체 동의
                            </span>
                        </label>
                    </div>

                    <div id="check">
                        <div class="check">
                        <input id="check1" type="checkbox">
                        <label for="check1">
                            <span>
                                Let's Beer 이용약관 동의
                            </span>
                            <span class="necessary">
                                (필수)
                            </span>
                        </label>
                        </div>
                        <div class="check">
                            <input id="check2" type="checkbox">
                            <label for="check2">
                                <span>
                                    개인정보 수집 및 이용 동의
                                </span>
                                <span class="necessary">
                                    (필수)
                                </span>
                            </label>
                        </div>
                        <div class="check">
                            <input id="check3" type="checkbox">
                            <label for="check3">
                                <span>
                                    위치정보 이용약관 동의
                                </span>
                                <span class="select">
                                    (선택)
                                </span>
                            </label>
                        </div>
                        <div class="check">
                            <input id="check4" type="checkbox">
                            <label for="check4">
                                <span>
                                    프로모션 안내 메일 수신
                                </span>
                                <span class="select">
                                    (선택)
                                </span>
                            </label>
                        </div>

                    </div>
                </div>
                <p>필수 사항에 동의해주세요</p>
                <input type="submit" value="동의합니다">
            </div>
        </form>
    </div>
    
<!-- contents 끝 -->


<!-- footer 시작 -->
	<%@ include file="../frame/footer.jsp" %>
<!-- footer 끝 -->
</body>
</html>