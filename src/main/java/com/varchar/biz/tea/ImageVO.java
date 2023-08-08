package com.varchar.biz.tea;

public class ImageVO {
	private int imageNum;
	private int teaNum;
	private String imageUrl;
	private int imageDivision;
	
	// 임시변수
	
	public ImageVO() {
		this(0, 0, "", 0);
	}
	
	public ImageVO(int imageNum, int teaNum, String imageUrl, int imageDivision) {
		this.imageNum = imageNum;
		this.teaNum = teaNum;
		this.imageUrl = imageUrl;
		this.imageDivision = imageDivision;
	}

	public int getImageNum() {
		return imageNum;
	}

	public void setImageNum(int imageNum) {
		this.imageNum = imageNum;
	}

	public int getTeaNum() {
		return teaNum;
	}

	public void setTeaNum(int teaNum) {
		this.teaNum = teaNum;
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
