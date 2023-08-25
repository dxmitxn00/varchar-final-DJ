package com.varchar.biz.review;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("reviewDAO")
public class ReviewDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	//	static final private String SQL_SELECTALL = // 후기 목록
	//			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
	//			+ "FROM REVIEW r "
	//			+ "JOIN BUY_DETAIL bd on r.BUY_SERIAL = bd.BUY_SERIAL "
	//			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
	//			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
	//			+ "WHERE i.IMAGE_DIVISION = 1 "
	//			+ "ORDER BY r.REVIEW_NUM DESC ";

	static final private String SQL_SELECTALL = // 후기 목록
			"SELECT REVIEW_NUM, MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT, TEA_NAME, IMAGE_URL "
			+ "FROM ( "
			+ "SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, ROWNUM AS rnum "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE i.IMAGE_DIVISION = 1 "
			+ "ORDER BY r.REVIEW_NUM DESC "
			+ ") r ";

	//	static final private String SQL_SELECTALL_REVIEW = // 후기 검색
	//			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
	//			+ "FROM REVIEW r "
	//			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
	//			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
	//			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
	//			+ "WHERE t.TEA_NAME LIKE CONCAT('%', ?, '%') AND i.IMAGE_DIVISION=1 "
	//			+ "ORDER BY r.REVIEW_NUM DESC ";

	static final private String SQL_SELECTALL_REVIEW = // 후기 검색
			"SELECT REVIEW_NUM, MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT, TEA_NAME, IMAGE_URL "
			+ "FROM ( "
			+ "SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, ROW_NUMBER() OVER (ORDER BY r.REVIEW_NUM DESC) AS rnum "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE t.TEA_NAME LIKE '%' || ? || '%' AND i.IMAGE_DIVISION = 1 "
			+ ") r ";

	//	static final private String SQL_SELECTALL_CATE = // 후기 카테고리 검색
	//			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
	//			+ "FROM REVIEW r "
	//			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
	//			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
	//			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
	//			+ "WHERE t.TEA_CATEGORY LIKE CONCAT('%', ?, '%') AND i.IMAGE_DIVISION=1 "
	//			+ "ORDER BY r.REVIEW_NUM DESC ";

	static final private String SQL_SELECTALL_CATE = // 후기 카테고리 검색
			"SELECT REVIEW_NUM, MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT, TEA_NAME, IMAGE_URL "
			+ "FROM ( "
			+ "SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, ROW_NUMBER() OVER (ORDER BY r.REVIEW_NUM DESC) AS rnum "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE t.TEA_CATEGORY LIKE '%' || ? || '%' AND i.IMAGE_DIVISION = 1 "
			+ ") r ";

	//	static final private String SQL_SELECTALL_MEMBER = // 내가 쓴 후기
	//			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL "
	//			+ "FROM REVIEW r "
	//			+ "JOIN BUY_DETAIL bd ON bd.BUY_SERIAL = r.BUY_SERIAL "
	//			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
	//			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
	//			+ "WHERE MEMBER_ID = ? AND i.IMAGE_DIVISION = 1 "
	//			+ "ORDER BY r.REVIEW_NUM DESC ";

	static final private String SQL_SELECTALL_MEMBER = // 내가 쓴 후기
			"SELECT REVIEW_NUM, MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT, TEA_NAME, IMAGE_URL "
			+ "FROM ( "
			+ "SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, ROWNUM AS rnum "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE r.MEMBER_ID = ? AND i.IMAGE_DIVISION = 1 "
			+ ") r ";


	//	static final private String SQL_SELECTONE = // 후기 상세
	//			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, bd.BUY_CNT "
	//			+ "FROM REVIEW r "
	//			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
	//			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
	//			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
	//			+ "WHERE REVIEW_NUM = ? AND i.IMAGE_DIVISION = 1 ";

	static final private String SQL_SELECTONE = // 후기 상세
			"SELECT r.REVIEW_NUM, r.MEMBER_ID, r.BUY_SERIAL, r.REVIEW_CONTENT, t.TEA_NAME, i.IMAGE_URL, bd.BUY_CNT, t.TEA_CONTENT "
			+ "FROM REVIEW r "
			+ "JOIN BUY_DETAIL bd ON r.BUY_SERIAL = bd.BUY_SERIAL "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_NUM = t.TEA_NUM "
			+ "WHERE REVIEW_NUM = ? AND i.IMAGE_DIVISION = 1";

	static final private String SQL_SELECTONE_CHECK = // 후기 확인(작성 여부)
			"SELECT REVIEW_NUM FROM REVIEW WHERE BUY_SERIAL = ?";

	//	static final private String PAGING = "LIMIT ?, 6;"; // 페이징 처리
	static final private String PAGING = "WHERE r.rnum BETWEEN ? AND ?";

	//	static final private String SQL_INSERT = "INSERT INTO REVIEW(MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT) VALUES(?, ?, ?);";
	static final private String SQL_INSERT = "INSERT INTO REVIEW(REVIEW_NUM, MEMBER_ID, BUY_SERIAL, REVIEW_CONTENT) "
			+ "VALUES((SELECT NVL(MAX(REVIEW_NUM),2000)+1 FROM REVIEW), ?, ?, ?)";

	static final private String SQL_UPDATE = "UPDATE REVIEW SET REVIEW_CONTENT =? WHERE REVIEW_NUM = ?";
	static final private String SQL_DELETE = "DELETE FROM REVIEW WHERE REVIEW_NUM = ?";

	public List<ReviewVO> selectAll(ReviewVO reviewVO) {
		
		// 후기 목록
		if(reviewVO.getSearchName().equals("ALL")) {
			System.out.println("ALL");
			return jdbcTemplate.query(SQL_SELECTALL, new ReviewSelectAllRowMapper());
		}
		// 후기 검색
		else if(reviewVO.getSearchName().equals("REVIEW")) {
			System.out.println("REVIEW");
			Object[] args = { reviewVO.getReviewSearch() };
			return jdbcTemplate.query(SQL_SELECTALL_REVIEW, args, new ReviewSelectAllRowMapper());
		}
		// 후기 카테고리 검색
		else if(reviewVO.getSearchName().equals("CATEGORY")) {
			System.out.println("CATEGORY");
			Object[] args = { reviewVO.getReviewSearch() };
			return jdbcTemplate.query(SQL_SELECTALL_CATE, args, new ReviewSelectAllRowMapper());
		}
		// 내 후기
		else if(reviewVO.getSearchName().equals("MEMBER")) {
			System.out.println("MEMBER");
			Object[] args = { reviewVO.getMemberId() };
			return jdbcTemplate.query(SQL_SELECTALL_MEMBER, args, new ReviewSelectAllRowMapper());
		}
		// 후기 목록 페이징
		else if(reviewVO.getSearchName().equals("ALL_PAGING")) {
			System.out.println("ALL_PAGING");
			Object[] args = { reviewVO.getStartRnum(), reviewVO.getEndRnum() };
			return jdbcTemplate.query(SQL_SELECTALL + PAGING, args, new ReviewSelectAllRowMapper());
		}
		// 후기 검색 페이징
		else if(reviewVO.getSearchName().equals("REVIEW_PAGING")) {
			System.out.println("REVIEW_PAGING");
			Object[] args = { reviewVO.getReviewSearch(), reviewVO.getStartRnum() };
			return jdbcTemplate.query(SQL_SELECTALL_REVIEW + PAGING, args, new ReviewSelectAllRowMapper());
		}
		// 후기 카테고리 검색 페이징
		else if(reviewVO.getSearchName().equals("CATEGORY_PAGING")) {
			System.out.println("CATEGORY_PAGING");
			Object[] args = { reviewVO.getReviewSearch(), reviewVO.getStartRnum() };
			return jdbcTemplate.query(SQL_SELECTALL_CATE + PAGING, args, new ReviewSelectAllRowMapper());
		}
		// 내 후기 페이징
		else { // MEMBER_PAGING
			System.out.println("MEMBER_PAGING");
			Object[] args = { reviewVO.getMemberId(), reviewVO.getStartRnum(), reviewVO.getEndRnum() };
			return jdbcTemplate.query(SQL_SELECTALL_MEMBER + PAGING, args, new ReviewSelectAllRowMapper());
		}
	}

	public ReviewVO selectOne(ReviewVO reviewVO) {
		
		try {
			if(reviewVO.getReviewSearch().equals("리뷰상세")) { 
				Object[] args = { reviewVO.getReviewNum() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new ReviewSelectOneRowMapper());
			}
			// 리뷰 확인
			else {
				Object[] args = { reviewVO.getBuySerial() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE_CHECK, args, new ReviewSelectOneCheckRowMapper());
			}
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}

		
		
//		try {
//
//			if(reviewVO.getReviewSearch() == null) { 
//				pstmt = conn.prepareStatement(SQL_SELECTONE);
//				pstmt.setInt(1, reviewVO.getReviewNum());
//
//				rs = pstmt.executeQuery();
//
//				if (rs.next()) {
//					data = new ReviewVO();
//					data.setReviewNum(rs.getInt("REVIEW_NUM"));
//					data.setMemberId(rs.getString("MEMBER_ID"));
//					data.setBuySerial(rs.getInt("BUY_SERIAL"));
//					data.setReviewContent(rs.getString("REVIEW_CONTENT"));
//					data.setTeaName(rs.getString("TEA_NAME"));
//					data.setImageUrl(rs.getString("IMAGE_URL"));
//					data.setBuyCnt(rs.getInt("BUY_CNT"));
//				}
//			}
//			else if (reviewVO.getReviewSearch().equals("리뷰확인")) {
//				pstmt = conn.prepareStatement(SQL_SELECTONE_CHECK);
//				pstmt.setInt(1, reviewVO.getBuySerial());
//
//				rs = pstmt.executeQuery();
//
//				if (rs.next()) {
//					data = new ReviewVO();
//					data.setReviewNum(rs.getInt("REVIEW_NUM"));
//				}
//
//			} else {
//
//				pstmt = conn.prepareStatement(SQL_SELECTONE);
//				pstmt.setInt(1, reviewVO.getReviewNum());
//
//				rs = pstmt.executeQuery();
//
//				if (rs.next()) {
//					data = new ReviewVO();
//					data.setReviewNum(rs.getInt("REVIEW_NUM"));
//					data.setMemberId(rs.getString("MEMBER_ID"));
//					data.setBuySerial(rs.getInt("BUY_SERIAL"));
//					data.setReviewContent(rs.getString("REVIEW_CONTENT"));
//					data.setTeaName(rs.getString("TEA_NAME"));
//					data.setImageUrl(rs.getString("IMAGE_URL"));
//					data.setBuyCnt(rs.getInt("BUY_CNT"));
//				}
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		JDBCUtil.close(conn, pstmt);
//		return data;

	}

	public boolean insert(ReviewVO reviewVO) {
		
		int result = jdbcTemplate.update(SQL_INSERT, reviewVO.getMemberId(), reviewVO.getBuySerial(), reviewVO.getReviewContent());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(ReviewVO reviewVO) {

		int result = jdbcTemplate.update(SQL_UPDATE, reviewVO.getReviewContent(), reviewVO.getReviewNum());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean delete(ReviewVO reviewVO) {

		int result = jdbcTemplate.update(SQL_DELETE, reviewVO.getReviewNum());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}
}

// -----------------------------------------------------------------------

// [ selectAll ]
class ReviewSelectAllRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ReviewVO data = new ReviewVO();
		data.setReviewNum(rs.getInt("REVIEW_NUM"));
		data.setMemberId(rs.getString("MEMBER_ID"));
		data.setBuySerial(rs.getInt("BUY_SERIAL"));
		data.setReviewContent(rs.getString("REVIEW_CONTENT"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		return data;
	}
}

// [ selectOne ]
class ReviewSelectOneRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewVO data = new ReviewVO();
		data.setReviewNum(rs.getInt("REVIEW_NUM"));
		data.setMemberId(rs.getString("MEMBER_ID"));
		data.setBuySerial(rs.getInt("BUY_SERIAL"));
		data.setReviewContent(rs.getString("REVIEW_CONTENT"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		data.setBuyCnt(rs.getInt("BUY_CNT"));
		data.setTeaContent(rs.getString("TEA_CONTENT")); // vo 임시변수 추가 ㄱㄱ
		return data;
	}
}

// 리뷰 확인 [ selectOne ]
class ReviewSelectOneCheckRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewVO data = new ReviewVO();
		data.setReviewNum(rs.getInt("REVIEW_NUM"));
		return data;
	}
}
