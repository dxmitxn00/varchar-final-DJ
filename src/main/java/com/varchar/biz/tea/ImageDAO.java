package com.varchar.biz.tea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.common.JDBCUtil;

public class ImageDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	static final private String SQL_SELECTALL = "SELECT IMAGE_URL, IMAGE_DIVISION FROM IMAGE WHERE TEA_NUM = ?;";
//	static final private String SQL_SELECTONE = "";
//	static final private String SQL_INSERT = "";
//	static final private String SQL_UPDATE = "";
//	static final private String SQL_DELETE = "";
	
	public ArrayList<ImageVO> selectAll(ImageVO iVO){
		conn=JDBCUtil.getConnection();

		ArrayList<ImageVO> datas=new ArrayList<ImageVO>();

		try {
			pstmt=conn.prepareStatement(SQL_SELECTALL);
			pstmt.setInt(1, iVO.getTeaNum());

			rs=pstmt.executeQuery();

			while(rs.next()) {
				ImageVO data=new ImageVO();
				data.setImageUrl(rs.getString("IMAGE_URL"));
				data.setImageDivision(rs.getInt("IMAGE_DIVISION"));
				datas.add(data);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return datas;	
	}
	
	public ImageVO selectOne(ImageVO iVO){
		return null;
	}

	public boolean insert(ImageVO iVO) {
		return false;
	}
	
	public boolean update(ImageVO iVO) {
		return false;
	}
	
	public boolean delete(ImageVO iVO) {
		return false;
	}

}
