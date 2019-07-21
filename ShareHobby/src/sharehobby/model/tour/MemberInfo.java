package sharehobby.model.tour;

public class MemberInfo {

	private int u_num;
	private String u_id;
	private String u_name;
	private String u_pw;
	private String u_pnum;
	private String u_photo;

	public MemberInfo() {

	}

	public MemberInfo(int u_num, String u_id, String u_name, String u_pw, String u_pnum, String u_photo) {
		super();
		this.u_num = u_num;
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_pw = u_pw;
		this.u_pnum = u_pnum;
		this.u_photo = u_photo;
	}

	public int getU_num() {
		return u_num;
	}

	public void setU_num(int u_num) {
		this.u_num = u_num;
	}

	public String getU_id() {
		return u_id;
	}

	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getU_pw() {
		return u_pw;
	}

	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}

	public String getU_pnum() {
		return u_pnum;
	}

	public void setU_pnum(String u_pnum) {
		this.u_pnum = u_pnum;
	}

	public String getU_photo() {
		return u_photo;
	}

	public void setU_photo(String u_photo) {
		this.u_photo = u_photo;
	}
	
	//리뷰 수정시 비밀번호 입력 후 수정간으
	public boolean hasu_pw() {
		return u_pw != null && !u_pw.isEmpty();
	}

	// 로그인시 회원가입 비밀번호와 비교
	public boolean matchu_id(String id) {
		return hasu_pw() && u_id.equals(id);

	}

	// MemberInfo 객체 -> LoginInfo 객체 반환
	public LoginInfo toLoginInfo() {
		return new LoginInfo(u_id,u_pw, u_name, u_photo);
	}

}
