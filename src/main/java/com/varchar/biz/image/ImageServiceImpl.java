package com.varchar.biz.image;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("imageService")
public class ImageServiceImpl implements ImageService {

	@Autowired
	private ImageDAO imageDAO;
	
	@Override
	public ImageVO selectOne(ImageVO imageVO) {
		return imageDAO.selectOne(imageVO);
	}

	@Override
	public List<ImageVO> selectAll(ImageVO imageVO) {
		return imageDAO.selectAll(imageVO);
	}

	@Override
	public boolean update(ImageVO imageVO) {
		return imageDAO.update(imageVO);
	}

	@Override
	public boolean delete(ImageVO imageVO) {
		return imageDAO.delete(imageVO);
	}

	@Override
	public boolean insert(ImageVO imageVO) {
		return imageDAO.insert(imageVO);
	}
}
