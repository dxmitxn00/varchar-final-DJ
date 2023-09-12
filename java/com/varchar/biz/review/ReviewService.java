package com.varchar.biz.review;

import java.util.List;

public interface ReviewService {

	public ReviewVO selectOne(ReviewVO rVO);
	public List<ReviewVO> selectAll(ReviewVO rVO);
	public boolean update(ReviewVO rVO);
	public boolean delete(ReviewVO rVO);
	public boolean insert(ReviewVO rVO);
}
