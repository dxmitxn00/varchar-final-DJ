package com.varchar.biz.tea;

import java.util.List;

public interface ImageService {

	public ImageVO selectOne(ImageVO imageVO);
	public List<ImageVO> selectAll(ImageVO imageVO);
	public boolean update(ImageVO imageVO);
	public boolean delete(ImageVO imageVO);
	public boolean insert(ImageVO imageVO);
}
