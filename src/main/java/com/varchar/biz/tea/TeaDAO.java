package com.varchar.biz.tea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.common.JDBCUtil;

public class TeaDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	static final private String SQL_SELECTALL = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL\r\n"
			+ "FROM TEA t JOIN IMAGE i USING (TEA_NUM)\r\n"
			+ "WHERE t.TEA_CATEGORY LIKE CONCAT('%', ?, '%') "
			+ "AND t.TEA_NAME LIKE CONCAT('%', ?, '%') "
			+ "AND i.IMAGE_DIVISION = 1;";
	static final private String SQL_SELECTALL_PAGING = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL\r\n"
			+ "FROM TEA t JOIN IMAGE i USING (TEA_NUM)\r\n"
			+ "WHERE t.TEA_CATEGORY LIKE CONCAT('%', ?, '%') "
			+ "AND t.TEA_NAME LIKE CONCAT('%', ?, '%') "
			+ "AND i.IMAGE_DIVISION = 1 "
			+ "LIMIT ?, 6";
	static final private String SQL_SELECTONE = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL\r\n"
			+ "FROM TEA t JOIN IMAGE i USING (TEA_NUM) "
			+ "WHERE i.IMAGE_DIVISION = 1 AND t.TEA_NUM = ?;";
	static final private String SQL_UPDATE = "UPDATE TEA SET TEA_CNT = (TEA_CNT - ?) WHERE TEA_NUM = ?";
//	static final private String SQL_INSERT = "";
//	static final private String SQL_DELETE = "";

	public ArrayList<TeaVO> selectAll(TeaVO tVO) {
		conn = JDBCUtil.getConnection();

		ArrayList<TeaVO> datas = new ArrayList<TeaVO>();

		try {
			if (tVO.getTeaCondition().equals("페이징")) {
				pstmt = conn.prepareStatement(SQL_SELECTALL_PAGING);
				pstmt.setString(1, tVO.getTeaCategory());
				pstmt.setString(2, tVO.getTeaSearchWord());
				pstmt.setInt(3, tVO.getStartRnum());
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					TeaVO data = new TeaVO();
					data.setTeaNum(rs.getInt("TEA_NUM"));
					data.setTeaName(rs.getString("TEA_Name"));
					data.setTeaPrice(rs.getInt("TEA_PRICE"));
					data.setTeaCnt(rs.getInt("TEA_CNT"));
					data.setTeaCategory(rs.getString("TEA_CATEGORY"));
					data.setTeaContent(rs.getString("TEA_CONTENT"));
					data.setImageUrl(rs.getString("IMAGE_URL"));
					datas.add(data);
				}
			}
			else {
				pstmt = conn.prepareStatement(SQL_SELECTALL);
				pstmt.setString(1, tVO.getTeaCategory());
				pstmt.setString(2, tVO.getTeaSearchWord());
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					TeaVO data = new TeaVO();
					data.setTeaNum(rs.getInt("TEA_NUM"));
					data.setTeaName(rs.getString("TEA_Name"));
					data.setTeaPrice(rs.getInt("TEA_PRICE"));
					data.setTeaCnt(rs.getInt("TEA_CNT"));
					data.setTeaCategory(rs.getString("TEA_CATEGORY"));
					data.setTeaContent(rs.getString("TEA_CONTENT"));
					data.setImageUrl(rs.getString("IMAGE_URL"));
					datas.add(data);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		System.out.println(datas);
		return datas;
	}

	public TeaVO selectOne(TeaVO tVO) {
		conn = JDBCUtil.getConnection();

		TeaVO data = new TeaVO();
		//TeaVO data=null;
		System.out.println("TeaVO selectOne 로그 tVO: "+tVO.getTeaNum());

		try {
			pstmt = conn.prepareStatement(SQL_SELECTONE);
			pstmt.setInt(1, tVO.getTeaNum());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				data.setTeaNum(rs.getInt("TEA_NUM"));
				data.setTeaName(rs.getString("TEA_NAME"));
				data.setTeaPrice(rs.getInt("TEA_PRICE"));
				data.setTeaCnt(rs.getInt("TEA_CNT"));
				data.setTeaCategory(rs.getString("TEA_CATEGORY"));
				data.setTeaContent(rs.getString("TEA_CONTENT"));
				data.setImageUrl(rs.getString("IMAGE_URL"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return data;
	}

	public boolean insert(TeaVO tVO) {
		return false;
	}

	public boolean update(TeaVO tVO) {
		conn = JDBCUtil.getConnection();
		try {

			pstmt = conn.prepareStatement(SQL_UPDATE);
			pstmt.setInt(1, tVO.getTeaCnt());
			pstmt.setInt(2, tVO.getTeaNum());

			int result = pstmt.executeUpdate();
			if (result <= 0) {
				return false;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e1) {
				e1.printStackTrace();
			}
			return false;
		}

		JDBCUtil.close(conn, pstmt);
		return true;
	}

	public boolean delete(TeaVO tVO) {
		return false;
	}
}