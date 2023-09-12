package com.varchar.view.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

public class Product {

	public static void cartInsert(TeaVO teaVO, HttpSession session) {

		ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");

		System.out.println("로그 teaNum: [" + teaVO.getTeaNum() + "]");
		System.out.println("로그 teaCnt: [" + teaVO.getTeaCnt() + "]"); // 구매할 갯수

		// 처음부터 teaCheckCnt에 구매할 갯수 가져오는거 검토
		// teaVO.setTeaCheckCnt(teaVO.getTeaCnt());
		// System.out.println("InsertChckCnt TeaCheckCnt log : " +
		// teaVO.getTeaCheckCnt());
		int cnt = teaVO.getTeaCnt(); // 추가할 갯수

		int i = -2;
		if (cart != null) { // 카트에 이미 담긴 상품이 있을 경우
			
			i = cartCheck(teaVO, cart);
			
		} else { // 카트가 비어있을 경우
			System.out.println("로그 null cart" + teaVO.getImageUrl());
			cart = new ArrayList<TeaVO>();
			i = -1;
			//cart.add(teaVO);
		}

		
		if (i == -1) { // 장바구니에 같은 상품 없음
			cnt = Product.checkCnt(teaVO);
			teaVO.setTeaCnt(cnt);
			cart.add(teaVO);
		}
		else { // 장바구니에 같은 상품 있음
			cnt = cart.get(i).getTeaCnt() + cnt;
			teaVO.setTeaCnt(cnt);
			cnt = Product.checkCnt(teaVO);
			cart.get(i).setTeaCnt(cnt);
		}

		session.setAttribute("cart", cart);

	}

	public static int cartCheck(TeaVO teaVO, ArrayList<TeaVO> cart) {
		
		// 장바구니 같은 상품있는지 검사 ---> 단건 검사만
		int i = 0;
		for (TeaVO t : cart) {
			if (t.getTeaNum() == teaVO.getTeaNum()) {
				return i;
			}
			i++;
		}
		System.out.println("Product cartCheck i: "+i);
		return -1; // 장바구니에 같은 상품 없을시 -1 반환
		
		
	}
	
	// 재고 검사
	public static int checkCnt(TeaVO teaVO) {
		int cnt = teaVO.getTeaCnt(); // 변경할 것
		int checkCnt = teaVO.getTeaCheckCnt(); // 가지고 있음
		
		if(cnt > checkCnt) {
			cnt = checkCnt;
		}
		
		// 해당 부분 없앨까 고민
		if(cnt < 0) {
			cnt = 0;
		}

		return cnt;
	}

}
