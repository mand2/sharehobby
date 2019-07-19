package sharehobby.model;

import java.util.List;

public class BoardMusicList {
	private int postTotalCount; // 전체 게시글 갯수

	private int currentPageNumber; // 현재 페이지 번호
	private List<BoardPost> postList; // 전체 게시글 리스트
	private int pageTotalCount; // 페이지 전체 번호
	private int postCountPerPage; // 페이지 내에서 보여줄 게시글 갯수
	private int startRow;
	private int endRow;
	
	
	public BoardMusicList(int postTotalCount, int currentPageNumber, List<BoardPost> postList, 
			int postCountPerPage, int startRow, int endRow) {
		super();
		this.postTotalCount = postTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.postList = postList;
		this.postCountPerPage = postCountPerPage;
		this.startRow = startRow;
		this.endRow = endRow;
		
		calculatePageTotalCount();
	}

	// 페이지 번호 계산하는 메소드
	private void calculatePageTotalCount() {
		// 만약 전체 게시글 갯수가 0이라면?
		if(postTotalCount == 0) {
			// 페이지 전체 번호 또한 0
			pageTotalCount = 0;
		} else {
			// 페이지 번호 = 전체 게시글 갯수 / 페이지 내에서 보여줄 게시글 갯수
			pageTotalCount = postTotalCount / postCountPerPage;
			
			// 나눴을 때 남은 페이지 값이 0보다 크다면 페이지 번호 하나 더 추가
			if(postTotalCount % postCountPerPage > 0) {
				pageTotalCount++;
			}				
		}		
	}
	
	
	public int getPostTotalCount() {
		return postTotalCount;
	}
	
	public void setPostTotalCount(int postTotalCount) {
		this.postTotalCount = postTotalCount;
	}
	
	public int getCurrentPageNumber() {
		return currentPageNumber;
	}
	
	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}
	
	public List<BoardPost> getPostList() {
		return postList;
	}
	
	public void setPostList(List<BoardPost> postList) {
		this.postList = postList;
	}
	
	public int getPageTotalCount() {
		return pageTotalCount;
	}
	
	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}
	
	public int getPostCountPerPage() {
		return postCountPerPage;
	}
	
	public void setPostCountPerPage(int postCountPerPage) {
		this.postCountPerPage = postCountPerPage;
	}
	
	public int getStartRow() {
		return startRow;
	}
	
	public void setFirstRow(int startRow) {
		this.startRow = startRow;
	}
	
	public int getEndRow() {
		return endRow;
	}
	
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
	public boolean isEmpty() {
		return pageTotalCount == 0;
	}
	
}
