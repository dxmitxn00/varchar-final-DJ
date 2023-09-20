package com.varchar.biz.favor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("favorDAO")
public class FavorDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_SELECTALL ="SELECT f.FAVOR_NUM, m.MEMBER_NAME, f.TEA_NUM, t.TEA_NAME, t.TEA_PRICE, t.TEA_CONTENT, i.IMAGE_URL "
			+ "FROM FAVOR f "
			+ "JOIN TEA t ON t.TEA_NUM = f.TEA_NUM "
			+ "JOIN MEMBER m ON m.MEMBER_ID = f.MEMBER_ID "
			+ "JOIN IMAGE i ON i.TEA_REVIEW_NUM = t.TEA_NUM "
			+ "WHERE f.MEMBER_ID = ? AND i.IMAGE_DIVISION = 1";
	
 	static final private String SQL_SELECTONE = "SELECT FAVOR_NUM FROM FAVOR WHERE MEMBER_ID = ? AND TEA_NUM = ?";
	static final private String SQL_INSERT = "INSERT INTO FAVOR(FAVOR_NUM, MEMBER_ID, TEA_NUM) "
			+ "VALUES((SELECT NVL(MAX(FAVOR_NUM), 0) + 1 FROM FAVOR), ?, ?)";
	static final private String SQL_DELETE = "DELETE FROM FAVOR WHERE MEMBER_ID  = ? AND TEA_NUM = ?";

	public List<FavorVO> selectAll(FavorVO favorVO) {
		
		Object[] args = { favorVO.getMemberId() };
		return jdbcTemplate.query(SQL_SELECTALL, args, new FavorSelectAllRowMapper());

	}

	public FavorVO selectOne(FavorVO favorVO) {
		try {
			Object[] args = { favorVO.getMemberId(), favorVO.getTeaNum() };
			return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new FavorSelectOneRowMapper());
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean insert(FavorVO favorVO) {
		
		int result = jdbcTemplate.update(SQL_INSERT, favorVO.getMemberId(), favorVO.getTeaNum());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(FavorVO favorVO) {
		return false;
	}

	public boolean delete(FavorVO favorVO) {
		
		int result = jdbcTemplate.update(SQL_DELETE, favorVO.getMemberId(), favorVO.getTeaNum());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}
}

// -----------------------------------------------------------------------

//[ selectAll ]
class FavorSelectAllRowMapper implements RowMapper<FavorVO> { 

	@Override
	public FavorVO mapRow(ResultSet rs, int rowNum) throws SQLException { 
		
		FavorVO data = new FavorVO();
		data.setFavorNum(rs.getInt("FAVOR_NUM"));
		data.setMemberName(rs.getString("MEMBER_NAME"));
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		return data;
	}
}

//[ selectOne ]
class FavorSelectOneRowMapper implements RowMapper<FavorVO> {

	@Override
	public FavorVO mapRow(ResultSet rs, int rowNum) throws SQLException { 
		FavorVO data = new FavorVO();
		data.setFavorNum(rs.getInt("FAVOR_NUM"));
		return data;
	}
}
