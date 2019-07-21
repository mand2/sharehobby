package sharehobby.model.tour;

import java.util.Date;

public class Board {

	private int pk;
	private String u_id;
	private String title;
	private String content;
	private String photo;
	private float star;
	
	
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public int getPk() {
		return pk;
	}
	public void setPk(int pk) {
		this.pk = pk;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public float getStar() {
		return star;
	}
	public void setStar(float star) {
		this.star = star;
	}

	
	
	
	
}
