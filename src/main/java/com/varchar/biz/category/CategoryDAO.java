package com.varchar.biz.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository("categoryDAO")
public class CategoryDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	// static final private String SQL_SELECTALL = "";
	// static final private String SQL_SELECTONE = "";
	static final private String SQL_INSERT = "INSERT INTO CATEGORY(CATEGORY_NUM, CATEGORY_NAME) "
											+ "VALUES ((SELECT NVL(MAX(CATEGORY_NUM), O) + 1 FROM CATEGORY), ?)";
	// static final private String SQL_UPDATE = "";
	// static final private String SQL_DELETE = "";
	
	
	public List<CategoryVO> selectAll(CategoryVO categoryVO) {
		return null;
	}
	
	public CategoryVO selectOne(CategoryVO categoryVO) {
		return null;
	}
	
	public boolean insert(CategoryVO categoryVO) {
		
		int result = jdbcTemplate.update(SQL_INSERT, categoryVO.getCategoryName());
		
		if(result <= 0) {
			return false;
		}
		return true;
	}
	
	public boolean update(CategoryVO categoryVO) {
		return false;
	}
	
	public boolean delete(CategoryVO categoryVO) {
		return false;
	}
}
