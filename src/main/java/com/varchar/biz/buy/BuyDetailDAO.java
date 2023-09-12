package com.varchar.biz.buy;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("buyDetailDAO")
public class BuyDetailDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_SELECTALL = "SELECT bd.BUY_SERIAL, t.TEA_NUM, t.TEA_NAME, t.TEA_CONTENT, t.TEA_PRICE, i.IMAGE_URL, bd.BUY_NUM, bd.BUY_CNT "
			+ "FROM BUY_DETAIL bd "
			+ "JOIN TEA t ON t.TEA_NUM = bd.TEA_NUM "
			+ "JOIN IMAGE i ON i.TEA_REVIEW_NUM = t.TEA_NUM "
			+ "WHERE bd.BUY_NUM = ?";

	static final private String SQL_SELECTALL_CARTRETRY =
			"SELECT TEA_NUM, BUY_CNT FROM BUY_DETAIL WHERE BUY_NUM = ?";


	static final private String SQL_SELECTONE = "SELECT BUY_SERIAL, BUY_NUM, TEA_NUM, BUY_CNT "
			+ "FROM BUY_DETAIL "
			+ "WHERE BUY_SERIAL= ?";

	static final private String SQL_SELECTONE_BUYNUM = "SELECT BUY_NUM "
			+ "FROM ("
			+ "    SELECT BUY_NUM "
			+ "    FROM BUY "
			+ "    WHERE MEMBER_ID = ? "
			+ "    ORDER BY BUY_NUM DESC "
			+ ")"
			+ "WHERE ROWNUM = 1";

	static final private String SQL_INSERT = "INSERT INTO BUY_DETAIL(BUY_SERIAL, BUY_NUM, TEA_NUM, BUY_CNT) "
			+ "VALUES((SELECT NVL(MAX(BUY_SERIAL), 0) + 1 FROM BUY_DETAIL), ?, ?, ?)";

	public List<BuyDetailVO> selectAll(BuyDetailVO buyDetailVO) {

		Object[] args = { buyDetailVO.getBuyNum() };

		if(buyDetailVO.getBuySearch().equals("다시담기")) {
			return jdbcTemplate.query(SQL_SELECTALL_CARTRETRY, args, new BuyDetailCartRetryRowMapper());
		}
		else {
			return jdbcTemplate.query(SQL_SELECTALL, args, new BuyDetailRowMapper());
		}
	}

	public BuyDetailVO selectOne(BuyDetailVO buyDetailVO) {

		try {

			if(buyDetailVO.getBuySearch().equals("주문번호")) {
				Object[] args = { buyDetailVO.getMemberId() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE_BUYNUM, args, new BuyDetailBuyNumRowMapper());
			}
			else {
				Object[] args = { buyDetailVO.getBuySerial() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new BuyDetailSelectOneRowMapper());
			}
		}
		catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public boolean insert(BuyDetailVO buyDetailVO) {

		int result = jdbcTemplate.update(SQL_INSERT, buyDetailVO.getBuyNum(), buyDetailVO.getTeaNum(), buyDetailVO.getBuyCnt());

		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(BuyDetailVO buyDetailVO) {
		return false;
	}

	public boolean delete(BuyDetailVO buyDetailVO) {
		return false;
	}
}

// -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

//다시 담기 [ selectAll ]
class BuyDetailCartRetryRowMapper implements RowMapper<BuyDetailVO> { 

	@Override
	public BuyDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException { 

		BuyDetailVO data = new BuyDetailVO();
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setBuyCnt(rs.getInt("BUY_CNT"));
		return data;
	} 
}

//[ selectAll ]
class BuyDetailRowMapper implements RowMapper<BuyDetailVO> {

	@Override
	public BuyDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException { 

		BuyDetailVO data = new BuyDetailVO();
		data.setBuySerial(rs.getInt("BUY_SERIAL"));
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setTeaName(rs.getString("TEA_NAME"));
		data.setTeaContent(rs.getString("TEA_CONTENT"));
		data.setTeaPrice(rs.getInt("TEA_PRICE"));
		data.setImageUrl(rs.getString("IMAGE_URL"));
		data.setBuyNum(rs.getInt("BUY_NUM"));
		data.setBuyCnt(rs.getInt("BUY_CNT"));
		return data;
	}
}

//주문 번호 [ selectOne ]
class BuyDetailBuyNumRowMapper implements RowMapper<BuyDetailVO> { 

	@Override
	public BuyDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		BuyDetailVO data = new BuyDetailVO();
		data.setBuyNum(rs.getInt("BUY_NUM"));
		return data;
	}
}

//[ selectOne ]
class BuyDetailSelectOneRowMapper implements RowMapper<BuyDetailVO> { 

	@Override
	public BuyDetailVO mapRow(ResultSet rs, int rowNum) throws SQLException {

		BuyDetailVO data = new BuyDetailVO();
		data.setBuySerial(rs.getInt("BUY_SERIAL"));
		data.setBuyNum(rs.getInt("BUY_NUM"));
		data.setTeaNum(rs.getInt("TEA_NUM"));
		data.setBuyCnt(rs.getInt("BUY_CNT"));
		return data;
	}
}
