package com.varchar.biz.review;

import java.sql.Date;
import java.util.Arrays;
import java.util.List;

import com.varchar.biz.hashtag.ReviewHashtagVO;
import com.varchar.biz.image.ImageVO;

public class ReviewVO {
	private int reviewNum;
	private String memberId;
	private int buySerial;
	private String reviewContent;
	private Date reviewInsertTime;
	
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
	private String[] reviewHashtag;
	private String[] reviewImage;
	private int reviewHashtagNum;
	private String reviewHashtagContent;
	
	List<ReviewHashtagVO> reviewHashtags;
	List<ImageVO> reviewImages;
	
	public ReviewVO() {
		this(0, "", 0, "");
	}
	
	public ReviewVO(int reviewNum, String memberId, int buySerial, String reviewContent) {
		this.reviewNum = reviewNum;
		this.memberId = memberId;
		this.buySerial = buySerial;
		this.reviewContent = reviewContent;
	}
	
	public Date getReviewInsertTime() {
		return reviewInsertTime;
	}

	public void setReviewInsertTime(Date reviewInsertTime) {
		this.reviewInsertTime = reviewInsertTime;
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

	public String[] getReviewHashtag() {
		return reviewHashtag;
	}

	public void setReviewHashtag(String[] reviewHashtag) {
		this.reviewHashtag = reviewHashtag;
	}
	
	public List<ReviewHashtagVO> getReviewHashtags() {
		return reviewHashtags;
	}

	public void setReviewHashtags(List<ReviewHashtagVO> reviewHashtags) {
		this.reviewHashtags = reviewHashtags;
	}
	
	public String[] getReviewImage() {
		return reviewImage;
	}

	public void setReviewImage(String[] reviewImage) {
		this.reviewImage = reviewImage;
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

	public List<ImageVO> getReviewImages() {
		return reviewImages;
	}

	public void setReviewImages(List<ImageVO> reviewImages) {
		this.reviewImages = reviewImages;
	}

	@Override
	public String toString() {
		return "ReviewVO [reviewNum=" + reviewNum + ", memberId=" + memberId + ", buySerial=" + buySerial
				+ ", reviewContent=" + reviewContent + ", reviewInsertTime=" + reviewInsertTime + ", reviewSearch="
				+ reviewSearch + ", searchName=" + searchName + ", teaName=" + teaName + ", teaContent=" + teaContent
				+ ", imageUrl=" + imageUrl + ", memberName=" + memberName + ", buyCnt=" + buyCnt + ", startRnum="
				+ startRnum + ", endRnum=" + endRnum + ", teaNum=" + teaNum + ", reviewHashtag="
				+ Arrays.toString(reviewHashtag) + ", reviewImage=" + Arrays.toString(reviewImage)
				+ ", reviewHashtagNum=" + reviewHashtagNum + ", reviewHashtagContent=" + reviewHashtagContent
				+ ", reviewHashtags=" + reviewHashtags + ", reviewImages=" + reviewImages + "]";
	}
}
