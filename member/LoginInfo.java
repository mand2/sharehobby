package member;

public class LoginInfo {
	private int u_num;
	private String u_id;
	private String u_name;
	private String u_photo;
		
	public LoginInfo(int u_num, String u_id, String u_name, String u_photo) {
		super();
		this.u_num = u_num;
		this.u_id = u_id;
		this.u_name = u_name;
		this.u_photo = u_photo;
	}
	
	public int getU_num() {
		return u_num;
	}

	public String getU_id() {
		return u_id;
	}
	public String getU_name() {
		return u_name;
	}
	public String getU_photo() {
		return u_photo;
	}
	
	
}
