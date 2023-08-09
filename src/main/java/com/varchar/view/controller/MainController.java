package com.varchar.view.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController{

	// 오시는 길 페이지
	@RequestMapping(value="/main.do")
	public String main(){
		return "redirect:main.jsp";
	}
	
}