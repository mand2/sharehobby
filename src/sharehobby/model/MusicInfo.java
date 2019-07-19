package sharehobby.model;

public class MusicInfo extends AlbumInfo {
	// 
	private int hmNum; // 음악코드
	private String hmTitle; // 노래제목
	private String hmLyc; // 노래 가사
	
	
	public int getHmNum() {
		return hmNum;
	}
	public void setHmNum(int hmNum) {
		this.hmNum = hmNum;
	}
	public String getHmTitle() {
		return hmTitle;
	}
	public void setHmTitle(String hmTitle) {
		this.hmTitle = hmTitle;
	}
	public String getHmLyc() {
		return hmLyc;
	}
	public void setHmLyc(String hmLyc) {
		this.hmLyc = hmLyc;
	}
}
