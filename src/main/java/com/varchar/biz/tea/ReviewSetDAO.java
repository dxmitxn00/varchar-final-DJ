package com.varchar.biz.tea;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.varchar.biz.common.JDBCUtil;
import com.varchar.biz.review.ReviewVO;

public class ReviewSetDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	static final String SQL_SELECTONE_TEA = "SELECT TEA_NUM, TEA_NAME, TEA_PRICE, TEA_CNT, TEA_CATEGORY, TEA_CONTENT "
			+ "FROM TEA "
			+ "WHERE TEA_NUM = ?";
	
	static final String SQL_SELECTALL_REVIEW = "SELECT R.REVIEW_NUM, R.MEMBER_ID, R.REVIEW_CONTENT, BD.TEA_NUM, T.TEA_NAME, I.IMAGE_URL "
			+ "FROM REVIEW R "
			+ "JOIN BUY_DETAIL BD USING(BUY_SERIAL) "
			+ "JOIN TEA T USING(TEA_NUM) "
			+ "JOIN IMAGE I USING(TEA_NUM) "
			+ "WHERE T.TEA_NUM = ? "
			+ "AND I.IMAGE_DIVISION = 1 "
			+ "LIMIT 0, ?";
	
	// ㄴ> 상품 상세 페이지 ReviewSetVO만 사용!!!
	//			(상품 상세 필요한 데이터 SELECT절에 추가 - 칼럼이랑 rs만 추가하셈(출력하는 정보))
	
	
//	static final String SQL_SELECTALL_REVIEW = "SELECT R.REVIEW_NUM, R.MEMBER_ID, R.BUY_SERIAL, R.REVIEW_CONTENT "
//			+ "FROM ("
//			+ "SELECT ROW_NUMBER() OVER(ORDER BY R.REVIEW_NUM) AS row_num, R.REVIEW_NUM, R.MEMBER_ID, R.BUY_SERIAL, R.REVIEW_CONTENT "
//			+ "FROM REVIEW R"
//			+ "JOIN BUY_DETAIL BD USING (BUY_SERIAL) "
//			+ "JOIN BUY B USING(BUY_NUM) "
//			+ "WHERE BD.TEA_NUM=?"
//			+ ") AS R "
//			+ "WHERE row_num BETWEEN ? AND ?+6;";
	
	public ArrayList<ReviewSet> selectAll(ReviewSet rsVO){
		
		conn = JDBCUtil.getConnection();
		ArrayList<ReviewSet> datas = new ArrayList<ReviewSet>();

		try {
			pstmt = conn.prepareStatement(SQL_SELECTONE_TEA);
			pstmt.setInt(1, rsVO.getTea().getTeaNum());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewSet res = new ReviewSet();
				TeaVO data = new TeaVO();
				
				data.setTeaNum(rs.getInt("TEA_NUM"));
				data.setTeaName(rs.getString("TEA_NAME"));
				data.setTeaPrice(rs.getInt("TEA_PRICE"));
				data.setTeaCnt(rs.getInt("TEA_CNT"));
				data.setTeaCategory(rs.getString("TEA_CATEGORY"));
				data.setTeaContent(rs.getString("TEA_CONTENT"));
				
				res.setTea(data);
				
				pstmt = conn.prepareStatement(SQL_SELECTALL_REVIEW);
				pstmt.setInt(1, data.getTeaNum());
				pstmt.setInt(2, rsVO.getTea().getStartRnum());
				
				ResultSet rs2 = pstmt.executeQuery();
				ArrayList<ReviewVO> rdatas = new ArrayList<ReviewVO>();
				
				while(rs2.next()) {
					ReviewVO rVO = new ReviewVO();
					rVO.setMemberId(rs2.getString("MEMBER_ID"));
					rVO.setReviewContent(rs2.getString("REVIEW_CONTENT"));
					rVO.setImageUrl(rs2.getString("IMAGE_URL"));
					rVO.setReviewNum(rs2.getInt("REVIEW_NUM"));
					rdatas.add(rVO);
				}
				
				res.setRdatas(rdatas);
				datas.add(res);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return datas;
	}
}
