package com.varchar.biz.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO selectOne(MemberVO mVO) {
		return memberDAO.selectOne(mVO);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO mVO) {
		return memberDAO.selectAll(mVO);
	}

	@Override
	public boolean update(MemberVO mVO) {
		return memberDAO.update(mVO);
	}

	@Override
	public boolean delete(MemberVO mVO) {
		return memberDAO.delete(mVO);
	}

	@Override
	public boolean insert(MemberVO mVO) {
		return memberDAO.insert(mVO);
	}

}
