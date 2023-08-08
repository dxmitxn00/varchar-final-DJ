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
	
	@RequestMapping(value="/reviewsListPage.do")
	public String reviewListPage(ReviewVO rVO, HttpServletRequest request) {
		
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
		
		String pMemberId = request.getParameter("pMemberId");
		rVO.setMemberId(pMemberId == null ? "" : pMemberId);
		String searchName = request.getParameter("searchName");
		rVO.setSearchName(searchName == null ? "" : searchName);
		String reviewSearch = request.getParameter("reviewSearch");
		rVO.setReviewSearch(reviewSearch == null ? "" : reviewSearch);
		
		List<ReviewVO> rdatasTotal = reviewService.selectAll(rVO); // 총 리뷰 개수
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
		System.out.println("\tLog: controller => ReviewsListPageAction: [page: startPage: " + startPage + ", endPage: " + endPage + "]");
		
//		startRnum = (currentPage - 1) * pageSize + 1;
//		endRnum = startRnum + pageSize - 1;
		startRnum = (currentPage - 1) * pageSize;
		endRnum = startRnum + pageSize;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		System.out.println("\tLog: controller => ReviewsListPageAction: [page: startRnum: " + startRnum + ", endRnum: " + endRnum + "]");
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPageCnt", totalPageCnt);
		request.setAttribute("searchName", searchName);
		request.setAttribute("reviewSearch", reviewSearch);
		request.setAttribute("pMemberId", pMemberId);
		
		rVO.setSearchName(searchName + "_PAGING");
		rVO.setStartRnum(startRnum);
		List<ReviewVO> rdatas = reviewService.selectAll(rVO); // startRnum 부터 endRnum 까지의 리뷰
		request.setAttribute("rdatas", rdatas);
		
		return "reviewsListPage.jsp";
	}
	
	// ------------------------- 리뷰 상세 페이지 ---------------------------------
	
	@RequestMapping(value="/reviewsDetailPage.do")
	public String reviewDetailPage(ReviewVO rVO, Model model) {
		
		rVO.setReviewSearch("리뷰상세");
		rVO = reviewService.selectOne(rVO);
		System.out.println("로그: reviewDetailAction: " + rVO);
		
		if (rVO != null) {
			model.addAttribute("rdata", rVO);
		}
		System.out.println(rVO);
		return "reviewsDetailPage.jsp";
	}

	// ------------------------- 리뷰 작성 페이지 ---------------------------------
	
	@RequestMapping(value="/insertReviewsPage.do")
	public String insertReviewsPage(ReviewVO rVO, BuyDetailVO bdVO, TeaVO tVO, HttpSession session, Model model) {
		
		rVO.setMemberId((String)session.getAttribute("ssMemberId"));
		
		bdVO.setBuySearch("주문상세");
		bdVO = buyDetailService.selectOne(bdVO);
		
		tVO = teaService.selectOne(tVO);
		model.addAttribute("rdata", rVO);
		model.addAttribute("tdatas", tVO);
		model.addAttribute("bddatas", bdVO);
		
		System.out.println("InsertReviewsPageAction buySerial 로그: " + bdVO);
		System.out.println("InsertReviewsPageAction buySerial 로그: " + tVO);
		System.out.println("InsertReviewsPageAction buySerial 로그: " + bdVO.getBuySerial());
		System.out.println("InsertReviewsPageAction buySerial 로그: " + rVO);
		
		return "insertReviewsPage.jsp";
	}
	
	@RequestMapping(value="/insertReviews.do")
	public String insertReviews(ReviewVO rVO, HttpSession session, Model model) {
		
		rVO.setMemberId((String)session.getAttribute("ssMemberId"));
		
		if(reviewService.insert(rVO)) {
			AlertVO saVO = new AlertVO("후기작성", "후기작성완료!", null, "success", "reviewsListPage.do?searchName=ALL");
			model.addAttribute("sa", saVO);
		}
		return "alertTrue.jsp";
	}
	
	// ------------------------- 리뷰 수정 페이지 ---------------------------------
	
	@RequestMapping(value="/updateReviews.do")
	public String updateReviews(ReviewVO rVO, Model model) {
		reviewService.update(rVO);
		model.addAttribute("rdata", reviewService.selectOne(rVO));
		return "reviewsDetailPage.do";
	}
	
	@RequestMapping(value="/updateReviewsPage.do")
	public String updateReviewsPage(ReviewVO rVO, Model model) {
		
		rVO = reviewService.selectOne(rVO);
		System.out.println("로그: UrpAction: " + rVO);
		
		if (rVO != null) {
			model.addAttribute("rdata", rVO);
		}
		System.out.println(rVO);
		return "reviewUpdatePage.jsp";
	}
	
	// ------------------------- 리뷰 삭제 페이지 ---------------------------------
	
	@RequestMapping(value="/deleteReviewsPage.do")
	public String deleteReviewsPage(Model model, ReviewVO rVO) {
		
		// int reviewNum = Integer.parseInt(request.getParameter("reviewNum")); 
		
		AlertVO saVO = new AlertVO("후기삭제", "후기를 삭제하시겠습니까?", null, "question", "deleteReviews.do?reviewNum=" + rVO.getReviewNum());
		model.addAttribute("sa", saVO);
		
		return "alertChoose.jsp";
	}

	@RequestMapping(value="/deleteReviews.do")
	public String deleteReviews(ReviewVO rVO, HttpSession session, Model model) {
		
		rVO.setMemberId((String)session.getAttribute("ssMemberId"));
		
		if(reviewService.delete(rVO)) {
			AlertVO saVO = new AlertVO("후기삭제", "후기 삭제 성공!", null, "success", "myReviewsListPage.do?searchName=MEMBER");
			model.addAttribute("sa", saVO);
		}
		
		return "alertTrue.jsp";
	}
	
	
}
