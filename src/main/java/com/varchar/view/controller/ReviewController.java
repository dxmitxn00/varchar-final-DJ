package com.varchar.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.varchar.biz.buy.BuyDetailService;
import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.common.AlertVO;
import com.varchar.biz.hashtag.HashtagDetailService;
import com.varchar.biz.hashtag.HashtagDetailVO;
import com.varchar.biz.hashtag.ReviewHashtagService;
import com.varchar.biz.hashtag.ReviewHashtagVO;
import com.varchar.biz.review.ReviewService;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.ImageService;
import com.varchar.biz.tea.ImageVO;
import com.varchar.biz.tea.TeaService;
import com.varchar.biz.tea.TeaVO;

@Controller
@SessionAttributes("reviewData")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;
	@Autowired
	private BuyDetailService buyDetailService;
	@Autowired
	private TeaService teaService;
	@Autowired
	private ReviewHashtagService reviewHashtagService;
	@Autowired
	private HashtagDetailService hashtagDetailService;
	@Autowired
	private ImageService imageService;

	// ------------------------- 리뷰 목록 페이지 ---------------------------------

	@RequestMapping(value="/reviewListPage.do")
	public String reviewListPage(ReviewVO reviewVO, ReviewHashtagVO reviewHashtagVO, PagingVO pagingVO, Model model) {

		int pageSize = 5;
		String searchName = pagingVO.getSearchName();
		String reviewSearch = pagingVO.getReviewSearch();
		String memberId = pagingVO.getMemberId();

		reviewVO.setMemberId(memberId == null ? "" : memberId);
		reviewVO.setSearchName(searchName == null ? "" : searchName);
		reviewVO.setReviewSearch(reviewSearch == null ? "" : reviewSearch);

		//** 리뷰 NULL일때(아무 리뷰도 없을때) NPE ---> 유효성 추가 필요 */
		List<ReviewVO> reviewDatasTotal = reviewService.selectAll(reviewVO); // 총 리뷰 개수

		pagingVO.setPageSize(pageSize);
		pagingVO.setTotalCnt(reviewDatasTotal.size());
		pagingVO.setCurrentPageStr(pagingVO.getPage());

		// 페이지네이션 모듈화
		pagingVO = Paging.paging(pagingVO);

		pagingVO.setSearchName(searchName);
		pagingVO.setReviewSearch(reviewSearch);
		pagingVO.setMemberId(memberId);

		model.addAttribute("page", pagingVO);

		reviewVO.setSearchName(searchName + "_PAGING");
		reviewVO.setStartRnum(pagingVO.getStartRnum());
		reviewVO.setEndRnum(pagingVO.getEndRnum());

		// 해시태그 검색을 위한 SearchCondition
		if(reviewHashtagVO.getReviewHashtagContent() != null) {
			reviewHashtagVO.setHashTagSearchCondition("후기번호검색");
		}

		// 전체 리뷰 출력
		List<ReviewVO> reviewDatas = reviewService.selectAll(reviewVO); // startRnum 부터 endRnum 까지의 리뷰

		// 각 리뷰별 해시태그 뽑아서 배열에 저장
		for(ReviewVO reviewData : reviewDatas) {
			reviewHashtagVO.setItemNum(reviewData.getReviewNum()); // 리뷰별 reviewNum set해줌
			reviewData.setReviewHashtags(reviewHashtagService.selectAll(reviewHashtagVO));// 각 리뷰 해시태그값들을 Set해줌
		}
		model.addAttribute("reviewDatas", reviewDatas);

		System.out.println(reviewDatas);

		return "reviewList.jsp";
	}

	// ------------------------- 리뷰 상세 페이지 ---------------------------------

	@RequestMapping(value="/reviewDetailPage.do")
	public String reviewDetailPage(ReviewVO reviewVO, ReviewHashtagVO reviewHashtagVO, ImageVO imageVO, Model model) {

		//** 해당 리뷰 존재 안함 ---> 유효성 추가 필요 */
		reviewVO.setReviewSearch("리뷰상세");
		reviewVO = reviewService.selectOne(reviewVO);
		System.out.println("로그: reviewDetailAction: " + reviewVO);

		if (reviewVO != null) {
			// 리뷰 해시태그 selectAll
			reviewHashtagVO.setItemNum(reviewVO.getReviewNum());
			reviewHashtagVO.setHashTagSearchCondition("후기번호검색");
			reviewVO.setReviewHashtags(reviewHashtagService.selectAll(reviewHashtagVO));

			// 리뷰 이미지 selectAll
			imageVO.setTeaReviewNum(reviewVO.getReviewNum());
			reviewVO.setReviewImages(imageService.selectAll(imageVO));

			model.addAttribute("reviewData", reviewVO);
		}
		System.out.println(reviewVO);
		return "reviewDetail.jsp";
	}

	// ------------------------- 리뷰 작성 페이지 ---------------------------------

	@RequestMapping(value="/insertReviewPage.do")
	public String insertReviewsPage(ReviewVO reviewVO, BuyDetailVO buyDetailVO, TeaVO teaVO, HttpSession session, Model model) {

		reviewVO.setMemberId((String)session.getAttribute("sessionMemberId"));

		buyDetailVO.setBuySearch("주문상세");
		buyDetailVO = buyDetailService.selectOne(buyDetailVO);
		teaVO.setTeaNum(buyDetailVO.getTeaNum());

		//** 해당 상품 존재 안함 ---> 유효성 추가 필요 */
		teaVO = teaService.selectOne(teaVO);
		model.addAttribute("reviewData", reviewVO);
		model.addAttribute("teaData", teaVO);
		model.addAttribute("buyDetailData", buyDetailVO);

		System.out.println("InsertReviewsPageAction buySerial 로그 buyDetailVO: " + buyDetailVO);
		System.out.println("InsertReviewsPageAction buySerial 로그 teaVO: " + teaVO);
		System.out.println("InsertReviewsPageAction buySerial 로그 buyDetailVO.getBuySerial(): " + buyDetailVO.getBuySerial());
		System.out.println("InsertReviewsPageAction buySerial 로그 reviewVO: " + reviewVO);

		return "insertReview.jsp";
	}

	@RequestMapping(value="/insertReview.do")
	public String insertReviews(ReviewVO reviewVO, ReviewHashtagVO reviewHashtagVO, HashtagDetailVO hashtagDetailVO, ImageVO imageVO, HttpSession session, Model model) {

		reviewVO.setMemberId((String)session.getAttribute("sessionMemberId"));

		//** 후기 작성 실패시 ---> 유효성 추가 필요 */
		if (reviewService.insert(reviewVO)) { // 후기내용 삽입
			AlertVO sweetAlertVO = new AlertVO("후기작성", "후기작성완료!", null, "success", "reviewListPage.do?searchName=ALL");
			model.addAttribute("sweetAlert", sweetAlertVO);
		}

		reviewVO.setReviewSearch("리뷰확인");
		int reviewNum = reviewService.selectOne(reviewVO).getReviewNum(); // 삽입해 생긴 리뷰번호
		reviewHashtagVO.setItemNum(reviewNum); // reviewHashtagVO에 리뷰번호 set 

		imageVO.setTeaReviewNum(reviewNum);
		for (int i = 0; i < reviewVO.getReviewImage().length; i++) {
			String imageUrl = reviewVO.getReviewImage()[i];
			System.out.println(imageUrl);
			imageVO.setImageUrl(imageUrl);
			imageVO.setImageDivision(i + 1);
			imageService.insert(imageVO);
		}

		for (int i = 0; i < reviewVO.getReviewHashtag().length; i++) { // 리뷰해시태그 길이만큼 for문 돌림
			String content = reviewVO.getReviewHashtag()[i]; // content 변수에 해시태그값 저장
			reviewHashtagVO.setReviewHashtagContent(content); // reviewHashtagVO에 content 값 저장

			System.out.println("로그: 해시태그[" + i + "]: " + content);

			// 새로운 해시태그 값이면 추가
			if (reviewHashtagService.selectOne(reviewHashtagVO) == null) {
				reviewHashtagService.insert(reviewHashtagVO);
			}

			reviewHashtagVO = reviewHashtagService.selectOne(reviewHashtagVO);

			// 해시태그 상세 추가
			hashtagDetailVO.setItemNum(reviewNum);
			hashtagDetailVO.setHashtagNum(reviewHashtagVO.getReviewHashtagNum());
			hashtagDetailService.insert(hashtagDetailVO);
		}

		return "alertTrue.jsp";
	}

	// ------------------------- 리뷰 수정 페이지 ---------------------------------

	@RequestMapping(value="/updateReview.do")
	public String updateReviews(ReviewVO reviewVO, HashtagDetailVO hashtagDetailVO, ReviewHashtagVO reviewHashtagVO, ImageVO imageVO, Model model) {
		//** 후기 수정 실패시 ---> 유효성 추가 필요 */
		System.out.println("로그 updateReview.do reviewVO: " +reviewVO);
		int reviewNum = reviewVO.getReviewNum(); // 리뷰번호
		reviewHashtagVO.setItemNum(reviewNum); // reviewHashtagVO에 리뷰번호 set
		hashtagDetailVO.setItemNum(reviewNum); // hashtagDetailVO에 리뷰번호 set
		imageVO.setImageNum(reviewNum); // imageVO에 리뷰번호 set

		reviewService.update(reviewVO); // 리뷰 내용 업데이트
		hashtagDetailService.delete(hashtagDetailVO); // hashtagDetail 삭제

		reviewVO.setReviewSearch("리뷰상세");

		// 리뷰 해시태그 업데이트
		if(reviewVO.getReviewHashtag() != null) { // 수정된 해시태그값이 존재하면
			for(int i = 0; i < reviewVO.getReviewHashtag().length; i++) {  // 리뷰해시태그 길이만큼 for문 돌림

				String content = reviewVO.getReviewHashtag()[i]; // content 변수에 해시태그값 저장
				reviewHashtagVO.setReviewHashtagContent(content); // reviewHashtagVO에 content 값 저장

				System.out.println("로그: 해시태그 ["+ i +"]: "+ content);

				// 새로운 해시태그 값이면 추가
				if(reviewHashtagService.selectOne(reviewHashtagVO) == null) {
					reviewHashtagService.insert(reviewHashtagVO);
				}

				reviewHashtagVO = reviewHashtagService.selectOne(reviewHashtagVO);

				// 해시태그 상세 추가
				hashtagDetailVO.setItemNum(reviewNum);
				hashtagDetailVO.setHashtagNum(reviewHashtagVO.getReviewHashtagNum());
				hashtagDetailService.insert(hashtagDetailVO);
			}
			// 후기수정페이지에 해시태그 기능 나오면 확인해야함
			reviewHashtagVO.setHashTagSearchCondition("후기번호검색");
			List<ReviewHashtagVO> reviewHashtags = reviewHashtagService.selectAll(reviewHashtagVO);
			model.addAttribute("reviewHashtags", reviewHashtags);
		}

		///** 리뷰 이미지 업데이트 ---> 유효성 추가 필요 */
		if(imageService.delete(imageVO)) {
			for (int i = 0; i < reviewVO.getReviewImage().length; i++) {
				String imageUrl = reviewVO.getReviewImage()[i];
				System.out.println(imageUrl);
				imageVO.setImageUrl(imageUrl);
				imageVO.setImageDivision(i + 1);
				imageService.insert(imageVO);
			}
		}

		model.addAttribute("reviewData", reviewService.selectOne(reviewVO));
		return "reviewDetailPage.do";
	}

	@RequestMapping(value="/updateReviewPage.do")
	public String updateReviewsPage(ReviewVO reviewVO, ReviewHashtagVO reviewHashtagVO, ImageVO imageVO, Model model) {
		//** 해당 후기 없을시 ---> 유효성 추가 필요 */
		reviewVO.setReviewSearch("리뷰상세");
		reviewVO = reviewService.selectOne(reviewVO);
		System.out.println("로그: UrpAction: " + reviewVO); // 로그 줄임말 실화?

		if (reviewVO != null) {
			// 리뷰 해시태그 selectAll
			reviewHashtagVO.setItemNum(reviewVO.getReviewNum());
			reviewHashtagVO.setHashTagSearchCondition("후기번호검색");
			reviewVO.setReviewHashtags(reviewHashtagService.selectAll(reviewHashtagVO));

			// 리뷰 이미지 selectAll
			imageVO.setTeaReviewNum(reviewVO.getReviewNum());
			reviewVO.setReviewImages(imageService.selectAll(imageVO));
			model.addAttribute("reviewData", reviewVO);
		}
		System.out.println(reviewVO);
		return "updateReview.jsp";
	}

	// ------------------------- 리뷰 삭제 페이지 ---------------------------------

	@RequestMapping(value="/deleteReviewPage.do")
	public String deleteReviewsPage(ReviewVO reviewVO, Model model) {

		// int reviewNum = Integer.parseInt(request.getParameter("reviewNum")); 

		AlertVO sweetAlertVO = new AlertVO("후기삭제", "후기를 삭제하시겠습니까?", null, "question", "deleteReview.do?reviewNum=" + reviewVO.getReviewNum());
		model.addAttribute("sweetAlert", sweetAlertVO);

		return "alertChoose.jsp";
	}

	@RequestMapping(value="/deleteReview.do")
	public String deleteReviews(ReviewVO reviewVO, HashtagDetailVO hashtagDetailVO, ImageVO imageVO, HttpSession session, Model model) {

		reviewVO.setMemberId((String)session.getAttribute("sessionMemberId"));

		if(reviewService.delete(reviewVO)) {
			AlertVO sweetAlertVO = new AlertVO("후기삭제", "후기 삭제 성공!", null, "success", "myReviewsListPage.do?searchName=MEMBER");
			model.addAttribute("sweetAlert", sweetAlertVO);

			// reviewDetail 삭제
			hashtagDetailVO.setItemNum(reviewVO.getReviewNum());
			hashtagDetailService.delete(hashtagDetailVO);

			// 리뷰 이미지 삭제
			imageVO.setTeaReviewNum(reviewVO.getReviewNum());
			imageService.delete(imageVO);
		}

		return "alertTrue.jsp";
	}

	// ------------------------- 내 후기 페이지 ---------------------------------

	@RequestMapping(value="/myReviewsListPage.do")
	public String myReviewListPage(ReviewVO reviewVO, ReviewHashtagVO reviewHashtagVO, HttpSession session, PagingVO pagingVO, Model model) {

		int pageSize = 5;
		String memberId = (String)session.getAttribute("sessionMemberId");
		System.out.println("마이페이지 리뷰 로그1 memberId " + memberId);
		pagingVO.toString();

		reviewVO.setMemberId(memberId);
		String searchName = pagingVO.getSearchName();
		String reviewSearch = pagingVO.getReviewSearch();

		reviewVO.setSearchName(searchName == null ? "" : searchName);
		reviewVO.setReviewSearch(reviewSearch == null ? "" : reviewSearch);

		List<ReviewVO> reviewDatasTotal = reviewService.selectAll(reviewVO); // 총 리뷰 개수
		pagingVO.setTotalCnt(reviewDatasTotal.size());
		pagingVO.setCurrentPageStr(pagingVO.getPage());
		pagingVO.setPageSize(pageSize);

		// 페이지네이션 모듈화
		pagingVO = Paging.paging(pagingVO);
		System.out.println("마이페이지 리뷰 로그2 reviewDatasTotal " + reviewDatasTotal);

		pagingVO.setSearchName(searchName);
		pagingVO.setReviewSearch(reviewSearch);
		pagingVO.setMemberId(memberId);

		model.addAttribute("page", pagingVO);

		reviewVO.setSearchName(searchName + "_PAGING");

		reviewVO.setStartRnum(pagingVO.getStartRnum());
		reviewVO.setEndRnum(pagingVO.getEndRnum());
		System.out.println(reviewVO);
		List<ReviewVO> reviewDatas = reviewService.selectAll(reviewVO); // startRnum 부터 endRnum 까지의 리뷰

		// 내 후기 해시태그 뽑아서 배열에 저장
		for (ReviewVO reviewData : reviewDatas) {
			reviewHashtagVO.setItemNum(reviewData.getReviewNum()); // 내 후기별 reviewNum set 해줌
			reviewHashtagVO.setHashTagSearchCondition("후기번호검색");
			reviewData.setReviewHashtags(reviewHashtagService.selectAll(reviewHashtagVO)); // 각 리뷰별 해시태그값들 set
		}

		System.out.println("마이페이지 리뷰 로그3 reviewDatas " + reviewDatas);
		System.out.println("마이페이지 리뷰 로그4 memberId " + memberId);
		model.addAttribute("reviewDatas", reviewDatas);

		return "reviewList.jsp";
	}

}
