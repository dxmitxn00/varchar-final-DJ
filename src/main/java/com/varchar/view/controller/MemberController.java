package com.varchar.view.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.varchar.biz.common.AlertVO;
import com.varchar.biz.member.MemberService;
import com.varchar.biz.member.MemberVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private JavaMailSender mailSender;

	// ------------------------------------- 로그인 페이지 ------------------------------------------

	@RequestMapping(value = "/login.do", method=RequestMethod.GET)
	public String loginPage() { // 로그인 페이지
		return "redirect:login.jsp";
	}

	@RequestMapping(value = "/login.do", method=RequestMethod.POST) // 로그인
	public String login(MemberVO memberVO, HttpSession session, Model model) {
		System.out.println("LoginController 로그");

		memberVO.setMemberSearch("솔트");
		String pw = memberVO.getMemberPw();
		String salt = memberService.selectOne(memberVO).getMemberSalt(); // 회원의 솔트값 가져옴
		String shaPW = Password.ShaPass(pw+salt);
		memberVO.setMemberPw(shaPW);
		
		System.out.println("pw: "+ pw);
		System.out.println("암호화pw: "+shaPW);
		System.out.println("사용된 salt: "+salt);
		
		memberVO.setMemberSearch("로그인");
		memberVO = memberService.selectOne(memberVO);
		

		if (memberVO != null) {
			session.setAttribute("sessionMemberId", memberVO.getMemberId());
			
//			if(memberVO.getMemberGrade().equals("ADMIN")) { // 관리자 검사
//				return "관리자 페이지";
//			}
			
		} else {
			AlertVO sweetAlertVO = new AlertVO("로그인실패", "로그인실패", null, "error", null);
			model.addAttribute("sweetAlert", sweetAlertVO);
			return "alertFalse.jsp";
		}
		return "redirect:main.do";
	}
	
	// ------------------------------------- 로그아웃 페이지 ------------------------------------------

	@RequestMapping(value = "/logoutPage.do")
	public String logoutPage(Model model) { // 로그아웃 알럿

		AlertVO sweetAlertVO = new AlertVO("로그아웃", "로그아웃 하시겠습니까?", null, "question", "logout.do");
		model.addAttribute("sweetAlert", sweetAlertVO);
		return "alertChoose.jsp";
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session, Model model) { // 로그아웃

		System.out.println("LogoutController 로그");
		session.removeAttribute("sessionMemberId");

		AlertVO sweetAlertVO = new AlertVO("로그아웃", "메인으로 이동합니다.", null, "success", "main.do");
		model.addAttribute("sweetAlert", sweetAlertVO);

		return "alertTrue.jsp";
	}

	// ------------------------------------- 회원가입 페이지 ------------------------------------------

	@RequestMapping(value = "/signup.do", method=RequestMethod.GET)
	public String signupPage() { // 회원가입 페이지
		return "redirect:signup.jsp";
	}

	@RequestMapping(value = "/signup.do", method=RequestMethod.POST)
	public String signup(MemberVO memberVO, Model model) { // 회원가입
		
		
		String salt = Password.generateRandomPassword(10);
		String shaPW = Password.ShaPass(memberVO.getMemberPw()+salt);
		System.out.println("암호화pw: "+shaPW);
		System.out.println("사용된 salt: "+salt);
		
		memberVO.setMemberPw(shaPW);
		memberVO.setMemberSalt(salt);
		memberVO.setMemberGrade(0);
		memberVO.setMemberPlatform("varChar"); // SNS 로그인 구현시 추후 논의 필요

		System.out.println(memberVO);

		if (memberService.insert(memberVO)) {
			AlertVO sweetAlertVO = new AlertVO("회원가입", "회원가입 성공!", null, "success", "main.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
			
			if(memberVO.getMemberEmail() != null) {
				return "signupEmail.do";
			}
		}
		//** 회원가입 실패 ---> 유효성 추가 필요 */
		else {
			// 실패..
		}

		return "alertTrue.jsp";
	}

	// ----------------------------------------- 회원 정보 수정 --------------------------------------------------

	@RequestMapping(value = "/updateInfo.do", method=RequestMethod.GET)
	public String updateInfoPage(MemberVO memberVO, HttpSession session, Model model) {

		//** 해당 회원 NULL 혹은 로그인 안함 ---> 유효성 추가 필요 */
		memberVO.setMemberId((String) session.getAttribute("sessionMemberId"));
		memberVO.setMemberSearch("회원정보변경");
		memberVO = memberService.selectOne(memberVO);

		System.out.println("UpdateInfoPageController memberVO : " + memberVO);
		model.addAttribute("memberData", memberVO);

		return "updateInfo.jsp";

	}

	@RequestMapping(value = "/updateInfo.do", method=RequestMethod.POST)
	public String updateInfo(MemberVO memberVO, Model model) {

		memberVO.setMemberSearch("회원정보변경");

		System.out.println("로그 회원정보 변경 updateInfo.do memberVO: "+ memberVO);
		// 혹시 계속 문제 발생시 memberId set 고려
		//** 회원 정보 변경 실패시---> 유효성 추가 필요 */
		if (memberService.update(memberVO)) {
			System.out.println("로그 회원정보 변경성공");
			AlertVO sweetAlertVO = new AlertVO("회원정보 변경", "회원정보 변경 성공!", null, "success", "main.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
			return "alertTrue.jsp";
		}
		System.out.println("로그 회원정보 변경 실패");
		AlertVO sweetAlertVO = new AlertVO("회원정보 변경", "회원정보 변경 실패!", null, "warning", "main.do");
		model.addAttribute("sweetAlert", sweetAlertVO);
		return "alertFalse.jsp";
		
	}

	@RequestMapping(value = "/updateInfoPageConfirm.do")
	public String updateInfoPageConfirm(Model model) {
		AlertVO sweetAlertVO = new AlertVO("회원정보변경", "변경하시겠습니까?", "회원정보변경이 완료되었습니다!", "question", "updateInfo.do");
		model.addAttribute("sweetAlert", sweetAlertVO);
		return "alertConfirm.jsp";
	}

	// ------------------------------------- 비밀번호 수정 페이지  ------------------------------------------

	@RequestMapping(value = "/updatePw.do", method=RequestMethod.GET)
	public String updatePwPage() {
		return "redirect:updatePw.jsp";
	}

	@RequestMapping(value = "/updatePw.do", method=RequestMethod.POST)
	public String updatePw(MemberVO memberVO, Model model) {
		

		String salt = Password.generateRandomPassword(10);
		String shaPW = Password.ShaPass(memberVO.getMemberPw()+salt);
		memberVO.setMemberPw(shaPW);
		memberVO.setMemberSalt(salt);
		
		System.out.println("암호화pw: "+shaPW);
		System.out.println("사용된 salt: "+salt);

		memberVO.setMemberSearch("비밀번호변경");
		//** 비밀번호 변경 실패 ---> 유효성 추가 필요 */
		if (memberService.update(memberVO)) {
			AlertVO sweetAlertVO = new AlertVO("비밀번호변경", "비밀번호 변경 성공!", null, "success", "logout.do");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}
		return "alertTrue.jsp";
	}

	// ------------------------------------- 비밀번호 찾기 페이지  ------------------------------------------
	
	@RequestMapping(value="/findPw.do", method=RequestMethod.GET)
	public String findPwPage() {
		return "findPw.jsp";
	}
	
	@RequestMapping(value="/findPw.do", method=RequestMethod.POST)
	public String findPw(MemberVO memberVO, Model model) {
		
		String randomPw = Password.main(null);
		System.out.println("임시비밀번호 : " + randomPw);

		String salt = Password.generateRandomPassword(10);
		String shaPW = Password.ShaPass(randomPw+salt);
		memberVO.setMemberPw(shaPW);
		memberVO.setMemberSalt(salt);
		
		System.out.println("암호화pw: "+shaPW);
		System.out.println("사용된 salt: "+salt);
		
		memberVO.setMemberSearch("비밀번호변경");
		if(memberService.update(memberVO)) {
			MessageAPI_Test.main(memberVO, randomPw);
			System.out.println("로그 : 임시비밀번호 문자 발송 성공");
		}
		return "login.jsp";
	}
	
	// ------------------------------------- 이메일 전송 ------------------------------------------
	@RequestMapping(value = "/signupEmail.do")
	public String signupEmail(MemberVO memberVO) {
		System.out.println("로그: EmailController: signupSuccess() ");

		String title = "[var茶] 더 나은 몸과 마음을 위한 당신만의 여정";
		String receiver = memberVO.getMemberEmail();
		String name = memberVO.getMemberName();
		String content = "<h2>" + name + "님의 회원가입을 진심으로 축하드립니다~!!</h2><br>"
				+ "var茶로 발걸음해주셔서 정말 감사합니다.<br>" + "앞으로 더 나은 서비스를 제공하겠습니다!";
		String from = "TryCathers";

		// 이메일 제목과 내용 설정

		try {
			MimeMessage mail = mailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

			mailHelper.setFrom(from);
			mailHelper.setTo(receiver);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);

			mailSender.send(mail);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "alertTrue.jsp";
	}
	
	// // ------------------------------------- 네이버 로그인 테스트 중 -------------------------------------
	@RequestMapping(value = "/loginNaver.do")
	public String loginNaver(HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		System.out.println("loginNaver.do 진입");
		System.out.println(request.getAttribute("naver_id_login"));
		System.out.println(request.getAttribute("access_token"));
		System.out.println(request.getAttribute("token_type"));
		System.out.println(request.getAttribute("expires_in"));
		
	    String clientId = "gSqN5AjK3F7dFSVLcJF0";//애플리케이션 클라이언트 아이디값";
	    String clientSecret = "29uaXEXBbp";//애플리케이션 클라이언트 시크릿값";
	    String code = request.getParameter("code");
	    String state = request.getParameter("state");
	    String redirectURI = URLEncoder.encode("http://localhost:8088/app/loginNaver.do", "UTF-8");
	    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
	        + "&client_id=" + clientId
	        + "&client_secret=" + clientSecret
	        + "&redirect_uri=" + redirectURI
	        + "&code=" + code
	        + "&state=" + state;
	    String accessToken = "";
	    String refresh_token = "";
	    
	    System.out.println("apiURL: "+apiURL);
	    try {
	      URL url = new URL(apiURL);
	      HttpURLConnection con = (HttpURLConnection)url.openConnection();
	      con.setRequestMethod("GET");
	      int responseCode = con.getResponseCode();
	      BufferedReader br;
	      if (responseCode == 200) { // 정상 호출
	        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	      } else {  // 에러 발생
	        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	      }
	      String inputLine;
	      StringBuilder res = new StringBuilder();
	      while ((inputLine = br.readLine()) != null) {
	        res.append(inputLine);
	      }
	      br.close();
	      if (responseCode == 200) {
	    	  System.out.println(res.toString());
	      }
	    } catch (Exception e) {
	      // Exception 로깅
	    }
		//session.setAttribute("sessionMemberId", accessToken);
		return "main.do";
	}

	// ------------------------------------- 회원가입 아이디 중복검사 ------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/checkId.do")
	public String checkId(@RequestParam("memberId")String memberId, MemberVO memberVO) {
		memberVO.setMemberSearch("아이디 중복검사");
		memberVO.setMemberId(memberId);

		System.out.println(memberService.selectOne(memberVO));
		if (memberService.selectOne(memberVO) == null) {
			return String.valueOf(0);
		}
		return String.valueOf(1);
		
	}
	
	// ------------------------------------- 회원가입 연락처 중복검사 ------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/checkPhone.do")
	public String checkPhone(@RequestParam("memberPhone")String memberPhone, MemberVO memberVO) {
		memberVO.setMemberSearch("연락처 중복검사");
		memberVO.setMemberPhone(memberPhone);
		
		if (memberService.selectOne(memberVO) == null) {
			return String.valueOf(0);
		}
		return String.valueOf(1);
	}
	
	// ------------------------------------- 회원가입 이메일 중복검사 ------------------------------------------
	@ResponseBody
	@RequestMapping(value = "/checkEmail.do")
	public String checkEmail(@RequestParam("memberEmail")String memberEmail, MemberVO memberVO) {
		memberVO.setMemberSearch("이메일 중복검사");
		memberVO.setMemberEmail(memberEmail);
		
		if (memberService.selectOne(memberVO) == null) {
			return String.valueOf(0);
		}
		return String.valueOf(1);
	}
}