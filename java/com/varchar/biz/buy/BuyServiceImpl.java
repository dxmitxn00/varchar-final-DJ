package com.varchar.biz.buy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("buyService")
public class BuyServiceImpl implements BuyService {
	
	@Autowired
	private BuyDAO buyDAO;

	@Override
	public List<BuyVO> selectAll(BuyVO buyVO) {
		return buyDAO.selectAll(buyVO);
	}

	@Override
	public BuyVO selectOne(BuyVO buyVO) {
		return buyDAO.selectOne(buyVO);
	}

	@Override
	public boolean insert(BuyVO buyVO) {
		return buyDAO.insert(buyVO);
	}

	@Override
	public boolean update(BuyVO buyVO) {
		return buyDAO.update(buyVO);
	}

	@Override
	public boolean delete(BuyVO buyVO) {
		return buyDAO.delete(buyVO);
	}

}
