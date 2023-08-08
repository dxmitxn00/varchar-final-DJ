package com.varchar.biz.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.common.JDBCUtil;

public class BuyDetailDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static final private String SQL_SELECTALL = "SELECT BD.BUY_SERIAL, T.TEA_NUM, T.TEA_NAME, T.TEA_PRICE, I.IMAGE_URL, BD.BUY_NUM, BD.BUY_CNT \r\n"
			+ "FROM BUY_DETAIL BD \r\n"
			+ "JOIN TEA T ON T.TEA_NUM = BD.TEA_NUM \r\n"
			+ "JOIN IMAGE I ON I.TEA_NUM = T.TEA_NUM \r\n"
			+ "WHERE BD.BUY_NUM = ? AND I.IMAGE_DIVISION = 1; \r\n"
			+ "";
	
	static final private String SQL_SELECTALL_CARTRETRY =
			"SELECT TEA_NUM, BUY_CNT FROM BUY_DETAIL WHERE BUY_NUM = ?;";
	
	
	static final private String SQL_SELECTONE = "SELECT BUY_SERIAL, BUY_NUM, TEA_NUM, BUY_CNT "
			+ "FROM BUY_DETAIL "
			+ "WHERE BUY_SERIAL= ?;";
	
	static final private String SQL_SELECTONE_BUYNUM = "SELECT BUY_NUM \r\n"
			+ "FROM BUY \r\n"
			+ "WHERE MEMBER_ID = ? \r\n"
			+ "ORDER BY BUY_NUM DESC LIMIT 1; ";
	
	static final private String SQL_INSERT = "INSERT INTO BUY_DETAIL(BUY_NUM, TEA_NUM, BUY_CNT) VALUES(?, ?, ?);";

	public ArrayList<BuyDetailVO> selectAll(BuyDetailVO btVO) {

		conn = JDBCUtil.getConnection();

		ArrayList<BuyDetailVO> datas = new ArrayList<BuyDetailVO>();

		try {
			
			if(btVO.getBuySearch().equals("다시담기")) {
				//
				pstmt = conn.prepareStatement(SQL_SELECTALL_CARTRETRY);
				pstmt.setInt(1, btVO.getBuyNum());
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BuyDetailVO data = new BuyDetailVO();
					data.setTeaNum(rs.getInt("TEA_NUM"));
					data.setBuyCnt(rs.getInt("BUY_CNT"));
					datas.add(data);
				}
				//
			}
			else {
				// buySearch = 주문상세
				pstmt = conn.prepareStatement(SQL_SELECTALL);
				pstmt.setInt(1, btVO.getBuyNum());
				
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					BuyDetailVO data = new BuyDetailVO();
					data.setBuySerial(rs.getInt("BUY_SERIAL"));
					data.setTeaNum(rs.getInt("TEA_NUM"));
					data.setTeaName(rs.getString("TEA_NAME"));
					data.setTeaPrice(rs.getInt("TEA_PRICE"));
					data.setImageUrl(rs.getString("IMAGE_URL"));
					data.setBuyNum(rs.getInt("BUY_NUM"));
					data.setBuyCnt(rs.getInt("BUY_CNT"));
					datas.add(data);
				}
				//
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.getConnection();

		return datas;

	}

	public BuyDetailVO selectOne(BuyDetailVO btVO) {
		conn = JDBCUtil.getConnection();
		BuyDetailVO data = null;

		try {
			
			if(btVO.getBuySearch().equals("주문번호")) {
				//
				pstmt = conn.prepareStatement(SQL_SELECTONE_BUYNUM);
				pstmt.setString(1, btVO.getMemberId());
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					data = new BuyDetailVO();
					data.setBuyNum(rs.getInt("BUY_NUM"));
				}
				//
				
			}
			else {
				//
				pstmt = conn.prepareStatement(SQL_SELECTONE);
				pstmt.setInt(1, btVO.getBuySerial());
				
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					data = new BuyDetailVO();
					data.setBuySerial(rs.getInt("BUY_SERIAL"));
					data.setBuyNum(rs.getInt("BUY_NUM"));
					data.setTeaNum(rs.getInt("TEA_NUM"));
					data.setBuyCnt(rs.getInt("BUY_CNT"));
				}
				//
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.getConnection();

		return data;

	}

	public boolean insert(BuyDetailVO btVO) {
		conn = JDBCUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL_INSERT);
			pstmt.setInt(1, btVO.getBuyNum());
			pstmt.setInt(2, btVO.getTeaNum());
			pstmt.setInt(3, btVO.getBuyCnt());

			int rs = pstmt.executeUpdate();
			if (rs <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.getConnection();

		return true;
	}

	public boolean update(BuyDetailVO btVO) {
		return false;
	}

	public boolean delete(BuyDetailVO btVO) {
		return false;
	}

}
