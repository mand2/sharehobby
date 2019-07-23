package sharehobby.model.music;

import java.sql.Date;

/* 게시글 관련 정보*/
public class BoardPost extends MusicInfo{
	
	// 게시글 번호
	private int bmNum;
	// 게시글 제목
	private String bmTitle;
	// 회원번호
	private int uNum;
	// 회원아이디
	private String uId;
	// 게시글 작성시간
	private Date bmTime;
	// 게시글 평점
	private float bmStar;
	// 게시글 내용
	private String bmCont;
	// 게시글 조회수
	private int bmCnt;
	// 좋아요
	private int bmLike;
	
	public int getBmLike() {
		return bmLike;
	}

	public void setBmLike(int bmLike) {
		this.bmLike = bmLike;
	}

	public int getBmCnt() {
		return bmCnt;
	}

	public void setBmCnt(int bmCnt) {
		this.bmCnt = bmCnt;
	}

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
