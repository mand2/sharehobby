package sharehobby.model.member;
/**
 /**
 * �����̸�: BoardComment.java
 * ���ϼ���: �Խñ��� '���'�� ����� ��ü 
 * �ۼ���: �質��
 * ����: 1.0.2
 * ��������: 2019-07-21 ���� 1�� 57��
 * ������������: 2019-07-21 ���� 1�� 57��
 * ����������: �質��
 * ������������: Ŭ���� ���� �� ���� �ۼ� 
 */
import java.util.Date;

public class BoardComment extends BoardExhibition{
	
	private int bc_num; //��۹�ȣ
	private String bc_cont; //��۳���
	/* private int be_num; �Խñ۹�ȣ�� �������ó��*/
	private int u_num; //�ۼ��� ��ȣ
	private Date bc_date; //�ۼ��� 
	private int bc_parent; //�θ�� -depth
	private int bc_level; //level��
	
	
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