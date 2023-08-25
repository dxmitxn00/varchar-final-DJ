package com.varchar.biz.tea;

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
	
	static final private String SQL_SELECTALL = "SELECT IMAGE_URL, IMAGE_DIVISION FROM IMAGE WHERE TEA_NUM = ?";
//	static final private String SQL_SELECTONE = "";
//	static final private String SQL_INSERT = "";
//	static final private String SQL_UPDATE = "";
//	static final private String SQL_DELETE = "";
	
	public List<ImageVO> selectAll(ImageVO imageVO){
		Object[] args = { imageVO.getTeaNum() };
		return jdbcTemplete.query(SQL_SELECTALL, args, new ImageRowMapper());
	}
	
	public ImageVO selectOne(ImageVO imageVO){
		return null;
	}

	public boolean insert(ImageVO imageVO) {
		return false;
	}
	
	public boolean update(ImageVO imageVO) {
		return false;
	}
	
	public boolean delete(ImageVO imageVO) {
		return false;
	}

}

// ---------------------------------------------------------------

class ImageRowMapper implements RowMapper<ImageVO> {

	@Override
	public ImageVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		ImageVO data=new ImageVO();
		data.setImageUrl(rs.getString("IMAGE_URL"));
		data.setImageDivision(rs.getInt("IMAGE_DIVISION"));
		return data;
	}
	
}

