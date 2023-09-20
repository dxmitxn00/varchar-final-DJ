package com.varchar.view.controller;

public class PagingVO {
	
	private int totalPageCnt;
	private int startPage;
	private int endPage;

	private String page;
	private int pageSize;
	private int totalCnt;


	private int currentPage;
	private String currentPageStr;
	private int categoryNum; 	//
	private String teaSearchWord; 	// 
	private String searchName; 		// 
	private String reviewSearch; 	//
	private String teaHashtagContent; //
	private String memberId;
	private String categoryName;
	
	private int startRnum;
	
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	private int endRnum;
	
	
	
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	public String getReviewSearch() {
		return reviewSearch;
	}
	public void setReviewSearch(String reviewSearch) {
		this.reviewSearch = reviewSearch;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getStartRnum() {
		return startRnum;
	}
	public void setStartRnum(int startRnum) {
		this.startRnum = startRnum;
	}
	public int getEndRnum() {
		return endRnum;
	}
	public void setEndRnum(int endRnum) {
		this.endRnum = endRnum;
	}
	public String getCurrentPageStr() {
		return currentPageStr;
	}
	public void setCurrentPageStr(String currentPageStr) {
		this.currentPageStr = currentPageStr;
	}
	public int getTotalPageCnt() {
		return totalPageCnt;
	}
	public void setTotalPageCnt(int totalPageCnt) {
		this.totalPageCnt = totalPageCnt;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getTeaSearchWord() {
		return teaSearchWord;
	}
	public void setTeaSearchWord(String teaSearchWord) {
		this.teaSearchWord = teaSearchWord;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getTeaHashtagContent() {
		return teaHashtagContent;
	}
	public void setTeaHashtagContent(String teaHashtagContent) {
		this.teaHashtagContent = teaHashtagContent;
	}
	
	@Override
	public String toString() {
		return "PagingVO [totalPageCnt=" + totalPageCnt + ", startPage=" + startPage + ", endPage=" + endPage
				+ ", page=" + page + ", pageSize=" + pageSize + ", totalCnt=" + totalCnt + ", currentPage="
				+ currentPage + ", currentPageStr=" + currentPageStr + ", categoryNum=" + categoryNum
				+ ", teaSearchWord=" + teaSearchWord + ", searchName=" + searchName + ", reviewSearch=" + reviewSearch
				+ ", teaHashtagContent=" + teaHashtagContent + ", memberId=" + memberId + ", categoryName="
				+ categoryName + ", startRnum=" + startRnum + ", endRnum=" + endRnum + "]";
	}

}
