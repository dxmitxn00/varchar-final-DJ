package com.varchar.view.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController{

	// --------------------------------- 메인 페이지 이동 ---------------------------------
	@RequestMapping(value="/main.do")
	public String main(){
		System.out.println("1111");
		return "redirect:main.jsp";
	}
	
	// --------------------------------- 픽업 장소 페이지 이동 ---------------------------------
	@RequestMapping(value="/mapPage.do")
	public String mapPage(){
		return "redirect:map.jsp";
	}
	
}