package com.varchar.biz.hashtag;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("teaHashtagService")
public class TeaHashtaglmpl implements TeaHashtagService{

	@Autowired
	private TeaHashtagDAO teaHashtagDAO;
	
	
	@Override
	public TeaHashtagVO selectOne(TeaHashtagVO teaHashtagVO) {
		return teaHashtagDAO.selectOne(teaHashtagVO);
	}

	@Override
	public List<TeaHashtagVO> selectAll(TeaHashtagVO teaHashtagVO) {
		return teaHashtagDAO.selectAll(teaHashtagVO);
	}

	@Override
	public boolean update(TeaHashtagVO teaHashtagVO) {
		return teaHashtagDAO.update(teaHashtagVO);
	}

	@Override
	public boolean delete(TeaHashtagVO teaHashtagVO) {
		return teaHashtagDAO.delete(teaHashtagVO);
	}

	@Override
	public boolean insert(TeaHashtagVO teaHashtagVO) {
		return teaHashtagDAO.insert(teaHashtagVO);
	}

	
	
	
	
	
	

}
