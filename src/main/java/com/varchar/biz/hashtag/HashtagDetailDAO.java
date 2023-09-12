package com.varchar.biz.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


@Repository("HashtagDetailDAO")
public class HashtagDetailDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_INSERT = "INSERT INTO HASHTAG_DETAIL(HASHTAG_DETAIL_NUM, ITEM_NUM, HASHTAG_NUM) "
			+ "VALUES (NVL((SELECT MAX(HASHTAG_DETAIL_NUM) FROM HASHTAG_DETAIL), 0) + 1, ?, ?)";
	
	static final private String SQL_DELETE = "DELETE FROM HASHTAG_DETAIL WHERE ITEM_NUM = ? ";


	
	public List<HashtagDetailVO> selectAll(HashtagDetailVO hashtagDetailVO) {
		return null;
	}

	public HashtagDetailVO selectOne(HashtagDetailVO hashtagDetailVO) {
		return null;
	}

	public boolean insert(HashtagDetailVO hashtagDetailVO) {
		int result = jdbcTemplate.update(SQL_INSERT, hashtagDetailVO.getItemNum(), hashtagDetailVO.getHashtagNum());

		if(result <= 0) {
			return false;
		}
		return true;
	}

	public boolean update(HashtagDetailVO hashtagDetailVO) {
		return false;
	}

	public boolean delete(HashtagDetailVO hashtagDetailVO) {
		int result = jdbcTemplate.update(SQL_DELETE, hashtagDetailVO.getItemNum());

		if(result <= 0) {
			return false;
		}
		return true;
	}

}
