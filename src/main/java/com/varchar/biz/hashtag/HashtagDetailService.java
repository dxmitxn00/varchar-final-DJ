package com.varchar.biz.hashtag;

import java.util.List;

public interface HashtagDetailService {

	public HashtagDetailVO selectOne(HashtagDetailVO hashtagDetailVO);
	public List<HashtagDetailVO> selectAll(HashtagDetailVO hashtagDetailVO);
	public boolean update(HashtagDetailVO hashtagDetailVO);
	public boolean delete(HashtagDetailVO hashtagDetailVO);
	public boolean insert(HashtagDetailVO hashtagDetailVO);
	
	
	
}
