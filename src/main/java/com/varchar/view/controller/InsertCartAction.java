package com.varchar.view.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeaDAO;
import model.TeaVO;

public class InsertCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = null;
		
		TeaDAO tDAO = new TeaDAO();
		TeaVO tVO = new TeaVO();
		
		System.out.println("로그: teaNum ["+request.getParameter("teaNum")+"]");
		System.out.println("로그: teaCnt ["+request.getParameter("teaCnt")+"]");
		
		tVO.setTeaNum(Integer.parseInt(request.getParameter("teaNum")));
		tVO = tDAO.selectOne(tVO);
		
		if (tVO == null) {
			return forward;         
		}
		
		
		tVO.setTeaCheckCnt(tVO.getTeaCnt());
		tVO.setTeaCnt(Integer.parseInt(request.getParameter("teaCnt")));
//		System.out.println("InsertChckCnt TeaCheckCnt log : " + tVO.getTeaCheckCnt());
		
		HttpSession session = request.getSession();
		
		ArrayList<TeaVO> cart = (ArrayList<TeaVO>)session.getAttribute("cart");
		
		forward = new ActionForward();
		forward.setRedirect(true);
		forward.setPath("cartPage.do"); // 현재페이지 아님 카트 페이지 받아와야함
		
		boolean flag = false;
		if (cart != null) {
			for (TeaVO t : cart) {
				if (t.getTeaNum() == tVO.getTeaNum()) {
					t.setTeaCnt(t.getTeaCnt() + tVO.getTeaCnt());
					System.out.println("로그 !null cart tVO" + tVO.getImageUrl());
					System.out.println("로그 !null cart t" + t.getImageUrl());
					flag = true;
					break;
				}
			}
		}
		else {
			System.out.println("로그 null cart" + tVO.getImageUrl());
			cart = new ArrayList<TeaVO>();
		}
		
		if (!flag) {
			cart.add(tVO);
		}
		
		session.setAttribute("cart", cart);
		
		return forward;
	}
	
}