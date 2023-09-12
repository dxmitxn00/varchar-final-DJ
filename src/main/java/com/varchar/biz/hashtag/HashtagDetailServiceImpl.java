package com.varchar.biz.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("HashtagDetailService")
public class HashtagDetailServiceImpl implements HashtagDetailService {
	
	@Autowired
	private HashtagDetailDAO hashtagDetailDAO;//가져다 쓰기 위해 
	
	
	@Override
	public HashtagDetailVO selectOne(HashtagDetailVO hashtagDetailVO) {
		return hashtagDetailDAO.selectOne(hashtagDetailVO);
	}

	@Override
	public List<HashtagDetailVO> selectAll(HashtagDetailVO hashtagDetailVO) {
		return hashtagDetailDAO.selectAll(hashtagDetailVO);
	}

	@Override
	public boolean update(HashtagDetailVO hashtagDetailVO) {
		return hashtagDetailDAO.update(hashtagDetailVO);
	}

	@Override
	public boolean delete(HashtagDetailVO hashtagDetailVO) {
		return hashtagDetailDAO.delete(hashtagDetailVO);
	}

	@Override
	public boolean insert(HashtagDetailVO hashtagDetailVO) {
		return hashtagDetailDAO.insert(hashtagDetailVO);
	}

}
