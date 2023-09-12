package com.varchar.biz.tea;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("teaDAO")
public class TeaDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	//	static final private String SQL_SELECTALL = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL\r\n"
	//			+ "FROM TEA t JOIN IMAGE i USING (TEA_NUM)\r\n"
	//			+ "WHERE t.TEA_CATEGORY LIKE CONCAT('%', ?, '%') "
	//			+ "AND t.TEA_NAME LIKE CONCAT('%', ?, '%') "
	//			+ "AND i.IMAGE_DIVISION = 1;";

	static final private String SQL_SELECTALL = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL "
			+ "FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_NUM "
			+ "WHERE t.TEA_CATEGORY LIKE '%' || ? || '%' "
			+ "AND t.TEA_NAME LIKE '%' || ? || '%' "
			+ "AND i.IMAGE_DIVISION = 1";
	
	

	//	static final private String SQL_SELECTALL_PAGING = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL\r\n"
	//			+ "FROM TEA t JOIN IMAGE i USING (TEA_NUM)\r\n"
	//			+ "WHERE t.TEA_CATEGORY LIKE CONCAT('%', ?, '%') "
	//			+ "AND t.TEA_NAME LIKE CONCAT('%', ?, '%') "
	//			+ "AND i.IMAGE_DIVISION = 1 "
	//			+ "LIMIT ?, 6";

	static final private String SQL_SELECTALL_PAGING = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, t.IMAGE_URL "
			+ "FROM ("
			+ "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL, ROWNUM AS rnum "
			+ "FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_NUM "
			+ "WHERE t.TEA_CATEGORY LIKE '%' || ? || '%' AND t.TEA_NAME LIKE '%' || ? || '%' AND i.IMAGE_DIVISION = 1 "
			+ ") t "
			+ "WHERE t.rnum BETWEEN ? AND ? + 7";
	
	static final private String SQL_SELECTALL_PAGING_LIKE = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, t.IMAGE_URL, t.FAVOR_NUM "
			+ "FROM ( "
			+ "	SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL, f.FAVOR_NUM, ROWNUM AS rnum "
			+ "	FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_NUM "
			+ "		LEFT JOIN ( "
			+ "		SELECT * "
			+ "		FROM FAVOR "
			+ "		WHERE MEMBER_ID = ? "
			+ "	) "
			+ "	f ON t.TEA_NUM =  f.TEA_NUM "
			+ "	WHERE t.TEA_CATEGORY LIKE '%' || ? || '%' AND t.TEA_NAME LIKE '%' || ? || '%' AND i.IMAGE_DIVISION = 1 "
			+ ") t "
			+ "WHERE t.rnum BETWEEN ? AND ? + 7 ";

	//	static final private String SQL_SELECTONE = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL\r\n"
	//			+ "FROM TEA t JOIN IMAGE i USING (TEA_NUM) "
	//			+ "WHERE i.IMAGE_DIVISION = 1 AND t.TEA_NUM = ?;";

	static final private String SQL_SELECTONE = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CATEGORY, t.TEA_CONTENT, i.IMAGE_URL "
			+ "FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_NUM "
			+ "WHERE i.IMAGE_DIVISION = 1 AND t.TEA_NUM = ?";

	static final private String SQL_UPDATE = "UPDATE TEA SET TEA_CNT = (TEA_CNT - ?) WHERE TEA_NUM = ? ";
	//	static final private String SQL_INSERT = "";
	//	static final private String SQL_DELETE = "";

	public List<TeaVO> selectAll(TeaVO teaVO) {

		if(teaVO.getTeaCondition().equals("페이징")) {
			Object[] args = {teaVO.getTeaName(), teaVO.getTeaCategory(), teaVO.getTeaSearchWord(), teaVO.getStartRnum(), teaVO.getStartRnum()};
			return jdbcTemplate.query(SQL_SELECTALL_PAGING_LIKE, args, new TeaPagingRowMapper());
		}
		else {
			Object[] args = {teaVO.getTeaCategory(), teaVO.getTeaSearchWord() };
			return jdbcTemplate.query(SQL_SELECTALL, args, new TeaSelectRowMapper());
		}
	}

	public TeaVO selectOne(TeaVO teaVO) {
		try {
			Object[] args = { teaVO.getTeaNum() };
			return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new TeaSelectRowMapper());
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean insert(TeaVO teaVO) {
		return false;
	}

	public boolean update(TeaVO teaVO) {

		int result = jdbcTemplate.update(SQL_UPDATE, teaVO.getTeaCnt(), teaVO.getTeaNum());

		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean delete(TeaVO teaVO) {
		return false;
	}
}


// ---------------------------------------------------------------------------

// 페이징 [ selectAll ]
class TeaPagingRowMapper implements RowMapper<TeaVO> {

	@Override
	public TeaVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		TeaVO data = new TeaVO();
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setTeaCnt(rs.getInt("TEA_CNT"));
		data.setTeaCategory(rs.getString("TEA_CATEGORY"));
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		data.setFavorResult(rs.getInt("FAVOR_NUM"));
		return data;
	}
}

// [ selectAll, selectOne ]
class TeaSelectRowMapper implements RowMapper<TeaVO> {

	@Override
	public TeaVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		TeaVO data = new TeaVO();
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setTeaCnt(rs.getInt("TEA_CNT"));
		data.setTeaCategory(rs.getString("TEA_CATEGORY"));
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		return data;
	}

}