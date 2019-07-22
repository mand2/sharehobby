/**
 * 파일이름: check_join_terms.js
 * 파일설명: 회원가입시 개인정보 등 정보제공동의 체크하는 스크립트임 
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-18 오전 5시 37분
 * 최종수정일자: 2019-07-18 오전 5시 37분
 * 최종수정자: 김나연
 * 최종수정내용: 스크립트 작성 
 */
$(document).ready(function(){
        
        /*체크박스-전체동의*/
        $('#all_check').change(function(){
            
            var chk = $(this).prop('checked');
            
            if(chk){
                $('#terms input').prop('checked', true);
                
                $('#all label').css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png)');
                
                $('#check label').css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_chcek_on_s_20.png)');
            }else {
                $('#terms input').prop('checked', false);
                
                $('#all label').css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_check_off_24.png)');
                
                $('#check label').css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_chcek_off_s_20.png)');
            }
        });
        
        /*체크박스-개별동의*/
        $('#check input').change(function(){
            var chk = $(this).prop('checked');
            
            if(chk){
                $(this).next().css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_chcek_on_s_20.png)');
            }else {
                $(this).next().css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_chcek_off_s_20.png)');
            }
            
            /*다 동의선택하면 전체동의 표시해주기*/
            if($('#check1').prop('checked') && $('#check2').prop('checked') && $('#check3').prop('checked') && $('#check4').prop('checked')){
                
                $('#all input').prop('checked', true);
                
                $('#all label').css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_check_on_l_24.png)');
            } else {
                $('#all input').prop('checked', false);
                
                $('#all label').css('background-image', 'url(https://static.nid.naver.com/images/ui/myinfo/pc_check_off_24.png)');
            }
        });
       
        /*유효성검사 validate and prevent auto submit*/
        $('form').submit(function(){
            var chk1 = $('#check1').prop('checked');
            var chk2 = $('#check2').prop('checked');
            
            if(chk1 && chk2) {
                $('#regForm p').css('display', 'none');
                return true;
            }else{
                $('#regForm p').css('display', 'block');
                return false;
            }
        });
    });