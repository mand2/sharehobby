package sharehobby.model;

import java.sql.Date;

/* 게시글 관련 정보*/
public class BoardPost extends MusicInfo{
	
	// 게시글 번호
	private int bmNum;
	// 게시글 제목
	private int uNum;
	// 회원번호
	// 음악코드
	private String bmTitle;
	// 게시글 작성시간
	private String uId;
	private Date bmTime;
	// 게시글 평점
	private float bmStar;
	// 게시글 내용
	private String bmCont;
	
	public int getuNum() {
		return uNum;
	}
	
	public void setuNum(int uNum) {
		this.uNum = uNum;
	}
	public String getuId() {
		return uId;
	}
	
	public void setuId(String uId) {
		this.uId = uId;
	}
	public int getBmNum() {
		return bmNum;
	}
	public void setBmNum(int bmNum) {
		this.bmNum = bmNum;
	}
	public String getBmTitle() {
		return bmTitle;
	}
	public void setBmTitle(String bmTitle) {
		this.bmTitle = bmTitle;
	}
	public Date getBmTime() {
		return bmTime;
	}
	public void setBmTime(Date bmTime) {
		this.bmTime = bmTime;
	}
	public float getBmStar() {
		return bmStar;
	}
	public void setBmStar(float bmStar) {
		this.bmStar = bmStar;
	}
	public String getBmCont() {
		return bmCont;
	}
	public void setBmCont(String bmCont) {
		this.bmCont = bmCont;
	}
	
}
