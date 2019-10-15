#  share hobby
프로젝트 주제 : 취미 공유 커뮤니티  
학업과 직무에 지친 2030들의 취미(맛집/여행/전시/음악) 후기를 공유하는 공간



**작성자**    
@[mand2](https://github.com/mand2) / 개인 포트폴리오 용으로 작성



#### 참여자 & 담당 부분

* 김나연 @[mand2](https://github.com/mand2)

  전시회 게시판 CRUD + 댓글 CRUD + 카카오MAP API
  
* 권용민 @[kytsaaa6](https://github.com/kytsaaa6)

  여행 게시판 CRUD + TOUR API
  
* 송주은 @[son9zuen](https://github.com/son9zuen)

  회원관리 CRUD
  
* 주예리나 @[orongee22](https://github.com/orongee22)

  음악 게시판 CRUD
  
* 한혜원 @[hhw9797](https://github.com/hhw9797)

  맛집 게시판 CRUD


#### 1. 기술/구조

* 웹표준

* `HTML5`  
  * `CSS3`  
  * `JavaScript`  
  * `jQuery`  
  * `Bootstrap4`
  
* Tomcat 컨테이너 사용

* DBMS - `ORACLE SQL`

* `JSP` , `EL`

* 다양한 API 사용  
  * Tour API 여행정보 API  
  * KAKAO MAP API 카카오 맵 API
  
* DB 구조도  
  ![DB 구조도](https://github.com/mand2/sharehobby/blob/master/%EB%8D%B0%EC%9D%B4%ED%84%B0%EB%B2%A0%EC%9D%B4%EC%8A%A4%EA%B5%AC%EC%A1%B0%EB%8F%84.png)
  
* 간단  구조도  
![간단 구조도](https://github.com/mand2/sharehobby/blob/master/structure.jpg)


#### 2. 버전설명

* 자세한 사항은 본 repository의 커밋내역과 ny branch 커밋내역 참고
* **v0** 
  * 프로젝트 기획, 업무 분담  
  * DB erd로 테이블 구조 설정  
* **v1**(  [관련 커밋 링크로 가기](https://github.com/mand2/sharehobby/commit/59522cec490394b7ec93001ad02bb9594dd54abd) )   
  * 전시 게시판 리스트 및 후기작성  
    *  DAO + model + service +  view 
  * 기본적인 css 작성 + 공유  
  * 회원관리 member class 연결 
* **v2** ( [관련 커밋 링크로 가기](https://github.com/mand2/sharehobby/commit/b0e3d31a678122947829399d276198e4549d8f86) )  
  * 게시판 수정 및 삭제 작성 (작성자만 가능하게)  
    * DAO + model + service + view  
    * 삭제: `ajax` 를 이용  
  * AWS DBCP POOL max 변경  
  * 자세한 게시글 보기(상세후기) 페이지  
  * 전시회 EXHIBITION DB 의 요소 연결 
* **v3** ( [관련 커밋 링크로 가기](https://github.com/mand2/sharehobby/commit/d2d58ef5e4b5b0e3c396ad3be9b52504054efc22) )  
  * 게시판 댓글 구현  
    * DAO + model + service + view  
    * ORACLE 계층 쿼리를 이용 
* **v4**  
  * 전체 통합





#### 3 구현 중 겪었던 어려움

* 서버연결이 불안정하여 프로젝트 클린:   
  * 배포된 이미지 파일이 사라지는 경우 발생   
  * chrome cookie & cache 등 삭제로 대처
    

* aws RDS의 불필요한 커넥션이 많아짐  
  * JDBC DBCP POOL의 MAX를 조절 (50 -> 10)  
  * POOL Close를 하여 대처

    

* 댓글 기능 구현  
  * ORACLE 의 계층쿼리를 이용 (LEVEL)  
  * parent number ( `bc_parent ` )를 사용하여 depth 설정  
  * 대댓글 대대댓글 같은 댓글을 front에서 보여줄 때 width 설정

* 검색 기능 구현  
  * 내용의 타입이 LONG 타입으로, 검색이 어려움  
  * TEXT 타입으로 설정했어야 했음 





#### 프로젝트 설명 PPT [링크](https://github.com/mand2/sharehobby/blob/0b0cbb21cb2760c088de3d4a7018e0f701a7505c/shareHobby%EB%B0%9C%ED%91%9Cppt.pdf)

* 각 기능 설명
* 구현 중 어려웠던 점
* 개선사항



