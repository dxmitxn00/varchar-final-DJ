package com.varchar.view.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.common.AlertVO;
import com.varchar.biz.member.MemberService;
import com.varchar.biz.member.MemberVO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberService memberService;
	
	// ------------------------------------- 로그인 페이지 ------------------------------------------
	
	@RequestMapping(value="/loginPage.do")
	public String loginPage() { // 로그인 페이지
		return "redirect:login.jsp";
	}

	@RequestMapping(value="/login.do") // 로그인
	public String login(MemberVO mVO, HttpSession session, Model model) {
		System.out.println("LoginController 로그");

		mVO.setMemberSearch("로그인");
		mVO = memberService.selectOne(mVO);
		
		if (mVO != null) {
			session.setAttribute("ssMemberId", mVO.getMemberId());
		} else {
			AlertVO saVO = new AlertVO("로그인실패", "로그인실패", null, "error", null);
			model.addAttribute("sa", saVO);
			return "alertFalse.jsp";
		}
		return "redirect:main.do";
	}
	
	// ------------------------------------- 로그아웃 페이지 ------------------------------------------
	
	@RequestMapping(value="/logoutPage.do")
	public String logoutPage(Model model) { // 로그아웃 알럿
		
		AlertVO saVO = new AlertVO("로그아웃", "로그아웃 하시겠습니까?", null, "question", "logout.do");
		model.addAttribute("sa", saVO);
		return "alertChoose.jsp";
	}

	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, Model model) { // 로그아웃

		System.out.println("LogoutController 로그");
		session.removeAttribute("ssMemberId");
		
		AlertVO saVO = new AlertVO("로그아웃", "메인으로 이동합니다.", null, "success", "main.do");
		model.addAttribute("sa", saVO);
		
		return "alertTrue.jsp";
	}
	
	// ------------------------------------- 회원가입 페이지 ------------------------------------------

	@RequestMapping(value="/signupPage.do")
	public String signupPage() { // 회원가입 페이지
		return "redirect:signup.jsp";
	}

	@RequestMapping(value="/signup.do")
	public String signup(MemberVO mVO, Model model) { // 회원가입

//		mVO.setMemberId(request.getParameter("memberId"));
//		mVO.setMemberPw(request.getParameter("memberPw"));
//		mVO.setMemberName(request.getParameter("memberName"));
//		mVO.setMemberAddress(request.getParameter("memberAddress").equals("") ? null : request.getParameter("memberAddress"));
//		mVO.setMemberPhone(request.getParameter("memberPhone").equals("") ? 0 : Long.parseLong(request.getParameter("memberPhone")));
//		mVO.setMemberEmail(request.getParameter("memberEmail").equals("") ? null : request.getParameter("memberEmail"));
	
//		System.out.println(mVO);
		
		if (memberService.insert(mVO)) {
			AlertVO saVO = new AlertVO("회원가입", "회원가입 성공!", null, "success", "main.do");
			model.addAttribute("sa", saVO);
		}
		return "alertTrue.jsp";
	}
	
	//----------------------------------------- 회원 정보 수정 --------------------------------------------------
	
	@RequestMapping(value="/updateInfoPage.do")
	public String updateInfoPage(MemberVO mVO, HttpSession session, Model model) { 
		
		mVO.setMemberId((String)session.getAttribute("ssMemberId"));
		mVO.setMemberSearch("회원정보변경");
		mVO = memberService.selectOne(mVO);
		
		System.out.println("UpdateInfoPageController mVO : " + mVO);
		model.addAttribute("mdata", mVO);
		
		return "updateInfo.jsp";
		
	}

	@RequestMapping(value="/updateInfo.do")
	public String updateInfo(MemberVO mVO, Model model) {
		
		mVO.setMemberSearch("회원정보변경");
//		mVO.setMemberId(request.getParameter("memberId"));
//		mVO.setMemberName(request.getParameter("memberName"));
//		mVO.setMemberAddress(request.getParameter("memberAddress").equals("") ? null : request.getParameter("memberAddress"));
//		mVO.setMemberPhone(request.getParameter("memberPhone").equals("") ? 0 : Long.parseLong(request.getParameter("memberPhone")));
//		mVO.setMemberEmail(request.getParameter("memberEmail").equals("") ? null : request.getParameter("memberEmail"));
//		System.out.println(mVO);
		
		if (memberService.update(mVO)) {
			AlertVO saVO = new AlertVO("회원정보 변경", "회원정보 변경", null, "success", "main.do");
			model.addAttribute("sa", saVO);
		}
		return "alertTrue.jsp";
	}
	
	@RequestMapping(value="/updateInfoPageConfirm.do")
	public String execute() {
		AlertVO saVO = new AlertVO("회원정보변경", "변경하시겠습니까?", "회원정보변경이 완료되었습니다!", "question", "updateInfo.do");
		return "main.jsp";
	}
	
	// ------------------------------------- 비밀번호 수정 페이지 ------------------------------------------
	
	@RequestMapping(value="/updatePwPage.do")
	public String updatePwPage() {
		return "redirect:updatePw.jsp";
	}
	
	@RequestMapping(value="/updatePw.do")
	public String updatePw(MemberVO mVO, Model model) {

		mVO.setMemberSearch("비밀번호변경");
		if(memberService.update(mVO)) {
			AlertVO saVO = new AlertVO("비밀번호변경", "비밀번호 변경 성공!", null, "success", "logout.do");
			model.addAttribute("sa",saVO);
		}
		return "alertTrue.jsp";
	}
	
}