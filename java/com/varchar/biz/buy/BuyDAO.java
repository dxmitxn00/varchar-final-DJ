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

	static final private String SQL_SELECTALL = "SELECT b.BUY_NUM, SUM(t.TEA_PRICE) AS TEA_PRICE, SUM(bd.BUY_CNT) AS BUY_CNT "
			+ "FROM BUY b "
			+ "JOIN BUY_DETAIL bd ON b.BUY_NUM = bd.BUY_NUM "
			+ "JOIN TEA t ON bd.TEA_NUM = t.TEA_NUM "
			+ "WHERE MEMBER_ID = ? "
			+ "GROUP BY b.BUY_NUM ";
	static final private String SQL_SELECTONE = "SELECT b.BUY_NUM, t.TEA_PRICE, bd.BUY_CNT "
			+ "FROM BUY b "
			+ "JOIN BUY_DETAIL bd ON b.BUY_NUM = bd.BUY_NUM "
			+ "JOIN TEA t ON bd.TEA_NUM = t.TEA_NUM "
			+ "WHERE b.BUY_NUM = ?";
	static final private String SQL_INSERT = "INSERT INTO BUY(BUY_NUM, MEMBER_ID) "
			+ " VALUES((SELECT NVL(MAX(BUY_NUM), 0) + 1 FROM BUY), ?)";


	public List<BuyVO> selectAll(BuyVO buyVO) {

		Object[] args = { buyVO.getMemberId() };
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
		data.setBuyCnt(rs.getInt("BUY_CNT"));
		return data;
	}

}
