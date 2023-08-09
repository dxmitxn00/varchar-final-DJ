package com.varchar.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.buy.BuyDetailService;
import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.common.AlertVO;
import com.varchar.biz.review.ReviewService;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	private BuyDetailService buyDetailService;
	private TeaService teaService;
	
	// ------------------------- 리뷰 목록 페이지 ---------------------------------
	
	@RequestMapping(value="/reviewListPage.do")
	public String reviewListPage(ReviewVO reviewVO, HttpServletRequest request) {
		
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
		
		// pMemberId가 뭐임??????
		String memberId = request.getParameter("memberId");
		reviewVO.setMemberId(memberId == null ? "" : memberId);
		String searchName = request.getParameter("searchName");
		reviewVO.setSearchName(searchName == null ? "" : searchName);
		String reviewSearch = request.getParameter("reviewSearch");
		reviewVO.setReviewSearch(reviewSearch == null ? "" : reviewSearch);
		
		List<ReviewVO> reviewDatasTotal = reviewService.selectAll(reviewVO); // 총 리뷰 개수
		totalCnt = reviewDatasTotal.size();
		
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
		System.out.println("\teaLog: controller => ReviewListPageAction: [page: startPage: " + startPage + ", endPage: " + endPage + "]");
		
//		startRnum = (currentPage - 1) * pageSize + 1;
//		endRnum = startRnum + pageSize - 1;
		startRnum = (currentPage - 1) * pageSize;
		endRnum = startRnum + pageSize;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		System.out.println("\teaLog: controller => ReviewListPageAction: [page: startRnum: " + startRnum + ", endRnum: " + endRnum + "]");
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPageCnt", totalPageCnt);
		request.setAttribute("searchName", searchName);
		request.setAttribute("reviewSearch", reviewSearch);
		request.setAttribute("pMemberId", memberId);
		
		reviewVO.setSearchName(searchName + "_PAGING");
		reviewVO.setStartRnum(startRnum);
		List<ReviewVO> reviewDatas = reviewService.selectAll(reviewVO); // startRnum 부터 endRnum 까지의 리뷰
		request.setAttribute("reviewDatas", reviewDatas);
		
		return "reviewListPage.jsp";
	}
	
	// ------------------------- 리뷰 상세 페이지 ---------------------------------
	
	@RequestMapping(value="/reviewDetailPage.do")
	public String reviewDetailPage(ReviewVO reviewVO, Model model) {
		
		reviewVO.setReviewSearch("리뷰상세");
		reviewVO = reviewService.selectOne(reviewVO);
		System.out.println("로그: reviewDetailAction: " + reviewVO);
		
		if (reviewVO != null) {
			model.addAttribute("reviewData", reviewVO);
		}
		System.out.println(reviewVO);
		return "reviewDetailPage.jsp";
	}

	// ------------------------- 리뷰 작성 페이지 ---------------------------------
	
	@RequestMapping(value="/insertReviewPage.do")
	public String insertReviewsPage(ReviewVO reviewVO, BuyDetailVO buyDetailVO, TeaVO teaVO, HttpSession session, Model model) {
		
		reviewVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		buyDetailVO.setBuySearch("주문상세");
		buyDetailVO = buyDetailService.selectOne(buyDetailVO);
		
		teaVO = teaService.selectOne(teaVO);
		model.addAttribute("reviewData", reviewVO);
		model.addAttribute("teaDatas", teaVO);
		model.addAttribute("buyDetalDatas", buyDetailVO);
		
		System.out.println("InsertReviewsPageAction buySerial 로그: " + buyDetailVO);
		System.out.println("InsertReviewsPageAction buySerial 로그: " + teaVO);
		System.out.println("InsertReviewsPageAction buySerial 로그: " + buyDetailVO.getBuySerial());
		System.out.println("InsertReviewsPageAction buySerial 로그: " + reviewVO);
		
		return "insertReviewPage.jsp";
	}
	
	@RequestMapping(value="/insertReview.do")
	public String insertReviews(ReviewVO reviewVO, HttpSession session, Model model) {
		
		reviewVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		if(reviewService.insert(reviewVO)) {
			AlertVO sweetAlertVO = new AlertVO("후기작성", "후기작성완료!", null, "success", "reviewListPage.do?searchName=ALL");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}
		return "alertTrue.jsp";
	}
	
	// ------------------------- 리뷰 수정 페이지 ---------------------------------
	
	@RequestMapping(value="/updateReview.do")
	public String updateReviews(ReviewVO reviewVO, Model model) {
		reviewService.update(reviewVO);
		model.addAttribute("reviewData", reviewService.selectOne(reviewVO));
		return "reviewDetailPage.do";
	}
	
	@RequestMapping(value="/updateReviewPage.do")
	public String updateReviewsPage(ReviewVO reviewVO, Model model) {
		
		reviewVO = reviewService.selectOne(reviewVO);
		System.out.println("로그: UrpAction: " + reviewVO);
		
		if (reviewVO != null) {
			model.addAttribute("reviewData", reviewVO);
		}
		System.out.println(reviewVO);
		return "reviewUpdatePage.jsp";
	}
	
	// ------------------------- 리뷰 삭제 페이지 ---------------------------------
	
	@RequestMapping(value="/deleteReviewPage.do")
	public String deleteReviewsPage(Model model, ReviewVO reviewVO) {
		
		// int reviewNum = Integer.parseInt(request.getParameter("reviewNum")); 
		
		AlertVO sweetAlertVO = new AlertVO("후기삭제", "후기를 삭제하시겠습니까?", null, "question", "deleteReview.do?reviewNum=" + reviewVO.getReviewNum());
		model.addAttribute("sweetAlert", sweetAlertVO);
		
		return "alertChoose.jsp";
	}

	@RequestMapping(value="/deleteReview.do")
	public String deleteReviews(ReviewVO reviewVO, HttpSession session, Model model) {
		
		reviewVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		if(reviewService.delete(reviewVO)) {
			AlertVO sweetAlertVO = new AlertVO("후기삭제", "후기 삭제 성공!", null, "success", "myReviewListPage.do?searchName=MEMBER");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}
		
		return "alertTrue.jsp";
	}
	
	// ------------------------- 내 후기 페이지 ---------------------------------
	
	@RequestMapping(value="/myReviewsListPage.do")
	public String myReviewListPage(ReviewVO reviewVO, HttpSession session, HttpServletRequest request) {
		
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

		String memberId = (String)session.getAttribute("sessionMemberId");
		reviewVO.setMemberId(memberId);
		reviewVO.setSearchName(request.getParameter("searchName"));
		String searchName = request.getParameter("searchName");
		reviewVO.setSearchName(searchName == null ? "" : searchName);
		String reviewSearch = request.getParameter("reviewSearch");
		reviewVO.setReviewSearch(reviewSearch == null ? "" : reviewSearch);
		
		List<ReviewVO> reviewDatasTotal = reviewService.selectAll(reviewVO); // 총 리뷰 개수
		totalCnt = reviewDatasTotal.size();
		
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
		System.out.println("\teaLog: controller: MyReviewListPageAction: page: startPage: " + startPage + " endPage: " + endPage);
		
//		startRnum = (currentPage - 1) * pageSize + 1;
//		endRnum = startRnum + pageSize - 1;
		startRnum = (currentPage - 1) * pageSize;
		endRnum = startRnum + pageSize;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		System.out.println("\teaLog: controller: MyReviewListPageAction: page: startRnum: " + startRnum + " endRnum: " + endRnum);
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPageCnt", totalPageCnt);
		request.setAttribute("searchName", searchName);
		request.setAttribute("reviewSearch", reviewSearch);
		request.setAttribute("memberId", memberId);
		
		reviewVO.setSearchName(searchName + "_PAGING");
		reviewVO.setStartRnum(startRnum);
		List<ReviewVO> reviewDatas = reviewService.selectAll(reviewVO); // startRnum 부터 endRnum 까지의 리뷰
		request.setAttribute("reviewDatas", reviewDatas);
		
		return "reviewListPage.jsp";
	}
	
}
