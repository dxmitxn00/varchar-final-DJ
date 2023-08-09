package com.varchar.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.varchar.biz.favor.FavorService;
import com.varchar.biz.favor.FavorVO;

@Controller
public class FavorController {
	
	@Autowired
	private FavorService favorService;

	
	@RequestMapping(value = "/favorPage.do")
	public String favorPage(HttpSession session, FavorVO favorVO, Model model) {
		
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		List<FavorVO> favorDatas = favorService.selectAll(favorVO);
		model.addAttribute("favorDatas", favorDatas);
		
		System.out.println("FavorPageAction favorVO.getMemberId  로그: "+favorVO.getMemberId());
		System.out.println("FavorPageAction favorDatas 로그: "+favorDatas);
		
		
		return "favor.jsp";
	}
	
	@RequestMapping(value = "/deleteFavor.do")
	public String DeleteFavorAction(HttpSession session, FavorVO favorVO){

		
		favorVO.setMemberId((String)session.getAttribute("sessionMemberId"));
		
		if (favorService.delete(favorVO)) {

			return "favorPage.do";
		}
		
		return "실패하면 어디로?";
	}

}
