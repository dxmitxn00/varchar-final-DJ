package com.varchar.biz.buy;

import java.util.List;

public interface BuyDetailService { // 객체를 직접 생성하면 유지보수에 불리함
								// CRUD의 메서드의 주체임 => 의존관계가 발생되어 DI가 필요함(@Autowired)
	public List<BuyDetailVO> selectAll(BuyDetailVO buyDetailVO);
	public BuyDetailVO selectOne(BuyDetailVO buyDetailVO);
	public boolean insert(BuyDetailVO buyDetailVO);
	public boolean update(BuyDetailVO buyDetailVO);
	public boolean delete(BuyDetailVO buyDetailVO);
}
