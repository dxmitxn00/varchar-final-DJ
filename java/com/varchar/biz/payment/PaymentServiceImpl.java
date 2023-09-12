package com.varchar.biz.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	
	@Autowired
	private PaymentDAO paymentDAO;
	
	@Override
	public PaymentVO selectOne(PaymentVO paymentVO) {
		return paymentDAO.selectOne(paymentVO);
	}

	@Override
	public List<PaymentVO> selectAll(PaymentVO paymentVO) {
		return paymentDAO.selectAll(paymentVO);
	}

	@Override
	public boolean update(PaymentVO paymentVO) {
		return paymentDAO.update(paymentVO);
	}

	@Override
	public boolean delete(PaymentVO paymentVO) {
		return paymentDAO.delete(paymentVO);
	}

	@Override
	public boolean insert(PaymentVO paymentVO) {
		return paymentDAO.insert(paymentVO);
	}

}
