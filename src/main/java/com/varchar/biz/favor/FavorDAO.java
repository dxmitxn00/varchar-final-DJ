package com.varchar.biz.favor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.common.JDBCUtil;

public class FavorDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static final private String SQL_SELECTALL ="SELECT F.FAVOR_NUM, F.MEMBER_ID, F.TEA_NUM, T.TEA_NAME, T.TEA_PRICE,I.IMAGE_URL\r\n"
			+ "FROM FAVOR F\r\n"
			+ "JOIN TEA T ON T.TEA_NUM = F.TEA_NUM\r\n"
			+ "JOIN IMAGE I ON I.TEA_NUM = T.TEA_NUM\r\n"
			+ "WHERE F.MEMBER_ID = ? AND I.IMAGE_DIVISION = 1;";
	
 	static final private String SQL_SELECTONE = "SELECT FAVOR_NUM FROM FAVOR WHERE MEMBER_ID  = ? AND TEA_NUM = ?;";
	static final private String SQL_INSERT = "INSERT INTO FAVOR(MEMBER_ID, TEA_NUM) VALUES(?, ?);";
	static final private String SQL_DELETE = "DELETE FROM FAVOR WHERE MEMBER_ID  = ? AND TEA_NUM = ?";

	public ArrayList<FavorVO> selectAll(FavorVO fVO) {

		conn = JDBCUtil.getConnection();

		ArrayList<FavorVO> datas = new ArrayList<FavorVO>();

		try {
			pstmt = conn.prepareStatement(SQL_SELECTALL);
			pstmt.setString(1, fVO.getMemberId());

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FavorVO data = new FavorVO();
				
				
				data.setFavorNum(rs.getInt("FAVOR_NUM"));
				data.setMemberId(rs.getString("MEMBER_ID"));
				data.setTeaNum(rs.getInt("TEA_NUM"));
				data.setTeaName(rs.getString("TEA_NAME"));
				data.setTeaPrice(rs.getInt("TEA_PRICE"));
				data.setImageUrl(rs.getString("IMAGE_URL"));
				
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return datas;
	
	}

	public FavorVO selectOne(FavorVO fVO) {

		conn = JDBCUtil.getConnection();

		FavorVO data = null;

		try {
			pstmt = conn.prepareStatement(SQL_SELECTONE);
			pstmt.setString(1, fVO.getMemberId());
			pstmt.setInt(2, fVO.getTeaNum());

			rs = pstmt.executeQuery();

			if (rs.next()) {
				data = new FavorVO();
				data.setFavorNum(rs.getInt("FAVOR_NUM"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return data;
	}

	public boolean insert(FavorVO fVO) {
		conn = JDBCUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, fVO.getMemberId());
			pstmt.setInt(2, fVO.getTeaNum());

			int rs = pstmt.executeUpdate();
			if (rs <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.close(conn, pstmt);

		return true;
	}

	public boolean update(FavorVO fVO) {
		return false;
	}

	public boolean delete(FavorVO fVO) {
		conn = JDBCUtil.getConnection();

		try {
			pstmt = conn.prepareStatement(SQL_DELETE);
			pstmt.setString(1, fVO.getMemberId());
			pstmt.setInt(2, fVO.getTeaNum());

			int rs = pstmt.executeUpdate();
			if (rs <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.close(conn, pstmt);

		return true;
	}
}
