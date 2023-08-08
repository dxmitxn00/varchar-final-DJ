package com.varchar.biz.tea;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("teaService")
public class TeaServiceImpl implements TeaService {
	
	@Autowired
	private TeaDAO teaDAO;

	@Override
	public TeaVO selectOne(TeaVO tVO) {
		return teaDAO.selectOne(tVO);
	}

	@Override
	public List<TeaVO> selectAll(TeaVO tVO) {
		return teaDAO.selectAll(tVO);
	}

	@Override
	public boolean update(TeaVO tVO) {
		return teaDAO.update(tVO);
	}

	@Override
	public boolean delete(TeaVO tVO) {
		return teaDAO.delete(tVO);
	}

	@Override
	public boolean insert(TeaVO tVO) {
		return teaDAO.insert(tVO);
	}

}
