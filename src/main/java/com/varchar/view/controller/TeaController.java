package com.varchar.view.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.favor.FavorService;
import com.varchar.biz.favor.FavorVO;
import com.varchar.biz.hashtag.TeaHashtagService;
import com.varchar.biz.hashtag.TeaHashtagVO;
import com.varchar.biz.review.ReviewService;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
public class TeaController {

	@Autowired
	private TeaService teaService;
	@Autowired
	private FavorService favorService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private TeaHashtagService teaHashtagService;

	// ---------------------------- 상품 목록 페이지 -------------------------------------

	@RequestMapping(value = "/teaListPage.do")
	public String teaListPage(TeaVO teaVO, Model model, TeaHashtagVO teaHashtagVO, HttpSession session,
			PagingVO pagingVO) { // 상품 목록

		int categoryNum = pagingVO.getCategoryNum();
		String teaSearchWord = pagingVO.getTeaSearchWord();
		String categoryName = pagingVO.getCategoryName();
		String teaHashtagContent = pagingVO.getTeaHashtagContent();
		int pageSize = 8;

		teaVO.setTeaCondition(teaHashtagContent == null || teaHashtagContent.equals("") ? "ALL" : "해시태그");
		teaVO.setCategoryNum(categoryNum);
		teaVO.setCategoryName(categoryName == null ? "" : categoryName);
		teaVO.setTeaSearchWord(teaSearchWord == null ? "" : teaSearchWord);
		teaVO.setTeaHashtagContent(teaHashtagContent);

		System.out.println(categoryNum);
		System.out.println(categoryName);
		System.out.println(teaSearchWord);
		System.out.println(teaHashtagContent);

		// ** 상품 NULL일때(아무 상품도 없을때) NPE 근데 아마 우리가 샘플 무조건 넣어서 괜찮긴 함 ---> 유효성 추가 필요 */
		List<TeaVO> teaDatasTotal = teaService.selectAll(teaVO); // 총 상품 개수
		System.out.println("상품리스트 로그 reviewDatasTotal: " + teaDatasTotal);

		pagingVO.setPageSize(pageSize);
		pagingVO.setTotalCnt(teaDatasTotal.size());
		pagingVO.setCurrentPageStr(pagingVO.getPage());

		// 페이지네이션 모듈화
		pagingVO = Paging.paging(pagingVO);

		//
		pagingVO.setTeaSearchWord(teaSearchWord);
		pagingVO.setCategoryNum(categoryNum);
		pagingVO.setCategoryName(categoryName);
		model.addAttribute("page", pagingVO);

		//
		teaVO.setTeaCondition(teaHashtagContent == null || teaHashtagContent.equals("") ? "페이징" : "해시태그 페이징");
		teaVO.setStartRnum(pagingVO.getStartRnum());
		teaVO.setEndRnum(pagingVO.getEndRnum());
		teaVO.setMemberId((String) session.getAttribute("sessionMemberId"));

		System.out.println(teaHashtagVO.getTeaHashtagContent());
		System.out.println(teaHashtagVO.getTeaHashtagCondition());
		// 전체 목록 출력
		List<TeaVO> teaDatas = teaService.selectAll(teaVO);

		// 각 상품별 해시태그 뽑아서 배열에 저장
		for (TeaVO teaData : teaDatas) {
			teaHashtagVO.setItemNum(teaData.getTeaNum()); // tea상품별 teaNum set해줌
			teaData.setTeaHashtags(teaHashtagService.selectAll(teaHashtagVO)); // 각 상품 해시태그값들을 set해줌
		}

		model.addAttribute("teaDatas", teaDatas);

		System.out.println("session memberId: " + (String) session.getAttribute("sessionMemberId"));
		System.out.println("상품리스트 로그 teaDatas: " + teaDatas);

		System.out.println("\teaLog: controller => TeaListPageAction [END]");
		return "teaList.jsp";
	}

	// ---------------------------- 상품 상세 페이지 -------------------------------------
	// tVO 따로 사용하지 말고 상품 정보 RiviewSetVO에 담아서 오자!!!
	// ** set 구조 변경 */

	@RequestMapping(value = "/teaDetailPage.do")
	public String teaDetailPage(TeaVO teaVO, FavorVO favorVO, PagingVO pagingVO, ReviewVO reviewVO,
			TeaHashtagVO teaHashtagVO, HttpSession session, Model model) { // 상품 상세

		int favorResult = 0;
		System.out.println("favorResult 로그: " + favorResult);

		teaVO = teaService.selectOne(teaVO);

		favorVO.setMemberId((String) session.getAttribute("sessionMemberId"));
		if (session.getAttribute("sessionMemberId") == null) {
			favorResult = 0;
		} else if (favorService.selectOne(favorVO) != null) {
			favorResult = 1;
		}

		System.out.println("로그 selctOne 결과:" + teaVO);
		////////////////////////////////////////////////////////////////////////

		String searchName = pagingVO.getSearchName(); // DETAIL
		reviewVO.setSearchName(searchName == null ? "" : searchName);

		teaHashtagVO.setItemNum(teaVO.getTeaNum());
		// ** 리뷰 NULL일때(아무 리뷰도 없을때) NPE ---> 유효성 추가 필요 */
		List<ReviewVO> reviewDatasTotal = reviewService.selectAll(reviewVO); // 총 리뷰 개수
		teaHashtagVO.setTeaHashtagCondition("상품");
		List<TeaHashtagVO> teaHashtags = teaHashtagService.selectAll(teaHashtagVO); // 상품 해시태그

		model.addAttribute("teaData", teaVO);
		model.addAttribute("favorResult", favorResult);
		model.addAttribute("reviewDatas", reviewDatasTotal);
		model.addAttribute("teaHashtags", teaHashtags);
		System.out.println("전체 후기: " + reviewDatasTotal);
		System.out.println("상품 해시태그들: " + teaHashtags);

		ArrayList<TeaVO> recentList = (ArrayList<TeaVO>) session.getAttribute("recentList");

		if (recentList != null) { // 리스트에 이미 담긴 상품이 있을 경우


			int i = Product.cartCheck(teaVO, recentList);

			if (i == -1) { // 같은 상품 없음
				recentList.add(0, teaVO);
			} else { // 같은 상품 있음
				recentList.remove(i);
				recentList.add(0, teaVO);
			}

		} else { // 카트가 비어있을 경우
			recentList = new ArrayList<TeaVO>();
			recentList.add(0, teaVO);
		}
		
		while(recentList.size() > 3) {
			recentList.remove(3);
		}

		session.setAttribute("recentList", recentList);
		System.out.println("최근 본 상품: " + recentList);

		return "teaDetail.jsp";
	}

}