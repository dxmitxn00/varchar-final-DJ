package com.varchar.biz.tea;

import java.util.ArrayList;

import com.varchar.biz.review.ReviewVO;

public class ReviewSet {
	private TeaVO tea;					// 상품 : 1
	private ArrayList<ReviewVO> rdatas;	// 후기 : N
	
	public ReviewSet() {
		this(null, null);
	}
	
	public ReviewSet(TeaVO tea, ArrayList<ReviewVO> rdatas) {
		this.tea = tea;
		this.rdatas = rdatas;
	}
	
	public TeaVO getTea() {
		return tea;
	}
	public void setTea(TeaVO tea) {
		this.tea = tea;
	}
	public ArrayList<ReviewVO> getRdatas() {
		return rdatas;
	}
	public void setRdatas(ArrayList<ReviewVO> rdatas) {
		this.rdatas = rdatas;
	}

	@Override
	public String toString() {
		return "ReviewSet [tea=" + tea + ", rdatas=" + rdatas + "]";
	}
	
}
