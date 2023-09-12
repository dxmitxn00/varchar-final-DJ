package com.varchar.biz.review;

public class ReviewVO {
	private int reviewNum;
	private String memberId;
	private int buySerial;
	private String reviewContent;
	
	// 임시변수
	private String reviewSearch;
	private String searchName;
	private String teaName;
	private String teaContent;
	private String imageUrl;
	private String memberName;
	private int buyCnt;
	private int startRnum;
	private int endRnum;
	private int teaNum;
	
	public ReviewVO() {
		this(0, "", 0, "");
	}
	
	public ReviewVO(int reviewNum, String memberId, int buySerial, String reviewContent) {
		this.reviewNum = reviewNum;
		this.memberId = memberId;
		this.buySerial = buySerial;
		this.reviewContent = reviewContent;
	}
	
	public int getTeaNum() {
		return teaNum;
	}

	public void setTeaNum(int teaNum) {
		this.teaNum = teaNum;
	}

	public int getEndRnum() {
		return endRnum;
	}

	public void setEndRnum(int endRnum) {
		this.endRnum = endRnum;
	}

	public String getTeaContent() {
		return teaContent;
	}

	public void setTeaContent(String teaContent) {
		this.teaContent = teaContent;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getTeaName() {
		return teaName;
	}

	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getSearchName() {
		return searchName;
	}

	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}

	public int getReviewNum() {
		return reviewNum;
	}

	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBuySerial() {
		return buySerial;
	}

	public void setBuySerial(int buySerial) {
		this.buySerial = buySerial;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewSearch() {
		return reviewSearch;
	}

	public void setReviewSearch(String reviewSearch) {
		this.reviewSearch = reviewSearch;
	}

	public int getStartRnum() {
		return startRnum;
	}

	public void setStartRnum(int startRnum) {
		this.startRnum = startRnum;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", memberId=" + memberId + ", buySerial=" + buySerial
				+ ", reviewContent=" + reviewContent + ", reviewSearch=" + reviewSearch + ", searchName=" + searchName
				+ ", teaName=" + teaName + ", imageUrl=" + imageUrl + ", memberName=" + memberName + ", buyCnt="
				+ buyCnt + ", startRnum=" + startRnum + "]";
	}	
}
