package com.varchar.biz.buy;

public class BuyVO {
	private int buyNum;
	private String memberId;
	
	// 임시 변수
	private int teaPrice;
	private int buyCnt;
	private int buyCount;
	private String buyName;
	private String imageUrl;
	
	public BuyVO() {
		this(0, "");
	}
	
	public BuyVO(int buyNum, String memberId) {
		this.buyNum = buyNum;
		this.memberId = memberId;
	}

	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getBuyCount() {
		return buyCount;
	}

	public void setBuyCount(int buyCount) {
		this.buyCount = buyCount;
	}

	public String getBuyName() {
		return buyName;
	}

	public void setBuyName(String buyName) {
		this.buyName = buyName;
	}

	public int getTeaPrice() {
		return teaPrice;
	}

	public void setTeaPrice(int teaPrice) {
		this.teaPrice = teaPrice;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	public int getBuyNum() {
		return buyNum;
	}
	
	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "BuyVO [buyNum=" + buyNum + ", memberId=" + memberId + ", teaPrice=" + teaPrice + ", buyCnt=" + buyCnt
				+ "]";
	}

	
}