package com.varchar.biz.favor;

import java.util.List;

import com.varchar.biz.favor.FavorVO;

public interface FavorService {
	
	public FavorVO selectOne(FavorVO fVO);
	public List<FavorVO> selectAll(FavorVO fVO);
	public boolean update(FavorVO fVO);
	public boolean delete(FavorVO fVO);
	public boolean insert(FavorVO fVO);
}