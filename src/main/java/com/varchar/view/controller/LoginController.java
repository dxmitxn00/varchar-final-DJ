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
	public String login(MemberVO memberVO, HttpSession session, Model model) {
		System.out.println("LoginController 로그");

		memberVO.setMemberSearch("로그인");
		memberVO = memberService.selectOne(memberVO);
		
		if (memberVO != null) {
			session.setAttribute("sessionMemberId", memberVO.getMemberId());
		} else {
			AlertVO sweetAlertVO = new AlertVO("로그인실패", "로그인실패", null, "error", null);
			model.addAttribute("sweetAlertVO", sweetAlertVO);
			return "alertFalse.jsp";
		}
		return "redirect:main.do";
	}
	
	// ------------------------------------- 로그아웃 페이지 ------------------------------------------
	
	@RequestMapping(value="/logoutPage.do")
	public String logoutPage(Model model) { // 로그아웃 알럿
		
		AlertVO sweetAlertVO = new AlertVO("로그아웃", "로그아웃 하시겠습니까?", null, "question", "logout.do");
		model.addAttribute("sweetAlert", sweetAlertVO);
		return "alertChoose.jsp";
	}

	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session, Model model) { // 로그아웃

		System.out.println("LogoutController 로그");
		session.removeAttribute("sessionMemberId");
		
		AlertVO sweetAlertVO = new AlertVO("로그아웃", "메인으로 이동합니다.", null, "success", "main.do");
		model.addAttribute("sweetAlert", sweetAlertVO);
		
		return "alertTrue.jsp";
	}
	
	// ------------------------------------- 회원가입 페이지 ------------------------------------------

	@RequestMapping(value="/signupPage.do")
	public String signupPage() { // 회원가입 페이지
		return "redirect:signup.jsp";
	}

	@RequestMapping(value="/signup.do")
	public String signup(MemberVO memberVO, Model model) { // 회원가입

//		memberVO.setMemberId(request.getParameter("memberId"));
//		memberVO.setMemberPw(request.getParameter("memberPw"));
//		memberVO.setMemberName(request.getParameter("memberName"));
//		memberVO.setMemberAddress(request.getParameter("memberAddress").equals("") ? null : request.getParameter("memberAddress"));
//		memberVO.setMemberPhone(request.getParameter("memberPhone").equals("") ? 0 : Long.parseLong(request.getParameter("memberPhone")));
//		memberVO.setMemberEmail(request.getParameter("memberEmail").equals("") ? null : request.getParameter("memberEmail"));
	
//		System.out.println(memberVO);
		
		if (memberService.insert(memberVO)) {
			AlertVO sweetAlertVO = new AlertVO("회원가입", "회원가입 성공!", null, "success", "main.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}
		return "alertTrue.jsp";
	}
	
	//----------------------------------------- 회원 정보 수정 --------------------------------------------------
	
	@RequestMapping(value="/updateInfoPage.do")
	public String updateInfoPage(MemberVO memberVO, HttpSession session, Model model) { 
		
		memberVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		memberVO.setMemberSearch("회원정보변경");
		memberVO = memberService.selectOne(memberVO);
		
		System.out.println("UpdateInfoPageController memberVO : " + memberVO);
		model.addAttribute("memberData", memberVO);
		
		return "updateInfo.jsp";
		
	}

	@RequestMapping(value="/updateInfo.do")
	public String updateInfo(MemberVO memberVO, Model model) {
		
		memberVO.setMemberSearch("회원정보변경");
//		memberVO.setMemberId(request.getParameter("memberId"));
//		memberVO.setMemberName(request.getParameter("memberName"));
//		memberVO.setMemberAddress(request.getParameter("memberAddress").equals("") ? null : request.getParameter("memberAddress"));
//		memberVO.setMemberPhone(request.getParameter("memberPhone").equals("") ? 0 : Long.parseLong(request.getParameter("memberPhone")));
//		memberVO.setMemberEmail(request.getParameter("memberEmail").equals("") ? null : request.getParameter("memberEmail"));
//		System.out.println(memberVO);
		
		if (memberService.update(memberVO)) {
			AlertVO sweetAlertVO = new AlertVO("회원정보 변경", "회원정보 변경", null, "success", "main.do");
			model.addAttribute("sweetAelrt", sweetAlertVO);
		}
		return "alertTrue.jsp";
	}
	
	@RequestMapping(value="/updateInfoPageConfirm.do")
	public String updateInfoPageConfirm() {
		AlertVO sweetAlertVO = new AlertVO("회원정보변경", "변경하시겠습니까?", "회원정보변경이 완료되었습니다!", "question", "updateInfo.do");
		return "main.jsp";
	}
	
	// ------------------------------------- 비밀번호 수정 페이지 ------------------------------------------
	
	@RequestMapping(value="/updatePwPage.do")
	public String updatePwPage() {
		return "redirect:updatePw.jsp";
	}
	
	@RequestMapping(value="/updatePw.do")
	public String updatePw(MemberVO memberVO, Model model) {

		memberVO.setMemberSearch("비밀번호변경");
		if(memberService.update(memberVO)) {
			AlertVO sweetAlertVO = new AlertVO("비밀번호변경", "비밀번호 변경 성공!", null, "success", "logout.do");
			model.addAttribute("sweetAlert",sweetAlertVO);
		}
		return "alertTrue.jsp";
	}
	
}