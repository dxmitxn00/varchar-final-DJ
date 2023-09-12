package com.varchar.biz.tea;

public class ImageVO {
	private int imageNum;
	private int teaReviewNum;
	private String imageUrl;
	private int imageDivision;
	
	// 임시변수
	public ImageVO() {
		this(0, 0, "", 0);
	}
	
	public ImageVO(int imageNum, int teaReviewNum, String imageUrl, int imageDivision) {
		this.imageNum = imageNum;
		this.teaReviewNum = teaReviewNum;
		this.imageUrl = imageUrl;
		this.imageDivision = imageDivision;
	}

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

	public int getTeaReviewNum() {
		return teaReviewNum;
	}

	public void setTeaReviewNum(int teaReviewNum) {
		this.teaReviewNum = teaReviewNum;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getImageDivision() {
		return imageDivision;
	}

	public void setImageDivision(int imageDivision) {
		this.imageDivision = imageDivision;
	}
	
	

}
