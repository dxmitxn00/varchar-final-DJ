package com.varchar.biz.hashtag;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("ReviewHashtagDAO")
public class ReviewHashtagDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_SELECTALL = "SELECT rh.REVIEW_HASHTAG_NUM, rh.REVIEW_HASHTAG_CONTENT "
												+ "FROM REVIEW_HASHTAG rh "
												+ "JOIN HASHTAG_DETAIL hd ON hd.HASHTAG_NUM = rh.REVIEW_HASHTAG_NUM "
												+ "WHERE hd.ITEM_NUM = ?";
	
	static final private String SQL_SELECTALL_RANK = "SELECT hd.HASHTAG_NUM, COUNT(rh.REVIEW_HASHTAG_NUM) AS USAGE_COUNT, MAX(rh.REVIEW_HASHTAG_CONTENT) AS REVIEW_HASHTAG_CONTENT "
													+ "FROM HASHTAG_DETAIL hd "
													+ "JOIN REVIEW_HASHTAG rh ON rh.REVIEW_HASHTAG_NUM = hd.HASHTAG_NUM "
													+ "WHERE hd.ITEM_NUM >= 2000 "
													+ "GROUP BY hd.HASHTAG_NUM "
													+ "ORDER BY USAGE_COUNT DESC";
	
	static final private String SQL_SELECTONE = "SELECT REVIEW_HASHTAG_NUM, REVIEW_HASHTAG_CONTENT FROM REVIEW_HASHTAG WHERE REVIEW_HASHTAG_CONTENT = ? ";
	
	static final private String SQL_INSERT = "INSERT INTO REVIEW_HASHTAG(REVIEW_HASHTAG_NUM, REVIEW_HASHTAG_CONTENT) "
											+ "VALUES ((SELECT NVL(MAX(REVIEW_HASHTAG_NUM), 2000) + 1 FROM REVIEW_HASHTAG), ?)";

	public List<ReviewHashtagVO> selectAll(ReviewHashtagVO reviewHashtagVO) {
		
		if (reviewHashtagVO.getHashTagSearchCondition().equals("후기번호검색")) {
			Object[] args = { reviewHashtagVO.getItemNum() };
			return jdbcTemplate.query(SQL_SELECTALL, args, new ReviewHashtagSelect());
		} 
		else { // if(reviewHashtagVO.getHashTagSearchCondition().equals("해시태그랭크")) 
			return jdbcTemplate.query(SQL_SELECTALL_RANK, new ReviewHashtagRank());
		}
	}

	public ReviewHashtagVO selectOne(ReviewHashtagVO reviewHashtagVO) {
		try {		
			Object[] args = {reviewHashtagVO.getReviewHashtagContent()};
			return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new ReviewHashtagSelect());	
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean insert(ReviewHashtagVO reviewHashtagVO) {
		int result = jdbcTemplate.update(SQL_INSERT, reviewHashtagVO.getReviewHashtagContent());

		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(ReviewHashtagVO reviewHashtagVO) {
		return false;
	}

	public boolean delete(ReviewHashtagVO reviewHashtagVO) {
		return false;
	}


}

//----------------------------------------------------------------------------------------------------

// selectAll
class ReviewHashtagSelect implements RowMapper<ReviewHashtagVO> {

	@Override
	public ReviewHashtagVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ReviewHashtagVO data = new ReviewHashtagVO();
		data.setReviewHashtagNum(rs.getInt("REVIEW_HASHTAG_NUM"));
		data.setReviewHashtagContent(rs.getString("REVIEW_HASHTAG_CONTENT"));
		return data;
		
	}
	
}

// SQL_SELECTALL_RANK
class ReviewHashtagRank implements RowMapper<ReviewHashtagVO> {

	@Override
	public ReviewHashtagVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ReviewHashtagVO data = new ReviewHashtagVO();
		data.setHashtagNum(rs.getInt("HASHTAG_NUM"));
		data.setUsageCount(rs.getInt("USAGE_COUNT"));
		data.setReviewHashtagContent(rs.getString("REVIEW_HASHTAG_CONTENT"));
		return data;
	}
	
}



