package com.varchar.biz.tea;

import java.util.List;

public interface TeaService {
	
	public TeaVO selectOne(TeaVO tVO);
	public List<TeaVO> selectAll(TeaVO tVO);
	public boolean update(TeaVO tVO);
	public boolean delete(TeaVO tVO);
	public boolean insert(TeaVO tVO);
}
