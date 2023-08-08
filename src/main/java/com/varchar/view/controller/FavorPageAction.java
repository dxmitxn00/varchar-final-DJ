package com.varchar.view.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FavorDAO;
import model.FavorVO;

public class FavorPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward = new ActionForward();
		
		FavorDAO fDAO = new FavorDAO();
		FavorVO fVO = new FavorVO();
		
		HttpSession session = request.getSession();
		
		fVO.setMemberId((String)session.getAttribute("ssMemberId"));
		
		ArrayList<FavorVO> fdatas = fDAO.selectAll(fVO);
		request.setAttribute("fdatas", fdatas);
		
		System.out.println("FavorPageAction fVO.getMemberId  로그: "+fVO.getMemberId());
		System.out.println("FavorPageAction fadats 로그: "+fdatas);
		
		forward.setRedirect(false);
		forward.setPath("favor.jsp");
		
		return forward;
	}
	
}
