package com.varchar.biz.buy;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("buyDetailService")
public class BuyDetailServiceImpl implements BuyDetailService {

	@Autowired
	BuyDetailDAO buyDetailDAO;
	
	@Override
	public List<BuyDetailVO> selectAll(BuyDetailVO buyDetailVO) {
		return buyDetailDAO.selectAll(buyDetailVO);
	}

	@Override
	public BuyDetailVO selectOne(BuyDetailVO buyDetailVO) {
		return buyDetailDAO.selectOne(buyDetailVO);
	}

	@Override
	public boolean insert(BuyDetailVO buyDetailVO) {
		return buyDetailDAO.insert(buyDetailVO);
	}

	@Override
	public boolean update(BuyDetailVO buyDetailVO) {
		return buyDetailDAO.update(buyDetailVO);
	}

	@Override
	public boolean delete(BuyDetailVO buyDetailVO) {
		return buyDetailDAO.delete(buyDetailVO);
	}

}
