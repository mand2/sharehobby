package sharehobby.model.member;
/*-------------------
 * �����̸�: Exhibition.java
 * ���ϼ���: ����ȸ ��ü VO(model) 
 * �ۼ���: �質��
 * ����: 1.0.1
 * ��������: 2019-07-16 ���� 8�� 37��
 * ������������: 2019-07-17 ���� 11�� 35��
 * ����������: �質��
 * ������������: ���� �߰�
 * �䱸����: ����� ��ü�� member�� Hobby_exhibiton ����ؼ� ����ó���ʿ�
 * abbr: exhbit
 * -------------------*/

import java.util.Date;

public class BoardExhibition {
	
	
	private int be_num; //�Խñ۹�ȣ
	private int u_num; //ȸ����ȣ < member���� �����;��� session���� ����
	private String be_title; //����
	private Date be_time; //�ۼ��ð�
	private float be_star; //����
	private String be_cont; //����
	private String be_photo; //����
	private int be_hit; //��ȸ��
	
	
	
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