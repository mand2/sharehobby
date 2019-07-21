package sharehobby.model.exhb;
/**
 * 파일이름: BoardComment.java
 * 파일설명: 게시글의 '댓글'을 만드는 객체 
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-21 오후 1시 57분
 * 최종수정일자: 2019-07-21 오후 1시 57분
 * 최종수정자: 김나연
 * 최종수정내용: 클래스 생성 및 내용 작성 
 */
import java.util.Date;

public class BoardComment extends BoardExhibition{
	
	private int bc_num; //댓글번호
	private String bc_cont; //댓글내용
	/* private int be_num; 게시글번호는 상속으로처리*/
	private int u_num; //작성자 번호
	private Date bc_date; //작성일 
	private int bc_parent; //부모글 -depth
	private int bc_level; //level임
	
	
	public int getBc_num() {
		return bc_num;
	}
	public void setBc_num(int bc_num) {
		this.bc_num = bc_num;
	}
	public String getBc_cont() {
		return bc_cont;
	}
	public void setBc_cont(String bc_cont) {
		this.bc_cont = bc_cont;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public Date getBc_date() {
		return bc_date;
	}
	public void setBc_date(Date bc_date) {
		this.bc_date = bc_date;
	}
	public int getBc_parent() {
		return bc_parent;
	}
	public void setBc_parent(int bc_parent) {
		this.bc_parent = bc_parent;
	}
	public int getBc_level() {
		return bc_level;
	}
	public void setBc_level(int bc_level) {
		this.bc_level = bc_level;
	}
	
	
	
}
