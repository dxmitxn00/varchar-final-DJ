package com.varchar.view.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.BuyDetailDAO;
import model.BuyDetailVO;
import model.TeaDAO;
import model.TeaVO;

public class CartRetryAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		ActionForward forward = null;
		HttpSession session = request.getSession();

		ArrayList<TeaVO> cart = (ArrayList<TeaVO>)session.getAttribute("cart");
		System.out.println("현재 카트에 아무것도 없음");
		System.out.println(cart);

		TeaDAO tDAO = new TeaDAO();
		TeaVO tVO = new TeaVO();

		BuyDetailVO bdVO = new BuyDetailVO();
		BuyDetailDAO bdDAO = new BuyDetailDAO();
		ArrayList<BuyDetailVO> buyList = new ArrayList<BuyDetailVO>();

		System.out.println("로그: buyNum ["+request.getParameter("buyNum")+"]");

		bdVO.setBuySearch("다시담기");
		bdVO.setBuyNum(Integer.parseInt(request.getParameter("buyNum")));
		buyList = bdDAO.selectAll(bdVO); // 다시 담을 주문 내역



		//		System.out.println("로그: teaCnt ["+request.getParameter("teaCnt")+"]");

		//		tVO.setTeaNum(Integer.parseInt(request.getParameter("teaNum")));
		//		tVO = tDAO.selectOne(tVO);
		//		
		//		if (tVO == null) {
		//			return forward;         
		//		}
		//			tVO.setTeaCheckCnt(tVO.getTeaCnt());
		//			tVO.setTeaCnt(buyList.get(i).getBuyCnt());

		for (int i = 0; i<buyList.size(); i++) {
			tVO.setTeaNum(buyList.get(i).getTeaNum()); // i번째 상품 set 후 존재 확인
			TeaVO tttVO = tDAO.selectOne(tVO);
			if (tttVO == null) {
				return forward;         
			}
			System.out.println("tttVO: "+tttVO.getTeaNum());
			

			tttVO.setTeaCheckCnt(tttVO.getTeaCnt());
			tttVO.setTeaCnt(buyList.get(i).getBuyCnt());

			//
			boolean flag = false;
			if (cart != null) {

				for (TeaVO t : cart) {
					System.out.println("t: "+t.getTeaNum());
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

		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cartPage.do"); // 현재페이지 아님 카트 페이지 받아와야함

		session.setAttribute("cart", cart);

		return forward;

		//		System.out.println("InsertChckCnt TeaCheckCnt log : " + tVO.getTeaCheckCnt());	

	}


}
