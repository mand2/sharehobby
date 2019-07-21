package sharehobby.model.tour;

public class LoginInfo {
	private String u_id;
	private String u_pw;
	private String u_name;
	private String u_photo;
	
	public LoginInfo(String u_id, String u_pw, String u_name, String u_photo) {
		super();
		this.u_id = u_id;
		this.u_pw = u_pw;
		this.u_name = u_name;
		this.u_photo = u_photo;
	}
	
	public String getU_id() {
		return u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public String getU_name() {
		return u_name;
	}
	public String getU_photo() {
		return u_photo;
	}
	
	
}

