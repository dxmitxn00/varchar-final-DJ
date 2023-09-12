package com.varchar.biz.hashtag;

import java.util.List;

public interface ReviewHashtagService {

	public ReviewHashtagVO selectOne(ReviewHashtagVO reviewHashtagVO);
	public List<ReviewHashtagVO> selectAll(ReviewHashtagVO reviewHashtagVO);
	public boolean update(ReviewHashtagVO reviewHashtagVO);
	public boolean delete(ReviewHashtagVO reviewHashtagVO);
	public boolean insert(ReviewHashtagVO reviewHashtagVO);
	
}
