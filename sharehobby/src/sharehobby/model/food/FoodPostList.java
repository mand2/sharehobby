package sharehobby.model.food;

import java.util.List;


public class FoodPostList {
	
	private int postTotalCount;
	private int currentPageNumber;//현재페이지 넘버가 무엇으로 되어있는지
	private List<FoodPost> PostList;
	private int pageTotalCount;
	private int postCountPerPage;
	private int firstRow;
	private int endRow;
	
	
	public FoodPostList(int postTotalCount, int currentPageNumber, List<FoodPost> postList, 
			int postCountPerPage, int firstRow, int endRow) {
		super();
		this.postTotalCount = postTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.PostList = postList;
		this.postCountPerPage = postCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		calcuratePageTotalCount();
	}
	
	
	private void calcuratePageTotalCount() {
		//개수세는거라 0보다 작은건없음
		if(postTotalCount == 0) {
			pageTotalCount = 0;
		}else {
			pageTotalCount = postTotalCount / postCountPerPage;
			
			if(postTotalCount%postCountPerPage > 0) {
				pageTotalCount++;
			}
		}
	}


	public int getPostTotalCount() {
		return postTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public List<FoodPost> getPostList() {
		return PostList;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public int getPostCountPerPage() {
		return postCountPerPage;
	}


	public int getFirstRow() {
		return firstRow;
	}


	public int getEndRow() {
		return endRow;
	}

	public boolean isEmpty() {
		return postCountPerPage == 0;
	}
	
}




