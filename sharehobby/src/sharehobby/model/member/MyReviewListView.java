package sharehobby.model.member;

import java.util.List;

public class MyReviewListView {
	private int myReviewTotalCount;
	private int currentPageNumber;
	private List<MusicReview> myReviewList;
	private int pageTotalCount;
	private int myReviewCountPerPage;
	private int firstRow;
	private int endRow;
	
	
	
	public MyReviewListView(int myReviewTotalCount, int currentPageNumber, List<MusicReview> myReviewList,
			int pageTotalCount, int firstRow, int endRow) {
		super();
		this.myReviewTotalCount = myReviewTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.myReviewList = myReviewList;
		this.pageTotalCount = pageTotalCount;
		this.firstRow = firstRow;
		this.endRow = endRow;
	}

	private void calcuratePageTotalCount() {
		if(myReviewTotalCount == 0) {
			pageTotalCount =0;
		}else {
			pageTotalCount = myReviewTotalCount / myReviewCountPerPage;
			
			if(myReviewTotalCount % myReviewCountPerPage >0) {
				pageTotalCount++;
			}
		}
		
	}

	public int getMyReviewTotalCount() {
		return myReviewTotalCount;
	}

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public List<MusicReview> getMyReviewList() {
		return myReviewList;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}

	public int getMyReviewCountPerPage() {
		return myReviewCountPerPage;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getEndRow() {
		return endRow;
	}

	
	
	
}
