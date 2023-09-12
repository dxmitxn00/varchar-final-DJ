package com.varchar.biz.tea;

import java.util.List;

public interface ReviewSetService {

	public ReviewSet selectOne(ReviewSet rsVO);
	public List<ReviewSet> selectAll(ReviewSet rsVO);
	public boolean update(ReviewSet rsVO);
	public boolean delete(ReviewSet rsVO);
	public boolean insert(ReviewSet rsVO);
}
