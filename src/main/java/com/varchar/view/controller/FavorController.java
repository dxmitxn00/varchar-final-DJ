package com.varchar.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.varchar.biz.favor.FavorService;
import com.varchar.biz.favor.FavorVO;

@Controller
public class FavorController {
	
	@Autowired
	private FavorService favorService;

	// --------------------------------- 찜 페이지 이동 ---------------------------------

	@RequestMapping(value = "/favorPage.do")
	public String favorPage(HttpSession session, FavorVO favorVO, Model model) {
		
		//** 해당 회원 NULL 혹은 로그인 안함 ---> 유효성 추가 필요 */
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		System.out.println("favorCon : " + favorVO.getMemberId());
		
		List<FavorVO> favorDatas = favorService.selectAll(favorVO);
		model.addAttribute("favorDatas", favorDatas);
		
		System.out.println("FavorPageAction favorVO.getMemberId  로그: " + favorVO.getMemberId());
		System.out.println("FavorPageAction favorDatas 로그: " + favorDatas);
		
		return "favor.jsp";
	}
	
	// --------------------------------- 찜 등록(추가) ---------------------------------
	
	@ResponseBody
	@RequestMapping(value = "/insertFavor.do")
	public String InsertFavorAction(HttpSession session, FavorVO favorVO){

		
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		if (favorService.insert(favorVO)) {
			return "1";
		} 
		
		return "0";
	}
	
	// --------------------------------- 찜 취소(삭제) ---------------------------------
	@ResponseBody
	@RequestMapping(value = "/deleteFavor.do")
	public String DeleteFavorAction(HttpSession session, FavorVO favorVO){
		
		
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		if (favorService.delete(favorVO)) {
			return "1";
		}
		
		return "0";
	}
	
	// --------------------------------- 찜 확인 ---------------------------------
	// 현재 사용하지 않는 액션
	@ResponseBody
	@RequestMapping(value = "/checkFavor.do")
	public String CheckFavorAction(HttpSession session, FavorVO favorVO){
		int fresult = 1;
		
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		if (favorService.selectOne(favorVO) != null) {
			fresult = 0;
			return "deleteFavor.do";
		}
		
		return "실패하면 어디로?";
	}

}
