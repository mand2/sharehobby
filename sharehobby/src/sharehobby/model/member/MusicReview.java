package sharehobby.model.member;

import java.sql.Date;

/* �Խñ� ���� ����*/
public class MusicReview {

	// �Խñ� ��ȣ
	private int bmNum;
	// �Խñ� ����
	private String bmTitle;
	// ȸ����ȣ
	private int uNum;
	// ȸ�����̵�
	private String uId;
	// �Խñ� �ۼ��ð�
	private Date bmTime;
	// �Խñ� ����
	private float bmStar;
	// �Խñ� ����
	private String bmCont;
	// �Խñ� ��ȸ��
	private int bmCnt;
	// ���ƿ�
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