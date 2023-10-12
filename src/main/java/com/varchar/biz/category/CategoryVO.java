package com.varchar.biz.category;

public class CategoryVO {
	
	private int categoryNum;
	private String categoryName;
	
	private int buyCnt;
	
	public CategoryVO() {
		this(0, "");
	}
	
	public CategoryVO(int categoryNum, String categoryName) {
		this.categoryNum = categoryNum;
		this.categoryName = categoryName;
	}

	public int getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getBuyCnt() {
		return buyCnt;
	}

	public void setBuyCnt(int buyCnt) {
		this.buyCnt = buyCnt;
	}

	@Override
	public String toString() {
		return "CategoryVO [categoryNum=" + categoryNum + ", categoryName=" + categoryName + "]";
	}
	
}
