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

	static final private String SQL_SELECTALL =
		"SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, c.CATEGORY_NAME, t.TEA_STATUS, i.IMAGE_URL "
		+ "FROM TEA t "
		+ "JOIN IMAGE i ON t.TEA_NUM = i.TEA_REVIEW_NUM "
		+ "JOIN CATEGORY c ON c.CATEGORY_NUM = t.CATEGORY_NUM "
		+ "WHERE c.CATEGORY_NAME LIKE '%' || ? || '%' "
		+ "AND t.TEA_NAME LIKE '%' || ? || '%' "
		+ "AND i.IMAGE_DIVISION = 1 ";

//	static final private String SQL_SELECTALL_PAGING =
//			"SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, t.CATEGORY_NAME, t.IMAGE_URL "
//			+ "FROM( "
//			+ "	SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, c.CATEGORY_NAME, i.IMAGE_URL, ROWNUM AS rnum "
//			+ "	FROM TEA t JOIN IMAGE i ON i.TEA_REVIEW_NUM = t.TEA_NUM "
//			+ "	JOIN CATEGORY c ON c.CATEGORY_NUM = t.CATEGORY_NUM "
//			+ "	WHERE CATEGORY_NAME LIKE '%' || ? || '%' "
//			+ "	AND TEA_NAME LIKE '%' || ? || '%' "
//			+ ") t "
//			+ "WHERE t.rnum BETWEEN ? AND ? + 5";
	
	static final private String SQL_SELECTALL_PAGING_LIKE = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.CATEGORY_NAME, t.TEA_CONTENT, t.TEA_STATUS, t.IMAGE_URL, t.FAVOR_NUM "
			+ "FROM ( "
				+ "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_STATUS, c.CATEGORY_NAME, t.TEA_CONTENT, i.IMAGE_URL, f.FAVOR_NUM, ROWNUM AS rnum "
				+ "FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_REVIEW_NUM "
				+ "LEFT JOIN ( "
					+ "SELECT FAVOR_NUM, TEA_NUM, MEMBER_ID "
					+ "FROM FAVOR "
					+ "WHERE MEMBER_ID = ? "
				+ ") "
				+ "f ON t.TEA_NUM = f.TEA_NUM "
				+ "JOIN CATEGORY c ON c.CATEGORY_NUM = t.CATEGORY_NUM "
				+ "WHERE c.CATEGORY_NAME LIKE '%' || ? || '%' AND t.TEA_NAME LIKE '%' || ? || '%' AND i.IMAGE_DIVISION = 1 "
			+ ") t "
			+ "WHERE t.rnum BETWEEN ? AND ? ";

	static final private String SQL_SELECTONE =
			"SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, c.CATEGORY_NAME, t.TEA_STATUS, i.IMAGE_URL "
			+ "FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_REVIEW_NUM "
			+ "JOIN CATEGORY c ON t.CATEGORY_NUM = c.CATEGORY_NUM "
			+ "WHERE i.IMAGE_DIVISION = 1 "
			+ "AND TEA_NUM = ? ";

	static final private String SQL_UPDATE = "UPDATE TEA SET TEA_CNT = (TEA_CNT - ?) "
											+ "WHERE TEA_NUM = ? ";
	
	static final private String SQL_UPDATE_TEA = "UPDATE TEA SET TEA_STATUS = ? WHERE TEA_NUM = ?";
	
	static final private String SQL_INSERT = "INSERT INTO TEA(TEA_NUM, CATEGORY_NUM, TEA_NAME, TEA_PRICE, TEA_CNT, TEA_CONTENT) "
												+ "VALUES((SELECT NVL(MAX(TEA_NUM),1000)+1 FROM TEA), ?, ?, ?, ?, ?)";
		
	// static final private String SQL_DELETE = "DELETE FROM TEA WHERE TEA_NUM = ?;";

	public List<TeaVO> selectAll(TeaVO teaVO) {

		if(teaVO.getTeaCondition().equals("페이징")) {
			Object[] args = { teaVO.getMemberId(), teaVO.getCategoryName(), teaVO.getTeaSearchWord(), teaVO.getStartRnum(), teaVO.getEndRnum() };
			return jdbcTemplate.query(SQL_SELECTALL_PAGING_LIKE, args, new TeaPagingRowMapper());
		}
		else { // ALL
			Object[] args = { teaVO.getCategoryName(), teaVO.getTeaSearchWord() };
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
		
		int result = jdbcTemplate.update(SQL_INSERT, teaVO.getTeaName(), teaVO.getTeaPrice(), teaVO.getTeaCnt(), teaVO.getTeaContent());
		
		if(result <= 0) {
			return false;
		}
		return true;
		
	}

	public boolean update(TeaVO teaVO) {

		int result = 0;
		
		if(teaVO.getTeaCondition().equals("재고변경")) { 
			result = jdbcTemplate.update(SQL_UPDATE, teaVO.getTeaCnt(), teaVO.getTeaNum());
		}
		else { // 판매중단된 상품
			result = jdbcTemplate.update(SQL_UPDATE_TEA, teaVO.getTeaStatus(), teaVO.getTeaNum());
		}

		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean delete(TeaVO teaVO) {
		
//		int result = jdbcTemplate.update(SQL_DELETE, teaVO.getTeaNum());
//		
//		if(result <= 0) {
//			return false;
//		}
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
		data.setCategoryName(rs.getString("CATEGORY_NAME"));
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
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		data.setCategoryName(rs.getString("CATEGORY_NAME"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		return data;
	}

}