package com.varchar.biz.category;

import java.util.List;

public interface CategoryService {
	
	public List<CategoryVO> selectAll(CategoryVO categoryVO);
	public CategoryVO selectOne(CategoryVO categoryVO);
	public boolean insert(CategoryVO categoryVO);
	public boolean update(CategoryVO categoryVO);
	public boolean delete(CategoryVO categoryVO);
}
