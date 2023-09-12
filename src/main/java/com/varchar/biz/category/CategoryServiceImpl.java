package com.varchar.biz.category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("CategoryService")
public class CategoryServiceImpl implements CategoryService {
	
	@Autowired
	CategoryDAO categoryDAO;

	@Override
	public List<CategoryVO> selectAll(CategoryVO categoryVO) {
		return categoryDAO.selectAll(categoryVO);
	}

	@Override
	public CategoryVO selectOne(CategoryVO categoryVO) {
		return categoryDAO.selectOne(categoryVO);
	}

	@Override
	public boolean insert(CategoryVO categoryVO) {
		return categoryDAO.insert(categoryVO);
	}

	@Override
	public boolean update(CategoryVO categoryVO) {
		return categoryDAO.update(categoryVO);
	}

	@Override
	public boolean delete(CategoryVO categoryVO) {
		return categoryDAO.delete(categoryVO);
	}
	
}
