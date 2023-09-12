package com.varchar.biz.buy;

import java.util.List;

public interface BuyService { // 객체를 직접 생성하면 유지보수에 불리함
								// CRUD의 메서드의 주체임 => 의존관계가 발생되어 DI가 필요함(@Autowired)
	public List<BuyVO> selectAll(BuyVO buyVO);
	public BuyVO selectOne(BuyVO buyVO);
	public boolean insert(BuyVO buyVO);
	public boolean update(BuyVO buyVO);
	public boolean delete(BuyVO buyVO);
}
