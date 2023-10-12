package com.varchar.biz.tea;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.varchar.biz.hashtag.TeaHashtagVO;

public class TeaVO {
	private int teaNum;
	private int categoryNum;
	private String teaName;
	private int teaPrice;
	private int teaCnt;
	private String teaContent;
	private int teaStatus;
	
	// 임시변수
	private String teaSearchWord;
	private String teaCondition;
	private String imageUrl;
	private int startRnum;
	private String memberId;
	private int teaTotal;
	private int teaCheckCnt;
	private String count;
	private int endRnum;
	
	private int favorResult;
	private String categoryName;
	private String teaHashtagContent;
	
	private List<TeaHashtagVO> teaHashtags;
	
	private List<MultipartFile> fileUpload;
	private String fileName;
	
	public TeaVO() {
		this(0, 0, "", 0, 0, "", 0);
	}
	
	public TeaVO(int teaNum, int categoryNum, String teaName, int teaPrice, int teaCnt, String teaContent, int teaStatus) {
		this.teaNum = teaNum;
		this.categoryNum = categoryNum;
		this.teaName = teaName;
		this.teaPrice = teaPrice;
		this.teaCnt = teaCnt;
		this.teaContent = teaContent;
		this.teaStatus = teaStatus;
		this.teaCondition = "상품 조회";
	}
	
	public int getTeaStatus() {
		return teaStatus;
	}

	public void setTeaStatus(int teaStatus) {
		this.teaStatus = teaStatus;
	}

	public int getEndRnum() {
		return endRnum;
	}

	public void setEndRnum(int endRnum) {
		this.endRnum = endRnum;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public int getTeaCheckCnt() {
		return teaCheckCnt;
	}

	public void setTeaCheckCnt(int teaCheckCnt) {
		this.teaCheckCnt = teaCheckCnt;
	}

	public int getTeaTotal() {
		return teaTotal;
	}

	public void setTeaTotal(int teaTotal) {
		this.teaTotal = teaTotal;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getFavorResult() {
		return favorResult;
	}

	public void setFavorResult(int favorResult) {
		this.favorResult = favorResult;
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
	
	public String getTeaHashtagContent() {
		return teaHashtagContent;
	}

	public void setTeaHashtagContent(String teaHashtagContent) {
		this.teaHashtagContent = teaHashtagContent;
	}

	public List<TeaHashtagVO> getTeaHashtags() {
		return teaHashtags;
	}

	public void setTeaHashtags(List<TeaHashtagVO> teaHashtags) {
		this.teaHashtags = teaHashtags;
	}

	public List<MultipartFile> getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(List<MultipartFile> fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "TeaVO [teaNum=" + teaNum + ", categoryNum=" + categoryNum + ", teaName=" + teaName + ", teaPrice="
				+ teaPrice + ", teaCnt=" + teaCnt + ", teaContent=" + teaContent + ", teaStatus=" + teaStatus
				+ ", teaSearchWord=" + teaSearchWord + ", teaCondition=" + teaCondition + ", imageUrl=" + imageUrl
				+ ", startRnum=" + startRnum + ", memberId=" + memberId + ", teaTotal=" + teaTotal + ", teaCheckCnt="
				+ teaCheckCnt + ", count=" + count + ", endRnum=" + endRnum + ", favorResult=" + favorResult
				+ ", categoryName=" + categoryName + ", teaHashtagContent=" + teaHashtagContent + ", teaHashtags="
				+ teaHashtags + ", fileUpload=" + fileUpload + ", fileName=" + fileName + "]";
	}
}