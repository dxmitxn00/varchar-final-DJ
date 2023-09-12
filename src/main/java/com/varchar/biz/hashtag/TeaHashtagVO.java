package com.varchar.biz.hashtag;

public class TeaHashtagVO {
	private int teaHashtagNum;
	private String teaHashtagContent;
	
	
	//임시변수(조인)
	private int itemNum;
	
	
	public TeaHashtagVO() {
		this(0, "");
	}
	public TeaHashtagVO(int teaHashtagNum, String teaHashtagContent) {
		this.teaHashtagNum = teaHashtagNum;
		this.teaHashtagContent = teaHashtagContent;
		
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
				+ ", itemNum=" + itemNum + "]";
	}
	
	
}
