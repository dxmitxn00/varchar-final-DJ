package com.varchar.biz.tea;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.varchar.biz.review.ReviewVO;

@Repository("reviewSetDAO")
public class ReviewSetDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final String SQL_SELECTONE_TEA = "SELECT TEA_NUM, TEA_NAME, TEA_PRICE, TEA_CNT, TEA_CATEGORY, TEA_CONTENT "
			+ "FROM TEA "
			+ "WHERE TEA_NUM = ?";

	//	static final String SQL_SELECTALL_REVIEW = "SELECT R.REVIEW_NUM, R.MEMBER_ID, R.REVIEW_CONTENT, BD.TEA_NUM, T.TEA_NAME, I.IMAGE_URL "
	//			+ "FROM REVIEW R "
	//			+ "JOIN BUY_DETAIL BD USING(BUY_SERIAL) "
	//			+ "JOIN TEA T USING(TEA_NUM) "
	//			+ "JOIN IMAGE I USING(TEA_NUM) "
	//			+ "WHERE T.TEA_NUM = ? "
	//			+ "AND I.IMAGE_DIVISION = 1 "
	//			+ "LIMIT 0, ?";

	static final String SQL_SELECTALL_REVIEW = "SELECT R.REVIEW_NUM, R.MEMBER_ID, R.REVIEW_CONTENT, BD.TEA_NUM, T.TEA_NAME, I.IMAGE_URL "
			+ "FROM REVIEW R "
			+ "JOIN BUY_DETAIL BD ON R.BUY_SERIAL = BD.BUY_SERIAL "
			+ "JOIN TEA T ON BD.TEA_NUM = T.TEA_NUM "
			+ "JOIN IMAGE I ON T.TEA_NUM = I.TEA_NUM "
			+ "WHERE T.TEA_NUM = ? AND I.IMAGE_DIVISION = 1 "
			+ "AND ROWNUM <= ?";

	// ㄴ> 상품 상세 페이지 ReviewSetVO만 사용!!!
	//			(상품 상세 필요한 데이터 SELECT절에 추가 - 칼럼이랑 rs만 추가하셈(출력하는 정보))


	//	static final String SQL_SELECTALL_REVIEW = "SELECT R.REVIEW_NUM, R.MEMBER_ID, R.BUY_SERIAL, R.REVIEW_CONTENT "
	//			+ "FROM ("
	//			+ "SELECT ROW_NUMBER() OVER(ORDER BY R.REVIEW_NUM) AS row_num, R.REVIEW_NUM, R.MEMBER_ID, R.BUY_SERIAL, R.REVIEW_CONTENT "
	//			+ "FROM REVIEW R"
	//			+ "JOIN BUY_DETAIL BD USING (BUY_SERIAL) "
	//			+ "JOIN BUY B USING(BUY_NUM) "
	//			+ "WHERE BD.TEA_NUM=?"
	//			+ ") AS R "
	//			+ "WHERE row_num BETWEEN ? AND ?+6;";

	public List<ReviewSet> selectAll(ReviewSet reviewSet){
		return null;
	}

	public ReviewSet selectOne(ReviewSet reviewSet) {
		
		try {
			ReviewSet data = jdbcTemplate.queryForObject(SQL_SELECTONE_TEA, new Object[]{ reviewSet.getTea().getTeaNum() }, new ReviewSetTeaRowMapper());
			List<ReviewVO> rdatas = jdbcTemplate.query(SQL_SELECTALL_REVIEW, new Object[]{ reviewSet.getTea().getTeaNum(), reviewSet.getTea().getStartRnum() }, new ReviewSetReviewRowMapper());

			data.setRdatas(rdatas);
			return data;
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

}


// -----------------------------------------------------------------------------------------------------

class ReviewSetTeaRowMapper implements RowMapper<ReviewSet> {

	@Override
	public ReviewSet mapRow(ResultSet rs, int rowNum) throws SQLException {

		ReviewSet res = new ReviewSet();
		TeaVO data = new TeaVO();

		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setTeaCnt(rs.getInt("TEA_CNT"));
		data.setTeaCategory(rs.getString("TEA_CATEGORY"));
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		res.setTea(data);
		return res;
	}
}

class ReviewSetReviewRowMapper implements RowMapper<ReviewVO> {

	@Override
	public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		ReviewVO rVO = new ReviewVO();
		rVO.setMemberId(rs.getString("MEMBER_ID"));
		rVO.setReviewContent(rs.getString("REVIEW_CONTENT"));
		rVO.setImageUrl(rs.getString("IMAGE_URL"));
		rVO.setReviewNum(rs.getInt("REVIEW_NUM"));
		return rVO;
	}

}
