package com.varchar.biz.hashtag;

import java.util.List;

public interface TeaHashtagService {

	public TeaHashtagVO selectOne(TeaHashtagVO teaHashtagVO);
	public List<TeaHashtagVO> selectAll(TeaHashtagVO teaHashtagVO);
	public boolean update(TeaHashtagVO teaHashtagVO);
	public boolean delete(TeaHashtagVO teaHashtagVO);
	public boolean insert(TeaHashtagVO teaHashtagVO);


}
