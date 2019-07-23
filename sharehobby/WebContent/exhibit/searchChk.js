/**
 * 파일이름: searchCheck.js
 * 파일설명: 전시회 관련 검색시 유효성검사 
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-19 오후 5시 27분
 * 최종수정일자: 2019-19 오후 5시 27분
 * 최종수정자: 김나연
 * 최종수정내용: 스크립트 작성 
 */


$(document).ready(function(){
                      
        $('#submit').click(function(){
            
            var con = $('#condition').val();
                        
            if(con.length < 1){
                $('#submit+p').html('빈칸으로 입력할 수 없습니다.');
            }
        
            else if(con.length < 2){
                $('#submit+p').html('두 글자 이상 검색가능');
            } else {
                $('#submit+p').html('');
                $('form').submit();
            }
        });
    });