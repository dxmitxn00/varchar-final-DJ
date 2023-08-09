package com.varchar.view.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MapPageAction{

	@RequestMapping(value="/mapPage.do")
	public String mapPage(){
		
		return "redirect:map.jsp";
	}
	
}
