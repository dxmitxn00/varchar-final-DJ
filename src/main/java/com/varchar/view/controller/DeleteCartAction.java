package com.varchar.view.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeaVO;

public class DeleteCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		int teaNum = Integer.parseInt(request.getParameter("teaNum"));
		
		HttpSession session = request.getSession();
		
		ArrayList<TeaVO> cart = (ArrayList<TeaVO>)session.getAttribute("cart");
		
		int i = 0;
		for (TeaVO t : cart) {
			if (t.getTeaNum() == teaNum) {
				cart.remove(i);
				break;
			}
			i++;
		}
		
		session.setAttribute("cart", cart);
		
		forward.setRedirect(true);
		forward.setPath("cartPage.do");
		
		return forward;
	}
	
}
