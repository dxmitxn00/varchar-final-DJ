package com.varchar.biz.tea;

// 지현 수정
public class TeaVO {
	private int teaNum;
	private String teaName;
	private int teaPrice;
	private int teaCnt;
	private String teaCategory;
	private String teaContent;

	// 임시변수
	private String teaSearchWord;
	private String teaCondition;
	private String imageUrl;
	private int startRnum;
	private int teaCheckCnt;
	private int teaTotal;
	private String count;
	
	public TeaVO() {
		this(0, "", 0, 0, "", "");
	}
	
	public TeaVO(int teaNum, String teaName, int teaPrice, int teaCnt, String teaCategory, String teaContent) {
		this.teaNum = teaNum;
		this.teaName = teaName;
		this.teaPrice = teaPrice;
		this.teaCnt = teaCnt;
		this.teaCategory = teaCategory;
		this.teaContent = teaContent;
		this.teaSearchWord = "";
		this.teaCondition = "";
	}
	
	

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
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

	public String getTeaCategory() {
		return teaCategory;
	}

	public void setTeaCategory(String teaCategory) {
		this.teaCategory = teaCategory;
	}

	public String getTeaContent() {
		return teaContent;
	}

	public void setTeaContent(String teaContent) {
		this.teaContent = teaContent;
	}

	public String getTeaSearchWord() {
		return teaSearchWord;
	}

	public void setTeaSearchWord(String teaSearchWord) {
		this.teaSearchWord = teaSearchWord;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getStartRnum() {
		return startRnum;
	}
	
	public void setStartRnum(int startRnum) {
		this.startRnum = startRnum;
	}
	
	public String getTeaCondition() {
		return teaCondition;
	}

	public void setTeaCondition(String teaCondition) {
		this.teaCondition = teaCondition;
	}
	
	public int getTeaTotal() {
		return teaTotal;
	}

	public void setTeaTotal(int teaTotal) {
		this.teaTotal = teaTotal;
	}
	
	public int getTeaCheckCnt() {
		return teaCheckCnt;
	}

	public void setTeaCheckCnt(int teaCheckCnt) {
		this.teaCheckCnt = teaCheckCnt;
	}

	@Override
	public String toString() {
		return "TeaVO [teaNum=" + teaNum + ", teaName=" + teaName + ", teaPrice=" + teaPrice + ", teaCnt=" + teaCnt
				+ ", teaCategory=" + teaCategory + ", teaContent=" + teaContent + ", teaSearchWord=" + teaSearchWord
				+ ", teaCondition=" + teaCondition + ", imageUrl=" + imageUrl + ", startRnum=" + startRnum
				+ ", teaTotal=" + teaTotal + "]";
	}
	
	

}