package com.varchar.biz.hashtag;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("ReviewHashtagDAO")
public class ReviewHashtagDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;


	static final private String SQL_SELECTALL = "SELECT REVIEW_HASHTAG_NUM, REVIEW_HASHTAG_CONTENT "
												+ "FROM REVIEW_HASHTAG rh "
												+ "JOIN HASHTAG_DETAIL hd ON hd.HASHTAG_NUM = rh.REVIEW_HASHTAG_NUM "
												+ "WHERE ITEM_NUM = ?";
	
	static final private String SQL_INSERT ="INSERT INTO REVIEW_HASHTAG(REVIEW_HASHTAG_NUM, REVIEW_HASHTAG_CONTENT) "
			+ "VALUES ((SELECT NVL(MAX(REVIEW_HASHTAG_NUM, 2000)+1 FROM REVIEW_HASHTAG, ?)";

	public List<ReviewHashtagVO> selectAll(ReviewHashtagVO reviewHashtagVO) {
		
		Object[] args = { reviewHashtagVO.getItemNum() };
		return jdbcTemplate.query(SQL_SELECTALL, args, new ReviewHashtagSelect());
	}

	public ReviewHashtagVO selectOne(ReviewHashtagVO reviewHashtagVO) {
		return null;
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

class ReviewHashtagSelect implements RowMapper<ReviewHashtagVO> {

	@Override
	public ReviewHashtagVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		
		ReviewHashtagVO data = new ReviewHashtagVO();
		data.setReviewHashtagNum(rs.getInt("REVIEW_HASHTAG_NUM"));
		data.setReviewHashtagContent(rs.getString("REVIEW_HASHTAG_CONTENT"));
		return data;
		
	}
	
}