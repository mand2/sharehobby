package sharehobby.model.member;

import java.sql.Date;

/* 게시글 관련 정보*/
public class MusicReview {

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
	
	public int getBmNum() {
		return bmNum;
	}
	public String getBmTitle() {
		return bmTitle;
	}
	public int getuNum() {
		return uNum;
	}
	public String getuId() {
		return uId;
	}
	public Date getBmTime() {
		return bmTime;
	}
	public float getBmStar() {
		return bmStar;
	}
	public String getBmCont() {
		return bmCont;
	}
	public int getBmCnt() {
		return bmCnt;
	}
	public int getBmLike() {
		return bmLike;
	}

	

}