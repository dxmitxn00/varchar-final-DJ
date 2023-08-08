package com.varchar.view.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.ReviewDAO;
import model.ReviewVO;

public class MyReviewListPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		ReviewDAO rDAO = new ReviewDAO();
		ReviewVO rVO = new ReviewVO();
		
		int currentPage = 1;
		
		String currentPageStr = request.getParameter("page");
		try {
			if (currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);				
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		final int pageSize = 6; // 한페이지에 보여줄 행
		final int pageBlock = 2; // 페이징에 나타날 페이지수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 끝 페이지
		int startRnum = 0; // 시작 후기 rnum
		int endRnum = 0; // 끝 후기 rnum
		int totalCnt = 0; // 총 후기 수

		HttpSession session = request.getSession();
		
		String pMemberId = (String)session.getAttribute("ssMemberId");
		rVO.setMemberId(pMemberId);
		rVO.setSearchName(request.getParameter("searchName"));
		String searchName = request.getParameter("searchName");
		rVO.setSearchName(searchName == null ? "" : searchName);
		String reviewSearch = request.getParameter("reviewSearch");
		rVO.setReviewSearch(reviewSearch == null ? "" : reviewSearch);
		
		ArrayList<ReviewVO> rdatasTotal = rDAO.selectAll(rVO); // 총 리뷰 개수
		totalCnt = rdatasTotal.size();
		
		int totalPageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPageCnt) {
			endPage = totalPageCnt;
		}
		System.out.println("\tLog: controller: MyReviewsListPageAction: page: startPage: " + startPage + " endPage: " + endPage);
		
//		startRnum = (currentPage - 1) * pageSize + 1;
//		endRnum = startRnum + pageSize - 1;
		startRnum = (currentPage - 1) * pageSize;
		endRnum = startRnum + pageSize;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		System.out.println("\tLog: controller: MyReviewsListPageAction: page: startRnum: " + startRnum + " endRnum: " + endRnum);
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPageCnt", totalPageCnt);
		request.setAttribute("searchName", searchName);
		request.setAttribute("reviewSearch", reviewSearch);
		request.setAttribute("pMemberId", pMemberId);
		
		rVO.setSearchName(searchName + "_PAGING");
		rVO.setStartRnum(startRnum);
		ArrayList<ReviewVO> rdatas = rDAO.selectAll(rVO); // startRnum 부터 endRnum 까지의 리뷰
		request.setAttribute("rdatas", rdatas);
		
		forward.setRedirect(false);
		forward.setPath("reviewsListPage.jsp");
		
		return forward;
	}

}
