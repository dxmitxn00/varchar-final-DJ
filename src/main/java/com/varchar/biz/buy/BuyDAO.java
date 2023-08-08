package com.varchar.biz.buy;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.varchar.biz.common.JDBCUtil;

@Repository("buyDAO")
public class BuyDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static final private String SQL_SELECTALL = "SELECT b.BUY_NUM, SUM(t.TEA_PRICE) AS TEA_PRICE, SUM(bd.BUY_CNT) AS BUY_CNT\r\n"
			+ "FROM BUY b\r\n"
			+ "JOIN BUY_DETAIL bd USING(BUY_NUM)\r\n"
			+ "JOIN TEA t USING(TEA_NUM)\r\n"
			+ "WHERE MEMBER_ID = ? \r\n"
			+ "GROUP BY BUY_NUM\r\n";
	static final private String SQL_SELECTONE = "SELECT b.BUY_NUM, t.TEA_PRICE, bd.BUY_CNT "
			+ "FROM BUY b "
			+ "JOIN BUY_DETAIL bd USING(BUY_NUM) "
			+ "JOIN TEA t USING(TEA_NUM) "
			+ "WHERE BUY_NUM = ?;";
	static final private String SQL_INSERT = "INSERT INTO BUY(MEMBER_ID) VALUES(?);";

	public ArrayList<BuyVO> selectAll(BuyVO bVO) {

		conn = JDBCUtil.getConnection();

		ArrayList<BuyVO> datas = new ArrayList<BuyVO>();

		try {
			pstmt = conn.prepareStatement(SQL_SELECTALL);
			pstmt.setString(1, bVO.getMemberId());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BuyVO data = new BuyVO();
				data.setBuyNum(rs.getInt("BUY_NUM"));
				data.setTeaPrice(rs.getInt("TEA_PRICE"));
				data.setBuyCnt(rs.getInt("BUY_CNT"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return datas;
	}

	public BuyVO selectOne(BuyVO bVO) {
		conn = JDBCUtil.getConnection();
		BuyVO data = null;
		
		try {

			pstmt = conn.prepareStatement(SQL_SELECTONE);
			pstmt.setInt(1, bVO.getBuyNum());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				data = new BuyVO();
				data.setBuyNum(rs.getInt("BUY_NUM"));
				data.setTeaPrice(rs.getInt("TEA_PRICE"));
				data.setBuyCnt(rs.getInt("BUY_CNT"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return data;

	}

	public boolean insert(BuyVO bVO) {
		conn = JDBCUtil.getConnection();

		try {
			pstmt=conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, bVO.getMemberId());
			
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

	public boolean update(BuyVO bVO) {
		return false;
	}

	public boolean delete(BuyVO bVO) {
		return false;
	}
}
