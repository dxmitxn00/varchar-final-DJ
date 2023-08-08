package com.varchar.biz.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.varchar.biz.common.JDBCUtil;

@Repository("memberDAO")
public class MemberDAO {
	private Connection conn;
	private PreparedStatement pstmt;

	static final private String SQL_SELECTONE="SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDRESS, MEMBER_PHONE, MEMBER_EMAIL FROM MEMBER WHERE MEMBER_ID = ?;";
	static final private String SQL_SELECTONE_LOGIN="SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDRESS, MEMBER_PHONE, MEMBER_EMAIL FROM MEMBER WHERE MEMBER_ID = ? AND MEMBER_PW = ?;";
	static final private String SQL_INSERT = "INSERT INTO MEMBER (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDRESS, MEMBER_PHONE, MEMBER_EMAIL) VALUES(?, ?, ?, ?, IF(? = 0, NULL, ?), ?);";
	static final private String SQL_UPDATE="UPDATE MEMBER SET MEMBER_NAME = ?, MEMBER_ADDRESS = ?, MEMBER_PHONE = IF(? = 0, NULL, ?), MEMBER_EMAIL = ? WHERE MEMBER_ID = ?;";
	static final private String SQL_UPDATE_PW="UPDATE MEMBER SET MEMBER_PW = ? WHERE MEMBER_ID = ?;";
	//static final private String SQL_DELETE="DELETE FROM MEMBER WHERE MID=?";

	public List<MemberVO> selectAll(MemberVO mVO){
		return null;	
	}
	
	public MemberVO selectOne(MemberVO mVO){
		conn=JDBCUtil.getConnection();
		System.out.println("MemberDAO 로그 SelectOne() 메소드 호출");
		MemberVO data = null;
		
		try {
			if(mVO.getMemberSearch().equals("로그인")) {
				System.out.println("MemberDAO 로그 SelectOne() MemberSearch: 로그인 메소드 호출");
				pstmt=conn.prepareStatement(SQL_SELECTONE_LOGIN);
				pstmt.setString(1, mVO.getMemberId());
				pstmt.setString(2, mVO.getMemberPw());
			}
			else if(mVO.getMemberSearch().equals("회원정보변경")) {
				System.out.println("MemberDAO 로그 SelectOne() MemberSearch: 회원정보변경 메소드 호출");
				pstmt=conn.prepareStatement(SQL_SELECTONE);
				pstmt.setString(1, mVO.getMemberId());
			}
			
			ResultSet rs = pstmt.executeQuery();
			rs=pstmt.executeQuery();

			if(rs.next()) {
				data=new MemberVO();
				data.setMemberId(rs.getString("MEMBER_ID"));
				data.setMemberPw(rs.getString("MEMBER_PW"));
				data.setMemberName(rs.getString("MEMBER_NAME"));
				data.setMemberAddress(rs.getString("MEMBER_ADDRESS"));
				data.setMemberPhone(rs.getLong("MEMBER_PHONE"));
				data.setMemberEmail(rs.getString("MEMBER_EMAIL"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		JDBCUtil.close(conn, pstmt);

		return data;
	}

	public boolean insert(MemberVO mVO) {
		System.out.println("MemberDAO 로그 insert() 메소드 호출");
		conn=JDBCUtil.getConnection();

		try {
			pstmt=conn.prepareStatement(SQL_INSERT);
			pstmt.setString(1, mVO.getMemberId());
			pstmt.setString(2, mVO.getMemberPw());
			pstmt.setString(3, mVO.getMemberName());
			pstmt.setString(4, mVO.getMemberAddress());
			pstmt.setLong(5, mVO.getMemberPhone());
			pstmt.setLong(6, mVO.getMemberPhone());
			pstmt.setString(7, mVO.getMemberEmail());
			
			int rs=pstmt.executeUpdate();
			if(rs<=0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.close(conn, pstmt);

		return true;
	}
	public boolean update(MemberVO mVO) {
		System.out.println("MemberDAO 로그 update() 메소드 호출");
		conn=JDBCUtil.getConnection();

		try {
			
			if(mVO.getMemberSearch().equals("비밀번호변경")) {
				System.out.println("MemberDAO 로그 update() MemberSearch: 비밀번호변경 메소드 호출");
				pstmt=conn.prepareStatement(SQL_UPDATE_PW);
				pstmt.setString(1, mVO.getMemberPw());
				pstmt.setString(2, mVO.getMemberId());
			}
			else if(mVO.getMemberSearch().equals("회원정보변경")) {
				System.out.println("MemberDAO 로그 update() MemberSearch: 회원정보변경 메소드 호출");
				pstmt=conn.prepareStatement(SQL_UPDATE);
				pstmt.setString(1, mVO.getMemberName());
				pstmt.setString(2, mVO.getMemberAddress());
				pstmt.setLong(3, mVO.getMemberPhone());
				pstmt.setLong(4, mVO.getMemberPhone());
				pstmt.setString(5, mVO.getMemberEmail());
				pstmt.setString(6, mVO.getMemberId());
				
			}
			
			int rs=pstmt.executeUpdate();
			if(rs<=0) {
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

		JDBCUtil.close(conn, pstmt);

		return true;
	}
	public boolean delete(MemberVO mVO) {
//		conn=JDBCUtil.connect();
//
//		try {
//			pstmt=conn.prepareStatement(SQL_DELETE);
//			pstmt.setString(1, mVO.getMid());
//			int rs=pstmt.executeUpdate();
//			if(rs<=0) {
//				return false;
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//			return false;
//		}
//
//		JDBCUtil.disconnect(pstmt, conn);

		return false;
	}
}