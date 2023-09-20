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

		static final private String SQL_SELECTALL_CATEGORY =
				"SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, t.TEA_STATUS, t.CATEGORY_NUM, i.IMAGE_URL "
				+ "FROM TEA t "
				+ "JOIN IMAGE i ON i.TEA_REVIEW_NUM = t.TEA_NUM "
				+ "JOIN CATEGORY c ON c.CATEGORY_NUM = t.CATEGORY_NUM "
				+ "WHERE i.IMAGE_DIVISION = 1 AND t.CATEGORY_NUM = ?";
		
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
					+ "WHERE c.CATEGORY_NAME LIKE '%' || ? || '%' "
					+ "AND t.TEA_NAME LIKE '%' || ? || '%' "
					+ "AND i.IMAGE_DIVISION = 1 "
				+ ") t "
				+ "WHERE t.rnum BETWEEN ? AND ? ";
		
		static final private String SQL_SELECTALL_HASHTAG = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, c.CATEGORY_NAME, t.TEA_STATUS, i.IMAGE_URL "
		         + "FROM TEA_HASHTAG th "
		         + "JOIN HASHTAG_DETAIL hd ON hd.HASHTAG_NUM = th.TEA_HASHTAG_NUM "
		         + "JOIN TEA t ON hd.ITEM_NUM = t.TEA_NUM "
		         + "JOIN IMAGE i ON t.TEA_NUM = i.TEA_REVIEW_NUM "
		         + "JOIN CATEGORY c ON c.CATEGORY_NUM = t.CATEGORY_NUM "
		         + "WHERE th.TEA_HASHTAG_CONTENT = ? "
		         + "AND i.IMAGE_DIVISION = 1 ";
		
		static final private String SQL_SELECTALL_HASHTAG_PAGING_LIKE = "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, t.CATEGORY_NAME, t.TEA_STATUS, t.IMAGE_URL, t.FAVOR_NUM "
		         + "FROM ( "
			         + "SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, c.CATEGORY_NAME, t.TEA_STATUS, i.IMAGE_URL, f.FAVOR_NUM, ROWNUM AS rnum "
			         + "FROM TEA_HASHTAG th "
			         + "JOIN HASHTAG_DETAIL hd ON hd.HASHTAG_NUM = th.TEA_HASHTAG_NUM "
			         + "JOIN TEA t ON hd.ITEM_NUM = t.TEA_NUM "
			         + "JOIN IMAGE i ON t.TEA_NUM = i.TEA_REVIEW_NUM "
			         + "JOIN CATEGORY c ON c.CATEGORY_NUM = t.CATEGORY_NUM "
			         + "LEFT JOIN ( "
			         	+ "SELECT FAVOR_NUM, TEA_NUM, MEMBER_ID "
			         	+ "FROM FAVOR "
			         	+ "WHERE MEMBER_ID = ? "
			         + ") f ON t.TEA_NUM = f.TEA_NUM "
			         + "WHERE th.TEA_HASHTAG_CONTENT = ? "
			         + "AND i.IMAGE_DIVISION = 1 "
		         + ") t "
		         + "WHERE rnum BETWEEN ? AND ?";
		
		static final private String SQL_SELECTONE =
				"SELECT t.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CNT, t.TEA_CONTENT, c.CATEGORY_NAME, t.TEA_STATUS, i.IMAGE_URL "
				+ "FROM TEA t JOIN IMAGE i ON t.TEA_NUM = i.TEA_REVIEW_NUM "
				+ "JOIN CATEGORY c ON t.CATEGORY_NUM = c.CATEGORY_NUM "
				+ "WHERE i.IMAGE_DIVISION = 1 "
				+ "AND t.TEA_NUM = ? ";

		static final private String SQL_UPDATE = "UPDATE TEA SET TEA_CNT = (TEA_CNT - ?) "
												+ "WHERE TEA_NUM = ? ";
		
		static final private String SQL_UPDATE_TEA = "UPDATE TEA SET TEA_STATUS = ? WHERE TEA_NUM = ?";
		
		static final private String SQL_UPDATE_ADMIN = "UPDATE TEA SET TEA_PRICE = ?, TEA_CNT = ? WHERE TEA_NUM = ? ";
		
		static final private String SQL_UPDATE_CATEGORY = "UPDATE TEA SET CATEGORY_NUM = 0 WHERE CATEGORY_NUM = ? ";
		
		static final private String SQL_INSERT = "INSERT INTO TEA(TEA_NUM, CATEGORY_NUM, TEA_NAME, TEA_PRICE, TEA_CNT, TEA_CONTENT) "
													+ "VALUES((SELECT NVL(MAX(TEA_NUM),1000)+1 FROM TEA), ?, ?, ?, ?, ?)";
			
		static final private String SQL_DELETE = "DELETE FROM TEA WHERE TEA_NUM = ? ";


	public List<TeaVO> selectAll(TeaVO teaVO) {

		if(teaVO.getTeaCondition().equals("페이징")) {
			Object[] args = { teaVO.getMemberId(), teaVO.getCategoryName(), teaVO.getTeaSearchWord(), teaVO.getStartRnum(), teaVO.getEndRnum() };
			return jdbcTemplate.query(SQL_SELECTALL_PAGING_LIKE, args, new TeaPagingRowMapper());
		}
		else if(teaVO.getTeaCondition().equals("카테고리")) {
			Object[] args = { teaVO.getCategoryNum() };
			return jdbcTemplate.query(SQL_SELECTALL_CATEGORY, args, new TeaAdminRowMapper());
		}
		else if(teaVO.getTeaCondition().equals("해시태그 페이징")) {
			Object[] args = { teaVO.getMemberId(), teaVO.getTeaHashtagContent(), teaVO.getStartRnum(), teaVO.getEndRnum() };
			return jdbcTemplate.query(SQL_SELECTALL_HASHTAG_PAGING_LIKE, args, new TeaPagingRowMapper());
		}
		else if(teaVO.getTeaCondition().equals("해시태그")) {
			Object[] args = { teaVO.getTeaHashtagContent() };
			return jdbcTemplate.query(SQL_SELECTALL_HASHTAG, args, new TeaSelectRowMapper());
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
		
		int result = jdbcTemplate.update(SQL_INSERT, teaVO.getCategoryNum(), teaVO.getTeaName(), teaVO.getTeaPrice(), teaVO.getTeaCnt(), teaVO.getTeaContent());
		
		if(result <= 0) {
			return false;
		}
		return true;
		
	}

	public boolean update(TeaVO teaVO) {

		int result = 0;
		
		if(teaVO.getTeaCondition().equals("재고변경")) { // 구매시 재고 변경
			result = jdbcTemplate.update(SQL_UPDATE, teaVO.getTeaCnt(), teaVO.getTeaNum());
		}
		else if(teaVO.getTeaCondition().equals("상품변경")) { // 관리자 상품 정보 변경
			result = jdbcTemplate.update(SQL_UPDATE_ADMIN, teaVO.getTeaPrice(), teaVO.getTeaCnt(), teaVO.getTeaNum());
		}
		else if(teaVO.getTeaCondition().equals("카테고리변경")) { // 관리자 상품 정보 변경
			result = jdbcTemplate.update(SQL_UPDATE_CATEGORY, teaVO.getCategoryNum());
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
		
		int result = jdbcTemplate.update(SQL_DELETE, teaVO.getTeaNum());
		
		if(result <= 0) {
			return false;
		}
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
		data.setTeaStatus(rs.getInt("TEA_STATUS"));
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

//ADMIN CATEGORY [ selectAll ]
class TeaAdminRowMapper implements RowMapper<TeaVO> {

	@Override
	public TeaVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		TeaVO data = new TeaVO();
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setTeaCnt(rs.getInt("TEA_CNT"));
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		data.setTeaStatus(rs.getInt("TEA_STATUS"));
		data.setCategoryNum(rs.getInt("CATEGORY_NUM"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		return data;
	}
}
