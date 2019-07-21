package sharehobby.model.exhb;
/*-------------------
 * 파일이름: ExhbitListView.java
 * 파일설명: 전시회 게시판 기본 VO(model) 
 * BoardExhibition객체가 모여서 만드는 게시판!
 * 작성자: 김나연
 * 버전: 1.0.0
 * 생성일자: 2019-07-16 오후 8시 50분
 * 최종수정일자: 2019-07-18 오전 12시 06분
 * 최종수정자: 김나연
 * 최종수정내용: 클래스 추가
 * abbr: exhbit
 * -------------------*/

import java.util.List;

public class ExhbListView {

	/*----------------------------변수설명-------------------------------*/
	private int msgTotalCnt; //게시글 전체 dao메서드로 넣어줄예정
	private int numPerPage; //페이지당 보여줄 게시글 수
	
	private int pageTotalCnt; //페이지수 >>계산가능>메서드이용
	private int curPageNum ; //현재페이지
	
	/*최신글 순으로 정렬하기 위한 변수*/
	private int first; //현재페이지에서 첫번째 줄
	private int last; //현재페이지에서 마지막 줄
	private List<BoardExhibition> msgList; //dao메서드로 넣어줄예정
	/*--------------------------------------------------------------------*/
	
	//생성자
	public ExhbListView(int msgTotalCnt, int numPerPage, int curPageNum, List<BoardExhibition> msgList, int first,
			int last) {
		super();
		this.msgTotalCnt = msgTotalCnt;
		this.numPerPage = numPerPage;
		this.curPageNum = curPageNum;
		this.msgList = msgList;
		this.first = first;
		this.last = last;
		calcPageTotalCnt();
	}
	
	
	//전체 페이지 수 계산
	private void calcPageTotalCnt() {
		
		if(msgTotalCnt == 0) {
			pageTotalCnt = 0;
		
		} else {
			pageTotalCnt = msgTotalCnt / numPerPage;
			if(msgTotalCnt % numPerPage > 0) {
				pageTotalCnt++;
			}
		}
	}
	
	public boolean isEmpty() {
		return msgTotalCnt == 0;
	}


	public int getMsgTotalCnt() {
		return msgTotalCnt;
	}


	public int getNumPerPage() {
		return numPerPage;
	}


	public int getPageTotalCnt() {
		return pageTotalCnt;
	}


	public int getCurPageNum() {
		return curPageNum;
	}


	public int getFirst() {
		return first;
	}


	public int getLast() {
		return last;
	}


	public List<BoardExhibition> getMsgList() {
		return msgList;
	}
	
	
}
