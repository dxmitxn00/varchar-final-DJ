package com.varchar.biz.buy;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("buyDAO")
public class BuyDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_SELECTALL = "SELECT "
			+ "    b.BUY_NUM, "
			+ "    (SELECT SUM(t2.TEA_PRICE * bd2.BUY_CNT) "
			+ "     FROM BUY_DETAIL bd2 "
			+ "     JOIN TEA t2 ON bd2.TEA_NUM = t2.TEA_NUM "
			+ "     WHERE bd2.BUY_NUM = b.BUY_NUM) AS TEA_PRICE, "
			+ "    (SELECT SUM(bd3.BUY_CNT) FROM BUY_DETAIL bd3 WHERE bd3.BUY_NUM = b.BUY_NUM) AS BUY_CNT, "
			+ "    (SELECT COUNT(bd4.TEA_NUM) AS BUY_COUNT FROM BUY_DETAIL bd4 WHERE bd4.BUY_NUM = b.BUY_NUM) AS BUY_COUNT, "
			+ "    t.TEA_NUM, t.TEA_NAME AS BUY_NAME, i.IMAGE_URL "
			+ "FROM BUY b "
			+ "JOIN BUY_DETAIL bd ON b.BUY_NUM = bd.BUY_NUM "
			+ "JOIN TEA t ON bd.TEA_NUM = t.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_REVIEW_NUM = t.TEA_NUM "
			+ "JOIN ( "
			+ "    SELECT b2.BUY_NUM, MIN(t2.TEA_NUM) AS MIN_TEA_NUM "
			+ "    FROM BUY b2 "
			+ "    JOIN BUY_DETAIL bd2 ON b2.BUY_NUM = bd2.BUY_NUM "
			+ "    JOIN TEA t2 ON bd2.TEA_NUM = t2.TEA_NUM "
			+ "    WHERE MEMBER_ID = ? "
			+ "    GROUP BY b2.BUY_NUM "
			+ ") min_tea ON b.BUY_NUM = min_tea.BUY_NUM "
			+ "WHERE MEMBER_ID = ? AND i.IMAGE_DIVISION = 1 AND t.TEA_NUM = min_tea.MIN_TEA_NUM "
			+ "GROUP BY b.BUY_NUM, t.TEA_NUM, t.TEA_NAME, i.IMAGE_URL "
			+ "ORDER BY b.BUY_NUM DESC ";
	
	static final private String SQL_SELECTONE = "SELECT b.BUY_NUM, t.TEA_PRICE, bd.BUY_CNT "
			+ "FROM BUY b "
			+ "JOIN BUY_DETAIL bd ON b.BUY_NUM = bd.BUY_NUM "
			+ "JOIN TEA t ON bd.TEA_NUM = t.TEA_NUM "
			+ "WHERE b.BUY_NUM = ?";
	static final private String SQL_INSERT = "INSERT INTO BUY(BUY_NUM, MEMBER_ID) "
			+ " VALUES((SELECT NVL(MAX(BUY_NUM), 0) + 1 FROM BUY), ?)";


	public List<BuyVO> selectAll(BuyVO buyVO) {

		Object[] args = { buyVO.getMemberId(), buyVO.getMemberId() };
		return jdbcTemplate.query(SQL_SELECTALL, args, new BuyRowMapper());
	}

	public BuyVO selectOne(BuyVO buyVO) {
		try {
			Object[] args = { buyVO.getBuyNum() };
			return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new BuyRowMapper());
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean insert(BuyVO buyVO) {
		int result = jdbcTemplate.update(SQL_INSERT, buyVO.getMemberId());

		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(BuyVO buyVO) {
		return false;
	}

	public boolean delete(BuyVO buyVO) {
		return false;
	}
}

// [ SelectAll, SelectOne ]
class BuyRowMapper implements RowMapper<BuyVO> { 

	@Override
	public BuyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BuyVO data = new BuyVO();
		data.setBuyNum(rs.getInt("BUY_NUM"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setBuyCount(rs.getInt("BUY_COUNT"));
		data.setBuyCnt(rs.getInt("BUY_CNT"));
		data.setBuyName(rs.getString("BUY_NAME"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		return data;
	}

}
