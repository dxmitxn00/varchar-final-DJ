package com.varchar.view.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.buy.BuyDetailService;
import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.buy.BuyService;
import com.varchar.biz.buy.BuyVO;
import com.varchar.biz.member.MemberService;
import com.varchar.biz.member.MemberVO;
import com.varchar.biz.payment.PaymentService;
import com.varchar.biz.payment.PaymentVO;
import com.varchar.biz.review.ReviewService;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class BuyController {

	@Autowired
	private BuyService buyService;
	private MemberService memberService;
	private BuyDetailService buyDetailService;
	private ReviewService reviewService;
	private PaymentService paymentService;
	private TeaService teaService;

	////////////////////////////////////////////////////////////////////////////////////
	// 결제창 띄우기
	@RequestMapping(value="/buy.do")
	public String Buy(HttpServletRequest request) {

		request.setAttribute("total", request.getAttribute("total"));

		return "pay.jsp";
	}

	////////////////////////////////////////////////////////////////////////////////////
	// 주문 목록 페이지 이동
	@RequestMapping(value="/buyListPage.do")
	public String buyListPage(HttpSession session, Model model,BuyVO buyVO) {

		buyVO.setMemberId((String)session.getAttribute("sessionMemberId"));

		List<BuyVO> buyDatas = buyService.selectAll(buyVO);

		model.addAttribute("buyDatas", buyDatas);
		System.out.println(" log: BuyListPageAction: buyDatas: " + buyDatas);


		return "buyList.jsp";
	}

	////////////////////////////////////////////////////////////////////////////////////
	// 주문 페이지 이동
	@RequestMapping(value="/buyPage.do")
	public String buyPage(HttpSession session, Model model, MemberVO memberVO) {

		List<TeaVO> cart = (List<TeaVO>) session.getAttribute("cart");

		int i = 0;
		int total = 0;
		for (TeaVO t : cart) {
			int teaTotal = t.getTeaCnt()*t.getTeaPrice();
			cart.get(i).setTeaTotal(teaTotal);
			total += teaTotal;
			i++;
		}

		// 아래꺼 model로 바꿀까 고민중,,,
		session.setAttribute("buyList", cart);
		session.setAttribute("total", total);

		memberVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		memberVO.setMemberSearch("회원정보변경");
		memberVO = memberService.selectOne(memberVO);

		System.out.println("BuyPageAction memberVO log:" +memberVO);
		model.addAttribute("memberVO", memberVO);

		System.out.println("BuyPageAction buyList log:" +cart);
		System.out.println("BuyPageAction total log:" +total);

		return "buy.jsp";
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	// 주문상세 페이지 이동
	@RequestMapping(value="/buyDetailPage.do")
	public String buyDetailPage(Model model, BuyDetailVO buyDetailVO, ReviewVO reviewVO) {
		
		buyDetailVO.setBuySearch("주문상세");
		List<BuyDetailVO> buyDetailDatas = buyDetailService.selectAll(buyDetailVO);
		
//		ReviewDAO rDAO = new ReviewDAO();
		
		if (buyDetailDatas != null) {
			reviewVO.setReviewSearch("리뷰확인");
			for (BuyDetailVO bddata : buyDetailDatas) {
				bddata.setReviewDone(false);
				reviewVO.setBuySerial(bddata.getBuySerial());
				if (reviewService.selectOne(reviewVO) == null) {
					bddata.setReviewDone(true);
					System.out.println("BuyDetailPageAction reviewVO null 로그 : "+reviewService.selectOne(reviewVO));
				}
				else {
					System.out.println("BuyDetailPageAction reviewVO Not null  로그 : "+reviewService.selectOne(reviewVO));
					
				}
			}
			model.addAttribute("buyDetailDatas", buyDetailDatas);
			// View님들 bddatas를 buyDetailDatas로 변수명 바꿔주셈
		}
		
		return "buyDetail.jsp";
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	// 결제 성공 후 메인 이동
	// buyService, buyDetailService, teaService, paymentService
		@RequestMapping(value="/paySuccess.do")
		public String paySuccess(HttpSession session, BuyVO buyVO, BuyDetailVO buyDetailVO, TeaVO teaVO, PaymentVO paymentVO) {
			
			List<TeaVO> buyList = (List<TeaVO>) session.getAttribute("buyList");
			
			String memberId = (String)session.getAttribute("sessionMemberId");
			buyVO.setMemberId(memberId);
			
			if(buyService.insert(buyVO)) {
				buyDetailVO.setMemberId(memberId);
				buyDetailVO.setBuySearch("주문번호");
				buyDetailVO = buyDetailService.selectOne(buyDetailVO); // 방금 주문한 번호 (buy_num) 저장
				
				for (int i = 0; i<buyList.size(); i++) { // 상품 종류만큼 반복
//					tVO.setTeaNum(buyList.get(i).getTeaNum());
//					
//					tDAO.selectOne(tVO); // 으
					buyDetailVO.setTeaNum(buyList.get(i).getTeaNum()); // 구매한 상품 번호 set
					buyDetailVO.setBuyCnt(buyList.get(i).getTeaCnt()); // 구매한 상품 갯수 set
					
					teaVO.setTeaNum(buyList.get(i).getTeaNum());
					teaVO.setTeaCnt(buyList.get(i).getTeaCnt());
		
					buyDetailService.insert(buyDetailVO); // 상세 주문 추가
					teaService.update(teaVO);	// 상품 재고 변경
				}
				paymentVO.setPaymentName(memberId);
				paymentVO.setPaymentCustomer(memberId);
				paymentService.insert(paymentVO);
				session.removeAttribute("buyList");	
				session.removeAttribute("cart");
			}
			
			return "main.jsp";
		}
}
