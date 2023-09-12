package com.varchar.biz.payment;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository("paymentDAO")
public class PaymentDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_INSERT = "INSERT INTO PAYMENT(PAYMENT_NUM, PAYMENT_NAME, PAYMENT_CUSTOMER) "
									+ "VALUES((SELECT NVL(MAX(PAYMENT_NUM), 0) + 1 FROM PAYMENT), ?, ?)";
	
	public ArrayList<PaymentVO> selectAll(PaymentVO paymentVO) {
		return null;
	}

	public PaymentVO selectOne(PaymentVO paymentVO) {
		return null;
	}

	public boolean insert(PaymentVO paymentVO) {

		int result = jdbcTemplate.update(SQL_INSERT, paymentVO.getPaymentName(), paymentVO.getPaymentCustomer());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(PaymentVO paymentVO) {
		return false;
	}

	public boolean delete(PaymentVO paymentVO) {
		return false;
	}


}
