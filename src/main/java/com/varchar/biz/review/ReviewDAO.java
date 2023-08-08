package com.varchar.biz.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.common.JDBCUtil;

public class ReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	static final private String SQL_SELECTALL = // 후기 목록
			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd on r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE i.IMAGE_DIVISION = 1 "
			+ "ORDER BY r.REVIEW_NUM DESC ";
	
	static final private String SQL_SELECTALL_REVIEW = // 후기 검색
			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE t.TEA_NAME LIKE CONCAT('%', ?, '%') AND i.IMAGE_DIVISION=1 "
			+ "ORDER BY r.REVIEW_NUM DESC ";
	
	static final private String SQL_SELECTALL_CATE = // 후기 카테고리 검색
			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE t.TEA_CATEGORY LIKE CONCAT('%', ?, '%') AND i.IMAGE_DIVISION=1 "
			+ "ORDER BY r.REVIEW_NUM DESC ";
	
	static final private String SQL_SELECTALL_MEMBER = // 내가 쓴 후기
			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON bd.BUY_SERIAL = r.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE MEMBER_ID = ? AND i.IMAGE_DIVISION = 1 "
			+ "ORDER BY r.REVIEW_NUM DESC ";
	
	static final private String SQL_SELECTONE = // 후기 상세
			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, bd.BUY_CNT "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE REVIEW_NUM = ? AND i.IMAGE_DIVISION = 1 ";
	
	static final private String SQL_SELECTONE_CHECK = // 후기 확인(작성 여부)
			"SELECT REVIEW_NUM FROM REVIEW WHERE BUY_SERIAL = ?";
	
	static final private String PAGING = "LIMIT ?, 6;"; // 페이징 처리
	
	static final private String SQL_INSERT = "INSERT INTO REVIEW(MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT) VALUES(?, ?, ?);";
	static final private String SQL_UPDATE = "UPDATE REVIEW SET REVIEW_CONTENT =? WHERE REVIEW_NUM = ?;";
	static final private String SQL_DELETE = "DELETE FROM REVIEW WHERE REVIEW_NUM = ?;";
	
	public ArrayList<ReviewVO> selectAll(ReviewVO rVO) {

		conn = JDBCUtil.getConnection();
		ArrayList<ReviewVO> datas = new ArrayList<ReviewVO>();

		try {
				// 임시 변수 사용 --> 서치 컨디션
				if(rVO.getSearchName().equals("ALL")) { // 후기 목록
					pstmt = conn.prepareStatement(SQL_SELECTALL);
				}
				else if(rVO.getSearchName().equals("REVIEW")) { // 후기 검색
					pstmt = conn.prepareStatement(SQL_SELECTALL_REVIEW);
					pstmt.setString(1, rVO.getReviewSearch());
				}
				else if(rVO.getSearchName().equals("CATEGORY")) { // 후기 카테고리 검색
					pstmt = conn.prepareStatement(SQL_SELECTALL_CATE);
					pstmt.setString(1, rVO.getReviewSearch());
				}
				else if(rVO.getSearchName().equals("MEMBER")) { // 내 후기
					pstmt = conn.prepareStatement(SQL_SELECTALL_MEMBER);
					pstmt.setString(1, rVO.getMemberId());
				}
				else if(rVO.getSearchName().equals("ALL_PAGING")) { // 후기 목록 페이징
					pstmt = conn.prepareStatement(SQL_SELECTALL + PAGING);
					pstmt.setInt(1, rVO.getStartRnum());
				}
				else if(rVO.getSearchName().equals("REVIEW_PAGING")) { // 후기 검색 페이징
					pstmt = conn.prepareStatement(SQL_SELECTALL_REVIEW + PAGING);
					pstmt.setString(1, rVO.getReviewSearch());
					pstmt.setInt(2, rVO.getStartRnum());
				}
				else if(rVO.getSearchName().equals("CATEGORY_PAGING")) { // 후기 카테고리 검색 페이징
					pstmt = conn.prepareStatement(SQL_SELECTALL_CATE + PAGING);
					pstmt.setString(1, rVO.getReviewSearch());
					pstmt.setInt(2, rVO.getStartRnum());
				}
				else if(rVO.getSearchName().equals("MEMBER_PAGING")) { // 내 후기 페이징
					pstmt = conn.prepareStatement(SQL_SELECTALL_MEMBER + PAGING);
					pstmt.setString(1, rVO.getMemberId());
					pstmt.setInt(2, rVO.getStartRnum());
				}
				rs = pstmt.executeQuery();
				
			while (rs.next()) {
				ReviewVO data = new ReviewVO();
				data.setReviewNum(rs.getInt("REVIEW_NUM"));
				data.setMemberId(rs.getString("MEMBER_ID"));
				data.setBuySerial(rs.getInt("BUY_SERIAL"));
				data.setReviewContent(rs.getString("REVIEW_CONTENT"));
				data.setTeaName(rs.getString("TEA_NAME"));
				data.setImageUrl(rs.getString("IMAGE_URL"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);
		return datas;

	}

	public ReviewVO selectOne(ReviewVO rVO) {
		conn = JDBCUtil.getConnection();
		ReviewVO data = null;

		try {

			if(rVO.getReviewSearch() == null) { 
				pstmt = conn.prepareStatement(SQL_SELECTONE);
				pstmt.setInt(1, rVO.getReviewNum());

				rs = pstmt.executeQuery();
			
				if (rs.next()) {
					data = new ReviewVO();
					data.setReviewNum(rs.getInt("REVIEW_NUM"));
					data.setMemberId(rs.getString("MEMBER_ID"));
					data.setBuySerial(rs.getInt("BUY_SERIAL"));
					data.setReviewContent(rs.getString("REVIEW_CONTENT"));
					data.setTeaName(rs.getString("TEA_NAME"));
					data.setImageUrl(rs.getString("IMAGE_URL"));
					data.setBuyCnt(rs.getInt("BUY_CNT"));
				}
			}
			else if (rVO.getReviewSearch().equals("리뷰확인")) {
				pstmt = conn.prepareStatement(SQL_SELECTONE_CHECK);
				pstmt.setInt(1, rVO.getBuySerial());

				rs = pstmt.executeQuery();

				if (rs.next()) {
					data = new ReviewVO();
					data.setReviewNum(rs.getInt("REVIEW_NUM"));
				}

			} else {

				pstmt = conn.prepareStatement(SQL_SELECTONE);
				pstmt.setInt(1, rVO.getReviewNum());

				rs = pstmt.executeQuery();
			
				if (rs.next()) {
					data = new ReviewVO();
					data.setReviewNum(rs.getInt("REVIEW_NUM"));
					data.setMemberId(rs.getString("MEMBER_ID"));
					data.setBuySerial(rs.getInt("BUY_SERIAL"));
					data.setReviewContent(rs.getString("REVIEW_CONTENT"));
					data.setTeaName(rs.getString("TEA_NAME"));
					data.setImageUrl(rs.getString("IMAGE_URL"));
					data.setBuyCnt(rs.getInt("BUY_CNT"));
				}
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);
		return data;

	}

	public boolean insert(ReviewVO rVO) {
		conn = JDBCUtil.getConnection();
		
		try {
			pstmt = conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, rVO.getMemberId());
			pstmt.setInt(2, rVO.getBuySerial());
			pstmt.setString(3, rVO.getReviewContent());

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

	public boolean update(ReviewVO rVO) {
		conn = JDBCUtil.getConnection();
		
		try {
				pstmt = conn.prepareStatement(SQL_UPDATE);
				pstmt.setString(1, rVO.getReviewContent());
				pstmt.setInt(2, rVO.getReviewNum());
			
			int rs = pstmt.executeUpdate();
			
			if(rs <= 0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.close(conn, pstmt);

		return true;
	}

	public boolean delete(ReviewVO rVO) {
		conn = JDBCUtil.getConnection();

		try {
			pstmt=conn.prepareStatement(SQL_DELETE);
			pstmt.setInt(1, rVO.getReviewNum());
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

}
