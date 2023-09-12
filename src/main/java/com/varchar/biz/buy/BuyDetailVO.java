package com.varchar.biz.buy;

public class BuyDetailVO {
	
	private int buySerial;
	private int buyNum;
	private int teaNum;
	private int buyCnt;
	
	// 임시변수
	private String teaName;
	private String teaContent;
	private int teaPrice;
	private String imageUrl;
	private boolean reviewDone;
	private String buySearch;
	private String memberId;
	
	public BuyDetailVO() {
		this(0, 0, 0, 0, false);
	}
	
	public BuyDetailVO(int buySerial, int buyNum, int teaNum, int buyCnt, boolean reviewDone) {
		this.buySerial = buySerial;
		this.buyNum = buyNum;
		this.teaNum = teaNum;
		this.buyCnt = buyCnt;
		this.reviewDone = false;
	}

	public int getBuySerial() {
		return buySerial;
	}

	public void setBuySerial(int buySerial) {
		this.buySerial = buySerial;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}

	public int getTeaNum() {
		return teaNum;
	}

	public void setTeaNum(int teaNum) {
		this.teaNum = teaNum;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public String getTeaName() {
		return teaName;
	}

	public void setTeaName(String teaName) {
		this.teaName = teaName;
	}

	public int getTeaPrice() {
		return teaPrice;
	}

	public void setTeaPrice(int teaPrice) {
		this.teaPrice = teaPrice;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public boolean isReviewDone() {
		return reviewDone;
	}

	public void setReviewDone(boolean reviewDone) {
		this.reviewDone = reviewDone;
	}	

	public String getBuySearch() {
		return buySearch;
	}

	public void setBuySearch(String buySearch) {
		this.buySearch = buySearch;
	}
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getTeaContent() {
		return teaContent;
	}

	public void setTeaContent(String teaContent) {
		this.teaContent = teaContent;
	}

	@Override
	public String toString() {
		return "BuyDetailVO [buySerial=" + buySerial + ", buyNum=" + buyNum + ", teaNum=" + teaNum + ", buyCnt="
				+ buyCnt + ", teaName=" + teaName + ", teaPrice=" + teaPrice + ", imageUrl=" + imageUrl
				+ ", reviewDone=" + reviewDone + "]";
	}	
	
}
