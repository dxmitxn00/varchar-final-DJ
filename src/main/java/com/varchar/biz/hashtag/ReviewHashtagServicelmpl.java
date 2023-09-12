package com.varchar.biz.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("ReviewHashtagService")
public class ReviewHashtagServicelmpl implements ReviewHashtagService {

	@Autowired
	private ReviewHashtagDAO reviewHashtagDAO;

	@Override
	public ReviewHashtagVO selectOne(ReviewHashtagVO reviewHashtagVO) {
		return reviewHashtagDAO.selectOne(reviewHashtagVO);
	}

	@Override
	public List<ReviewHashtagVO> selectAll(ReviewHashtagVO reviewHashtagVO) {
		return reviewHashtagDAO.selectAll(reviewHashtagVO);
	}

	@Override
	public boolean update(ReviewHashtagVO reviewHashtagVO) {
		return reviewHashtagDAO.update(reviewHashtagVO);
	}

	@Override
	public boolean delete(ReviewHashtagVO reviewHashtagVO) {
		return reviewHashtagDAO.delete(reviewHashtagVO);
	}

	@Override
	public boolean insert(ReviewHashtagVO reviewHashtagVO) {
		return reviewHashtagDAO.insert(reviewHashtagVO);
	}
}
