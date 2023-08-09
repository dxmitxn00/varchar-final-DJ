package com.varchar.biz.payment;

import java.util.List;

public interface PaymentService {
	
	public PaymentVO selectOne(PaymentVO paymentVO);
	public List<PaymentVO> selectAll(PaymentVO paymentVO);
	public boolean update(PaymentVO paymentVO);
	public boolean delete(PaymentVO paymentVO);
	public boolean insert(PaymentVO paymentVO);

}
