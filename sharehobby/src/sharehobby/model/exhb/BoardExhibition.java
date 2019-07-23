package sharehobby.model.exhb;
/*-------------------
 * 파일이름: Exhibition.java
 * 파일설명: 전시회 객체 VO(model) 
 * 작성자: 김나연
 * 버전: 1.0.1
 * 생성일자: 2019-07-16 오후 8시 37분
 * 최종수정일자: 2019-07-17 오전 11시 35분
 * 최종수정자: 김나연
 * 최종수정내용: 내용 추가
 * 요구사항: 연결될 객체인 member와 Hobby_exhibiton 사용해서 변경처리필요
 * abbr: exhbit
 * -------------------*/

import java.util.Date;

public class BoardExhibition extends Exhibition{
	
	
	private int be_num; //게시글번호
	private int u_num; //회원번호 < member에서 가져와야함 session에서 연결
	private String be_title; //제목
	private Date be_time; //작성시간
	private float be_star; //평점
	private String be_cont; //내용
	private String be_photo; //사진
	private int be_hit; //조회수
	
	
	
	public int getBe_hit() {
		return be_hit;
	}
	public void setBe_hit(int be_hit) {
		this.be_hit = be_hit;
	}
	public int getBe_num() {
		return be_num;
	}
	public void setBe_num(int be_num) {
		this.be_num = be_num;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public String getBe_title() {
		return be_title;
	}
	public void setBe_title(String be_title) {
		this.be_title = be_title;
	}
	public Date getBe_time() {
		return be_time;
	}
	public void setBe_time(Date be_time) {
		this.be_time = be_time;
	}
	public float getBe_star() {
		return be_star;
	}
	public void setBe_star(float be_star) {
		this.be_star = be_star;
	}
	public String getBe_cont() {
		return be_cont;
	}
	public void setBe_cont(String be_cont) {
		this.be_cont = be_cont;
	}
	public String getBe_photo() {
		return be_photo;
	}
	public void setBe_photo(String be_photo) {
		this.be_photo = be_photo;
	}
	
	
	
}
