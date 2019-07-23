package sharehobby.model.food;

import java.util.Date;

public class FoodPost {

	private int bf_num; // 게시글번호
	private int u_num; // 회원번호
	private int hf_num; // 식당코드
	private Date bf_time; // 시간
	private float bf_star; // 평점
	private String bf_cont; // 내용
	private String bf_photo; // 사진
	private String bf_title; // 글 제목
	private String u_id; // 아이디
	private int bf_hit; // 조회수

	private String hf_name; // 식당 이름
	private String hf_address; // 식당 주소
	private String hf_pnum; // 식당 전화번호
	private String hf_cont; // 내용
	
	
	public int getBf_hit() {
		return bf_hit;
	}
	public void setBf_hit(int bf_hit) {
		this.bf_hit = bf_hit;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getBf_num() {
		return bf_num;
	}
	public void setBf_num(int bf_num) {
		this.bf_num = bf_num;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public int getHf_num() {
		return hf_num;
	}
	public void setHf_num(int hf_num) {
		this.hf_num = hf_num;
	}
	
	public Date getBf_time() {
		return bf_time;
	}
	public void setBf_time(Date bf_time) {
		this.bf_time = bf_time;
	}
	public String getBf_cont() {
		return bf_cont;
	}
	public void setBf_cont(String bf_cont) {
		this.bf_cont = bf_cont;
	}
	public float getBf_star() {
		return bf_star;
	}
	public void setBf_star(float bf_star) {
		this.bf_star = bf_star;
	}
	public String getBf_photo() {
		return bf_photo;
	}
	public void setBf_photo(String bf_photo) {
		this.bf_photo = bf_photo;
	}
	public String getBf_title() {
		return bf_title;
	}
	public void setBf_title(String bf_title) {
		this.bf_title = bf_title;
	}
	
	public String getHf_name() {
		return hf_name;
	}
	public void setHf_name(String hf_name) {
		this.hf_name = hf_name;
	}
	public String getHf_address() {
		return hf_address;
	}
	public void setHf_address(String hf_address) {
		this.hf_address = hf_address;
	}
	public String getHf_pnum() {
		return hf_pnum;
	}
	public void setHf_pnum(String hf_pnum) {
		this.hf_pnum = hf_pnum;
	}
	public String getHf_cont() {
		return hf_cont;
	}
	public void setHf_cont(String hf_cont) {
		this.hf_cont = hf_cont;
	}
	
}
