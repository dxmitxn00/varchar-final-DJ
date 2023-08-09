package com.varchar.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.buy.BuyDetailService;
import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class CartController {

	@Autowired
	private BuyDetailService buyDetailService;
	private TeaService teaService;

	// 장바구니 페이지
	@RequestMapping(value = "/cartPage.do")
	public String cartPage() {
		return "redirect:cartPage.jsp";
	}

	// 장바구니 다시담기 페이지
	@RequestMapping(value = "/cartRetry.do")
	public String cartRetry(HttpSession session, TeaVO teaVO, BuyDetailVO buyDetailVO) {

		// 세션도 set 됨??????? 자동으로?????????
		ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");
		System.out.println("현재 카트에 아무것도 없음");
		System.out.println("cart 로그 : " + cart);

		List<BuyDetailVO> buyList = new ArrayList<BuyDetailVO>();

		// System.out.println("로그: buyNum ["+request.getParameter("buyNum")+"]");

		buyDetailVO.setBuySearch("다시담기");
		// buyDetailVO.setBuyNum(Integer.parseInt(request.getParameter("buyNum")));
		buyList = (List<BuyDetailVO>) buyDetailService.selectAll(buyDetailVO); // 다시 담을 주문 내역

		for (int i = 0; i < buyList.size(); i++) {
			teaVO.setTeaNum(buyList.get(i).getTeaNum()); // i번째 상품 set 후 존재 확인
			TeaVO tttVO = teaService.selectOne(teaVO);
			if (tttVO == null) {
				return "실패처리 경로";
			}
			System.out.println("tttVO: " + tttVO.getTeaNum());

			tttVO.setTeaCheckCnt(tttVO.getTeaCnt());
			tttVO.setTeaCnt(buyList.get(i).getBuyCnt());

			//
			boolean flag = false;
			if (cart != null) {

				for (TeaVO t : cart) {
					System.out.println("t: " + t.getTeaNum());
					if (t.getTeaNum() == tttVO.getTeaNum()) {
						t.setTeaCnt(t.getTeaCnt() + tttVO.getTeaCnt());
						System.out.println("로그 !null cart tttVO" + tttVO.getImageUrl());
						System.out.println("로그 !null cart t" + t.getImageUrl());
						flag = true;
						break;
					}
				}
			}

			else {
				System.out.println("로그 null cart" + tttVO.getImageUrl());
				cart = new ArrayList<TeaVO>();
			}

			if (!flag) {
				System.out.println("추가추가");
				cart.add(tttVO);
			}

		}

		session.setAttribute("cart", cart);

		return "redirect:cartPage.do";

		// System.out.println("InsertChckCnt TeaCheckCnt log : " +
		// tVO.getTeaCheckCnt());

	}
	
//	// 장바구니 추가
//	@RequestMapping(value = "/insertCart.do")
//	public String insertCart(TeaVO teaVO, HttpSession session){
//		
//		//ActionForward forward = null;
//
//		
////		System.out.println("로그: teaNum ["+request.getParameter("teaNum")+"]");
////		System.out.println("로그: teaCnt ["+request.getParameter("teaCnt")+"]");
//		
////		teaVO.setTeaNum(Integer.parseInt(request.getParameter("teaNum")));
//		teaVO = teaService.selectOne(teaVO);
//		
//		if (teaVO == null) {
//			return forward;         
//		}
//		
//		
//		teaVO.setTeaCheckCnt(teaVO.getTeaCnt());
////		teaVO.setTeaCnt(Integer.parseInt(request.getParameter("teaCnt")));
////		System.out.println("InsertChckCnt TeaCheckCnt log : " + tVO.getTeaCheckCnt());
//		
////		HttpSession session = request.getSession();
//		
//		ArrayList<TeaVO> cart = (ArrayList<TeaVO>)session.getAttribute("cart");
//		
//		
//		boolean flag = false;
//		if (cart != null) {
//			for (TeaVO t : cart) {
//				if (t.getTeaNum() == teaVO.getTeaNum()) {
//					t.setTeaCnt(t.getTeaCnt() + teaVO.getTeaCnt());
//					System.out.println("로그 !null cart tVO" + teaVO.getImageUrl());
//					System.out.println("로그 !null cart t" + t.getImageUrl());
//					flag = true;
//					break;
//				}
//			}
//		}
//		else {
//			System.out.println("로그 null cart" + teaVO.getImageUrl());
//			cart = new ArrayList<TeaVO>();
//		}
//		
//		if (!flag) {
//			cart.add(teaVO);
//		}
//		
//		session.setAttribute("cart", cart);
//		
//		return "redirect:cartPage.do";
//	}
//	
//	// 장바구니 삭제
//	@RequestMapping(value = "/deleteCart.do")
//	public String deleteCartAction(HttpSession session, TeaVO teaVO){
//		
////		int teaNum = Integer.parseInt(request.getParameter("teaNum"));	
////		HttpSession session = request.getSession();
//		
//		ArrayList<TeaVO> cart = (ArrayList<TeaVO>)session.getAttribute("cart");
//		
//		int i = 0;
//		for (TeaVO t : cart) {
//			if (t.getTeaNum() == teaVO.getTeaNum()) {
//				cart.remove(i);
//				break;
//			}
//			i++;
//		}
//		
//		session.setAttribute("cart", cart);
//		
//
//		return "redirect:cartPage.do";
//	}
	

}
