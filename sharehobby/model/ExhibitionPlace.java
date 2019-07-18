package sharehobby.model;
/*-------------------
 * 파일이름: ExhibitionPlace.java
 * 파일설명: 전시회 상위클래스인 전시장소 VO(model) 
 * 작성자: 김나연
 * 버전: 1.0.2
 * 생성일자: 2019-07-16 오후 8시 37분
 * 최종수정일자: 2019-07-16 오후 8시 37분
 * 최종수정자: 김나연
 * 최종수정내용: 내용 추가
 * abbr: exhbit
 * -------------------*/
public class ExhibitionPlace {
	
	private int e_num;
	private String e_name;
	private String e_address;
	private String e_pnum;
	
	
	
	public void setE_num(int e_num) {
		this.e_num = e_num;
	}
	public int getE_num() {
		return e_num;
	}
	public String getE_name() {
		return e_name;
	}
	public String getE_address() {
		return e_address;
	}
	public String getE_pnum() {
		return e_pnum;
	}
	
	
	
}
