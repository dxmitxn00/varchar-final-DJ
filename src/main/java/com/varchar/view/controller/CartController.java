package com.varchar.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.varchar.biz.buy.BuyDetailService;
import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class CartController {

	@Autowired
	private BuyDetailService buyDetailService;
	@Autowired
	private TeaService teaService;

	// --------------------------------- 장바구니 페이지 이동 ---------------------------------
	@RequestMapping(value = "/cartPage.do")
	public String cartPage() {
		return "redirect:cart.jsp";
	}

	// --------------------------------- 장바구니 추가 ---------------------------------
	@RequestMapping(value = "/insertCart.do")
	public String insertCart(TeaVO teaVO, HttpSession session) {
		
		int cnt = teaVO.getTeaCnt();
		//** 해당 상품 없을시 ---> 유효성 추가 필요 */
		teaVO = teaService.selectOne(teaVO);
		int checkCnt = teaVO.getTeaCnt();
		
		teaVO.setTeaCnt(cnt);
		teaVO.setTeaCheckCnt(checkCnt);
		
		Product.cartInsert(teaVO, session);
		return "redirect:cartPage.do";
	}

	// --------------------------------- 장바구니 삭제 ---------------------------------
	@ResponseBody
	@RequestMapping(value = "/deleteCart.do")
	public String deleteCartAction(HttpSession session, TeaVO teaVO) {
		
		ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");
		int i = Product.cartCheck(teaVO, cart);
		cart.remove(i);
		session.setAttribute("cart", cart);

		return "redirect:cartPage.do";
	}

	// --------------------------------- 장바구니 재고변경 ---------------------------------
	@ResponseBody
	@RequestMapping(value = "/cartChange.do")
	public String cartChange(HttpSession session, TeaVO teaVO) {

		ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");

		System.out.println("로그 teaNum: [" + teaVO.getTeaNum() + "]");
		System.out.println("로그 teaCnt: [" + teaVO.getTeaCnt() + "]");

		
		int i = Product.cartCheck(teaVO, cart);
		
		if(i == -1) {
			return "장바구니에 해당 제품이 없는데 재고변경 요청 들어옴";
		}
		
		int cnt = teaVO.getTeaCnt();
		int checkCnt = teaService.selectOne(teaVO).getTeaCnt();
		
		teaVO.setTeaCheckCnt(checkCnt);
		cnt = Product.checkCnt(teaVO);
		
		cart.get(i).setTeaCnt(cnt);

		session.setAttribute("cart", cart);
		return "redirect:cartPage.do";

	}

	// --------------------------------- 장바구니 전체 비우기 ---------------------------------
	@ResponseBody
	@RequestMapping(value = "/cartDrop.do")
	public String cartDrop(HttpSession session) {

		session.removeAttribute("cart");

		System.out.println("카트 비워짐");

		return "redirect:cartPage.do";
	}
	
	// --------------------------------- 장바구니 다시담기 페이지 ---------------------------------
	@RequestMapping(value = "/cartRetry.do")
	public String cartRetry(HttpSession session, TeaVO teaVO, BuyDetailVO buyDetailVO) {

		List<BuyDetailVO> buyList = new ArrayList<BuyDetailVO>();
		
		System.out.println("현재 카트에 아무것도 없음");
		System.out.println("로그: buyNum ["+buyDetailVO.getBuyNum()+"]");

		//** 해당 주문내역이 없을 경우(다시담시 선택한 주문번호가 유효하지 않을 경우) ---> 유효성 추가 필요 */
		buyDetailVO.setBuySearch("다시담기");
		buyList = (List<BuyDetailVO>) buyDetailService.selectAll(buyDetailVO); // 다시 담을 주문 내역 저장

		for (int i = 0; i < buyList.size(); i++) {
			teaVO.setTeaNum(buyList.get(i).getTeaNum()); // i번째 상품 set 후 존재 확인
			TeaVO tttVO = teaService.selectOne(teaVO);
			if (tttVO == null) {
				return "실패처리 경로";
			}
			System.out.println("tttVO: " + tttVO.getTeaNum());

			tttVO.setTeaCheckCnt(tttVO.getTeaCnt());
			tttVO.setTeaCnt(buyList.get(i).getBuyCnt());
			
			Product.cartInsert(tttVO, session);

		}

		return "redirect:cartPage.do";

	}
	
	// --------------------------------- 장바구니 총 가격 계산 ---------------------------------
	@ResponseBody
	@RequestMapping(value = "/total.do")
	public String cartTotal(HttpServletRequest request, HttpSession session) {
		
		List<TeaVO> cart = (List<TeaVO>) session.getAttribute("cart");

		int i = 0;
		int total = 0;
		for (TeaVO t : cart) {
			int teaTotal = t.getTeaCnt() * t.getTeaPrice();
			cart.get(i).setTeaTotal(teaTotal);
			total += teaTotal;
			i++;
		}

		// 아래꺼 model로 바꿀까 고민중,,,
		session.setAttribute("buyList", cart);
		session.setAttribute("total", total);


		System.out.println("BuyPageAction buyList log:" + cart);
		System.out.println("BuyPageAction total log:" + total);
		
		return String.valueOf(total);
	}
}