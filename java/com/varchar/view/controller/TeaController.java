package com.varchar.view.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.common.Paging;
import com.varchar.biz.common.PagingVO;
import com.varchar.biz.favor.FavorService;
import com.varchar.biz.favor.FavorVO;
import com.varchar.biz.review.ReviewService;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.ReviewSet;
import com.varchar.biz.tea.ReviewSetService;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class TeaController {
	
	@Autowired
	private TeaService teaService;
	@Autowired
	private FavorService favorService;
	@Autowired
	private ReviewSetService reviewSetService;
	@Autowired
	private ReviewService reviewService;
	
	// ---------------------------- 상품 목록 페이지 -------------------------------------
	
	@RequestMapping(value="/teaListPage.do")
	public String teaListPage(TeaVO teaVO, Model model, HttpSession session, PagingVO pagingVO) { // 상품 목록

		String teaCategory = pagingVO.getTeaCategory();
		String teaSearchWord = pagingVO.getTeaSearchWord();
		int pageSize = 8;
		
		teaVO.setTeaCategory(teaCategory == null ? "" : teaCategory);
		teaVO.setTeaSearchWord(teaSearchWord == null ? "" : teaSearchWord);
		
		
		System.out.println(teaCategory);
		System.out.println(teaSearchWord);
		
		List<TeaVO> teaDatasTotal = teaService.selectAll(teaVO); // 총 상품 개수
		System.out.println("상품리스트 로그 reviewDatasTotal: "+ teaDatasTotal);
		
		pagingVO.setPageSize(pageSize);
		pagingVO.setTotalCnt(teaDatasTotal.size());
		pagingVO.setCurrentPageStr(pagingVO.getPage());

		// 페이지네이션 모듈화
		pagingVO = Paging.paging(pagingVO);
			
		//
		pagingVO.setTeaSearchWord(teaSearchWord);
		pagingVO.setTeaCategory(teaCategory);
		model.addAttribute("page",pagingVO);
		
		//
		teaVO.setTeaCondition("페이징");
		teaVO.setStartRnum(pagingVO.getStartRnum());
		teaVO.setTeaName((String)session.getAttribute("sessionMemberId"));
		
		List<TeaVO> teaDatas = teaService.selectAll(teaVO);
		model.addAttribute("teaDatas", teaDatas);
		
		System.out.println("session memberId: " + (String)session.getAttribute("sessionMemberId"));
		System.out.println("상품리스트 로그 teaDatas: "+ teaDatas);
		
		System.out.println("\teaLog: controller => TeaListPageAction [END]");
		return "teaList.jsp";
	}
	
	// ---------------------------- 상품 상세 페이지 -------------------------------------
	// tVO 따로 사용하지 말고 상품 정보 RiviewSetVO에 담아서 오자!!!
	
	@RequestMapping(value="/teaDetailPage.do")
	public String teaDetailPage(TeaVO teaVO, FavorVO favorVO, ReviewSet reviewSetVO, ReviewVO reviewVO, HttpSession session, Model model) { // 상품 상세

//		int favor = 0;
		int favorResult = 0;
		System.out.println("favorResult 로그: "+ favorResult);

		// System.out.println(request.getParameter("teaNum"));

		teaVO = teaService.selectOne(teaVO);

		reviewVO.setSearchName("REVIEW");
		reviewVO.setReviewSearch(teaVO.getTeaName());
		List<ReviewVO> reviewDatas = reviewService.selectAll(reviewVO);
		int reviewCnt = reviewDatas.size();
		
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		if (session.getAttribute("sessionMemberId") == null) {
			favorResult = 0;
		}
		else if (favorService.selectOne(favorVO) != null) {
			favorResult = 1;
		}

		System.out.println("로그 selctOne 결과:" + teaVO);

		List<ReviewSet> reviewSetDatas = null;
		String count = teaVO.getCount();

		if (count == null || count.isEmpty() || count.isBlank() || count.equals("")) {
			count = "4";
		}
		int cnt = Integer.parseInt(count);

		teaVO.setStartRnum(cnt);

		if (teaVO != null) {
			// 리뷰 형태 결정 후
			// 해당 상품 리뷰도 같이 추출
			reviewSetVO.setTea(teaVO);
			
			reviewSetDatas = reviewSetService.selectAll(reviewSetVO);
			
			model.addAttribute(count);
			model.addAttribute("teaData", teaVO);
			model.addAttribute("reviewSetDatas", reviewSetDatas);
			model.addAttribute("favorResult", favorResult);
			model.addAttribute("count", count);
			model.addAttribute("reviewCnt", reviewCnt);
		}
		return "teaDetail.jsp";
	}

	
}