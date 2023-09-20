package com.varchar.biz.hashtag;

import java.sql.Date;

public class ReviewHashtagVO {
	private int reviewHashtagNum;
	private String reviewHashtagContent;
	
	// 임시 변수
	private int itemNum;
	private String hashTagSearchCondition;
	private int reviewNum;
	private int buySerial;
	private String memberName;
	private String reviewContent;
	private Date reviewInsertTime;
	private String imageUrl;
	private int hashtagNum;
	private int usageCount;

	public ReviewHashtagVO() {
		this(0,"");
	}
	public ReviewHashtagVO(int reviewHashtagNum, String reviewHashtagContent) {
		this.reviewHashtagNum = reviewHashtagNum;
		this.reviewHashtagContent = reviewHashtagContent;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public int getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	public int getBuySerial() {
		return buySerial;
	}
	public void setBuySerial(int buySerial) {
		this.buySerial = buySerial;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public Date getReviewInsertTime() {
		return reviewInsertTime;
	}
	public void setReviewInsertTime(Date reviewInsertTime) {
		this.reviewInsertTime = reviewInsertTime;
	}
	public String getHashTagSearchCondition() {
		return hashTagSearchCondition;
	}
	public void setHashTagSearchCondition(String hashTagSearchCondition) {
		this.hashTagSearchCondition = hashTagSearchCondition;
	}
	public int getItemNum() {
		return itemNum;
	}
	public void setItemNum(int itemNum) {
		this.itemNum = itemNum;
	}
	public int getReviewHashtagNum() {
		return reviewHashtagNum;
	}
	
	public void setReviewHashtagNum(int reviewHashtagNum) {
		this.reviewHashtagNum = reviewHashtagNum;
	}
	
	public String getReviewHashtagContent() {
		return reviewHashtagContent;
	}
	
	public void setReviewHashtagContent(String reviewHashtagContent) {
		this.reviewHashtagContent = reviewHashtagContent;
	}
	public int getHashtagNum() {
		return hashtagNum;
	}
	public void setHashtagNum(int hashtagNum) {
		this.hashtagNum = hashtagNum;
	}
	public int getUsageCount() {
		return usageCount;
	}
	public void setUsageCount(int usageCount) {
		this.usageCount = usageCount;
	}
	@Override
	public String toString() {
		return "ReviewHashtagVO [reviewHashtagNum=" + reviewHashtagNum + ", reviewHashtagContent="
				+ reviewHashtagContent + ", itemNum=" + itemNum + ", hashTagSearchCondition=" + hashTagSearchCondition
				+ ", reviewNum=" + reviewNum + ", buySerial=" + buySerial + ", memberName=" + memberName
				+ ", reviewContent=" + reviewContent + ", reviewInsertTime=" + reviewInsertTime + ", imageUrl="
				+ imageUrl + ", hashtagNum=" + hashtagNum + ", usageCount=" + usageCount + "]";
	}
}
