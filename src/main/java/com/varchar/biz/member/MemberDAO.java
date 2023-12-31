package com.varchar.biz.member;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository("memberDAO")
public class MemberDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	static final private String SQL_SELECTONE="SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDRESS, MEMBER_PHONE, MEMBER_EMAIL "
			+ "FROM MEMBER "
			+ "WHERE MEMBER_ID = ?";
	static final private String SQL_SELECTONE_LOGIN="SELECT MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDRESS, MEMBER_PHONE, MEMBER_EMAIL "
			+ "FROM MEMBER "
			+ "WHERE MEMBER_ID = ? AND MEMBER_PW = ?";
	static final private String SQL_INSERT = "INSERT INTO MEMBER (MEMBER_ID, MEMBER_PW, MEMBER_NAME, MEMBER_ADDRESS, MEMBER_PHONE, MEMBER_EMAIL) VALUES(?, ?, ?, ?, CASE WHEN ? = NULL THEN NULL ELSE LPAD(?, 11, '0') END, ?)";
	static final private String SQL_UPDATE="UPDATE MEMBER SET MEMBER_NAME = ?, MEMBER_ADDRESS = ?, MEMBER_PHONE = CASE WHEN ? = 0 THEN NULL ELSE ? END, MEMBER_EMAIL = ? WHERE MEMBER_ID = ?";
	static final private String SQL_UPDATE_PW="UPDATE MEMBER SET MEMBER_PW = ? WHERE MEMBER_ID = ?";
	//static final private String SQL_DELETE="DELETE FROM MEMBER WHERE MID=?";

	public List<MemberVO> selectAll(MemberVO memberVO){
		return null;	
	}

	public MemberVO selectOne(MemberVO memberVO){
		// System.out.println("MemberDAO 로그 SelectOne() 메소드 호출");
		try {
			if(memberVO.getMemberSearch().equals("로그인")) {
				// System.out.println("MemberDAO 로그 SelectOne() MemberSearch: 로그인 메소드 호출");
				Object[] args = { memberVO.getMemberId(), memberVO.getMemberPw() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE_LOGIN, args, new MemberSelectOneRowMapper());
			}
			else { //  if(memberVO.getMemberSearch().equals("회원정보변경")) 
				// System.out.println("MemberDAO 로그 SelectOne() MemberSearch: 회원정보변경 메소드 호출");
				Object[] args = { memberVO.getMemberId() };
				return jdbcTemplate.queryForObject(SQL_SELECTONE, args, new MemberSelectOneRowMapper());
			}
	      } catch (EmptyResultDataAccessException e) {
	         return null;
	      }
	}

	public boolean insert(MemberVO memberVO) {
		// System.out.println("MemberDAO 로그 insert() 메소드 호출");

		int result = jdbcTemplate.update(SQL_INSERT, memberVO.getMemberId(), memberVO.getMemberPw(), memberVO.getMemberName(), memberVO.getMemberAddress(), memberVO.getMemberPhone(), memberVO.getMemberPhone(), memberVO.getMemberEmail());

		if(result <= 0) {
			return false;
		}
		return true;
	}
	
	public boolean update(MemberVO memberVO) {
		//System.out.println("MemberDAO 로그 update() 메소드 호출");

		int result = 0;
		
		if (memberVO.getMemberSearch().equals("비밀번호변경")) {
			result = jdbcTemplate.update(SQL_UPDATE_PW, memberVO.getMemberPw(), memberVO.getMemberId());

		}
		else {
			result = jdbcTemplate.update(SQL_UPDATE, memberVO.getMemberName(), memberVO.getMemberAddress(), memberVO.getMemberPhone(), memberVO.getMemberPhone(), memberVO.getMemberEmail(), memberVO.getMemberId());
		}
		
		if(result <= 0) {
			return false;
		}
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

// -----------------------------------------------------------------------------------------------

//[ selectOne ]
class MemberSelectOneRowMapper implements RowMapper<MemberVO> { 

	@Override
	public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException { 

		MemberVO data=new MemberVO();
		data.setMemberId(rs.getString("MEMBER_ID"));
		data.setMemberPw(rs.getString("MEMBER_PW"));
		data.setMemberName(rs.getString("MEMBER_NAME"));
		data.setMemberAddress(rs.getString("MEMBER_ADDRESS"));
		data.setMemberPhone(rs.getString("MEMBER_PHONE"));
		data.setMemberEmail(rs.getString("MEMBER_EMAIL"));
		return data;

	}
}