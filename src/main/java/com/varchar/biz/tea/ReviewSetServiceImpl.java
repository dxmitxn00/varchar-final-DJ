package com.varchar.biz.tea;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReviewSetService")
public class ReviewSetServiceImpl implements ReviewSetService {
	
	@Autowired
	private ReviewSetDAO reviewSetDAO;

	@Override
	public ReviewSet selectOne(ReviewSet rsVO) {
		//return reviewSetDAO.selectOne(rsVO);
		return null;
	}

	@Override
	public List<ReviewSet> selectAll(ReviewSet rsVO) {
		return reviewSetDAO.selectAll(rsVO);
		// return null;
	}

	@Override
	public boolean update(ReviewSet rsVO) {
		return false;
	}

	@Override
	public boolean delete(ReviewSet rsVO) {
		return false;
	}

	@Override
	public boolean insert(ReviewSet rsVO) {
		return false;
	}

}
