package com.varchar.biz.image;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


@Repository("imageDAO")
public class ImageDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplete;
	
	static final private String SQL_SELECTALL = "SELECT IMAGE_URL, IMAGE_DIVISION FROM IMAGE WHERE TEA_REVIEW_NUM = ?";
	
//	static final private String SQL_SELECTONE = "";
	
	static final private String SQL_INSERT = "INSERT INTO IMAGE(IMAGE_NUM, TEA_REVIEW_NUM, IMAGE_URL, IMAGE_DIVISION) "
											+ "VALUES((SELECT NVL(MAX(IMAGE_NUM), 0) + 1 FROM IMAGE), ?, ?, (SELECT COUNT(*) + 1 FROM IMAGE WHERE TEA_REVIEW_NUM = ?))";
	
	static final private String SQL_UPDATE = "UPDATE IMAGE SET IMAGE_URL = ? "
											+ "WHERE IMAGE_NUM = ? AND IMAGE_DIVISION = ?";
											
	static final private String SQL_DELETE = "DELETE FROM IMAGE WHERE TEA_REVIEW_NUM = ?";
	
	public List<ImageVO> selectAll(ImageVO imageVO){
		Object[] args = { imageVO.getTeaReviewNum() };
		return jdbcTemplete.query(SQL_SELECTALL, args, new ImageRowMapper());
	}
	
	public ImageVO selectOne(ImageVO imageVO){
		return null;
	}

	public boolean insert(ImageVO imageVO) {
		
		int result = jdbcTemplete.update(SQL_INSERT, imageVO.getTeaReviewNum(), imageVO.getImageUrl(), imageVO.getTeaReviewNum());
		
		if(result <= 0) {
			return false;
		}
		
		return true;
	}
	
	public boolean update(ImageVO imageVO) {
		
		int result = jdbcTemplete.update(SQL_UPDATE, imageVO.getImageUrl(), imageVO.getImageNum(), imageVO.getImageDivision());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}
	
	public boolean delete(ImageVO imageVO) {
		
		int result = jdbcTemplete.update(SQL_DELETE, imageVO.getTeaReviewNum());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}
}

// ---------------------------------------------------------------

// SQL_SELECTALL
class ImageRowMapper implements RowMapper<ImageVO> {

	@Override
	public ImageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ImageVO data=new ImageVO();
		data.setImageUrl(rs.getString("IMAGE_URL"));
		data.setImageDivision(rs.getInt("IMAGE_DIVISION"));
		return data;
	}
	
}

