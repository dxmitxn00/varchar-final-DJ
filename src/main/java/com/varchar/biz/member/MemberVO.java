package com.varchar.biz.member;

public class MemberVO {
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberAddress;
	private String memberPhone;
	private String memberEmail;
	
	// 임시변수
	private String memberSearch;
	
	public MemberVO() {
		this("","","","","","");
	}
	
	public MemberVO(String memberId, String memberPw, String memberName, String memberAddress, String memberPhone, String memberEmail) {
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAddress = memberAddress;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	
	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberSearch() {
		return memberSearch;
	}

	public void setMemberSearch(String memberSearch) {
		this.memberSearch = memberSearch;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberAddress=" + memberAddress + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail
				+ ", memberSearch=" + memberSearch + "]";
	}
}
