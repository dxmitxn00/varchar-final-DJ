package com.varchar.biz.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.buy.BuyVO;
import com.varchar.biz.common.JDBCUtil;

public class PaymentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static final private String SQL_INSERT = "INSERT INTO PAYMENT(PAYMENT_NAME, PAYMENT_CUSTOMER) VALUES(?, ?);";
	
	public ArrayList<PaymentVO> selectAll(PaymentVO pVO) {
		return null;
	}

	public BuyVO selectOne(PaymentVO pVO) {
		return null;
	}

	public boolean insert(PaymentVO pVO) {
		JDBCUtil.getConnection();

		try {
			pstmt=conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, pVO.getPaymentName());
			pstmt.setString(2, pVO.getPaymentCustomer());
			
			int rs=pstmt.executeUpdate();
			if(rs<=0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.close(conn, pstmt);

		return true;
	}

	public boolean update(PaymentVO pVO) {
		return false;
	}

	public boolean delete(PaymentVO pVO) {
		return false;
	}


}
