package com.varchar.biz.favor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("favorService")
public class FavorServiceImpl implements FavorService {

	@Autowired
	private FavorDAO favorDAO;
	
	@Override
	public FavorVO selectOne(FavorVO fVO) {
		return favorDAO.selectOne(fVO);
	}

	@Override
	public List<FavorVO> selectAll(FavorVO fVO) {
		return favorDAO.selectAll(fVO);
	}

	@Override
	public boolean update(FavorVO fVO) {
		return favorDAO.update(fVO);
	}

	@Override
	public boolean delete(FavorVO fVO) {
		return favorDAO.delete(fVO);
	}

	@Override
	public boolean insert(FavorVO fVO) {
		return favorDAO.insert(fVO);
	}

}
