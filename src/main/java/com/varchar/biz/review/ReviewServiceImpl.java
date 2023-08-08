package com.varchar.biz.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public ReviewVO selectOne(ReviewVO rVO) {
		return reviewDAO.selectOne(rVO);
	}

	@Override
	public List<ReviewVO> selectAll(ReviewVO rVO) {
		return reviewDAO.selectAll(rVO);
	}

	@Override
	public boolean update(ReviewVO rVO) {
		return reviewDAO.update(rVO);
	}

	@Override
	public boolean delete(ReviewVO rVO) {
		return reviewDAO.delete(rVO);
	}

	@Override
	public boolean insert(ReviewVO rVO) {
		return reviewDAO.insert(rVO);
	}

	
}
