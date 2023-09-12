package com.varchar.biz.payment;

public class PaymentVO {
	private int paymentNum;
	private String paymentName;
	private String paymentCustomer;
	
	public PaymentVO() {
		this(0, "", "");
	}
	
	public PaymentVO(int paymentNum, String paymentName, String paymentCustomer) {
		this.paymentNum = paymentNum;
		this.paymentName = paymentName;
		this.paymentCustomer = paymentCustomer;
	}

	public int getPaymentNum() {
		return paymentNum;
	}

	public void setPaymentNum(int paymentNum) {
		this.paymentNum = paymentNum;
	}

	public String getPaymentName() {
		return paymentName;
	}

	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}

	public String getPaymentCustomer() {
		return paymentCustomer;
	}

	public void setPaymentCustomer(String paymentCustomer) {
		this.paymentCustomer = paymentCustomer;
	}

}
