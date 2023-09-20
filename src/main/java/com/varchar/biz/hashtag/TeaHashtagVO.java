package com.varchar.biz.hashtag;

public class TeaHashtagVO {
	private int teaHashtagNum;
	private String teaHashtagContent;

	//임시변수(조인)
	private int itemNum;
	private String teaHashtagCondition;
	private int teaNum;
	private String teaName;
	private int teaPrice;
	private int teaCnt;
	private String teaContent;
	private int teaStatus;
	private String imageUrl;
	private String categoryName;


	public TeaHashtagVO() {
		this(0, null);
	}
	public TeaHashtagVO(int teaHashtagNum, String teaHashtagContent) {
		this.teaHashtagNum = teaHashtagNum;
		this.teaHashtagContent = teaHashtagContent;

	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getTeaNum() {
		return teaNum;
	}
	public void setTeaNum(int teaNum) {
		this.teaNum = teaNum;
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
	public int getTeaCnt() {
		return teaCnt;
	}
	public void setTeaCnt(int teaCnt) {
		this.teaCnt = teaCnt;
	}
	public String getTeaContent() {
		return teaContent;
	}
	public void setTeaContent(String teaContent) {
		this.teaContent = teaContent;
	}
	public int getTeaStatus() {
		return teaStatus;
	}
	public void setTeaStatus(int teaStatus) {
		this.teaStatus = teaStatus;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getTeaHashtagCondition() {
		return teaHashtagCondition;
	}
	public void setTeaHashtagCondition(String teaHashtagCondition) {
		this.teaHashtagCondition = teaHashtagCondition;
	}
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public int getTeaHashtagNum() {
		return teaHashtagNum;
	}
	public void setTeaHashtagNum(int teaHashtagNum) {
		this.teaHashtagNum = teaHashtagNum;
	}
	public String getTeaHashtagContent() {
		return teaHashtagContent;
	}
	public void setTeaHashtagContent(String teaHashtagContent) {
		this.teaHashtagContent = teaHashtagContent;
	}
	@Override
	public String toString() {
		return "TeaHashtagVO [teaHashtagNum=" + teaHashtagNum + ", teaHashtagContent=" + teaHashtagContent
				+ ", itemNum=" + itemNum + ", teaHashtagCondition=" + teaHashtagCondition + ", teaNum=" + teaNum
				+ ", teaName=" + teaName + ", teaPrice=" + teaPrice + ", teaCnt=" + teaCnt + ", teaContent="
				+ teaContent + ", teaStatus=" + teaStatus + ", imageUrl=" + imageUrl + "]";
	}


}