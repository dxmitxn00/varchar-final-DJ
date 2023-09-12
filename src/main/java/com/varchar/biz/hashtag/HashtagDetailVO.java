package com.varchar.biz.hashtag;

public class HashtagDetailVO {
	private int hashtagDetailNum;
	private int itemNum;
	private int hashtagNum;
	
	public HashtagDetailVO() {
		this(0,0,0);
	}
	public HashtagDetailVO(int hashtagDetailNum, int itemNum, int hashtagNum) {
		this.hashtagDetailNum = hashtagDetailNum;
		this.itemNum = itemNum;
		this.hashtagNum = hashtagNum;
	}
	public int getHashtagDetailNum() {
		return hashtagDetailNum;
	}
	public void setHashtagDetailNum(int hashtagDetailNum) {
		this.hashtagDetailNum = hashtagDetailNum;
	}
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public int getHashtagNum() {
		return hashtagNum;
	}
	public void setHashtagNum(int hashtagNum) {
		this.hashtagNum = hashtagNum;
	}
	@Override
	public String toString() {
		return "HashtagDetailVO [hashtagDetailNum=" + hashtagDetailNum + ", itemNum=" + itemNum + ", hashtagNum="
				+ hashtagNum + "]";
	}
	
	
	
	
	
	
	
	
	
}
