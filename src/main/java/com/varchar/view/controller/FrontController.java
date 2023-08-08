package com.varchar.view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlertVO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public FrontController() {
        super();
    }
    
    private void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1. Client가 보낸 요청을 추출
    	String uri = request.getRequestURI();
    	System.out.println("uri : " + uri);
    	String cp = request.getContextPath();
    	System.out.println("cp : " + cp);
    	String command = uri.substring(cp.length());
    	System.out.println("commnad : " + command);
    	
    	// 2. 추출한 요청에 맞는 Action클래스의 execute() 메서드를 호출
    	ActionForward forward = null;
    	
    	// 메인페이지
    	if (command.equals("/main.do")) {
    		forward = new MainAction().execute(request, response);
    	}
    	// 로그인 페이지
    	
    	// 로그인
    	
    	// 로그아웃 페이지
    	
    	// 로그아웃
    	
    	// 회원가입 페이지
    	
    	// 회원가입
    	
    	// 회원정보 수정 페이지
    	
    	// 회원정보 수정
    	
    	// 비밀번호 변경 페이지
    	
    	// 비밀번호 변경
    	
    	// 장바구니 페이지
    	else if (command.equals("/cartPage.do")) {
    		forward = new CartPageAction().execute(request, response);    		
    	}
    	// 장바구니 다시담기 페이지
    	else if (command.equals("/cartRetry.do")) {
    		forward = new CartRetryAction().execute(request, response);    		
    	}
    	// 장바구니 추가
    	else if (command.equals("/insertCart.do")) {
    		forward = new InsertCartAction().execute(request, response);    		
    	}
    	// 장바구니 삭제
    	else if (command.equals("/deleteCart.do")) {
    		forward = new DeleteCartAction().execute(request, response);    		
    	}
    	// 차 목록 페이지
    	
    	// 차 상세 페이지
    	
    	// 주문내역 페이지
    	
    	// 주문내역 상세 페이지
    	
    	// 주문 페이지
    	
    	// 주문
    	
    	// 내 후기 목록 페이지
    	else if (command.equals("/myReviewsListPage.do")) {
    		forward = new MyReviewListPageAction().execute(request, response);
    	}
    	// 후기 목록 페이지
    	
    	// 후기 상세 페이지
    	
    	// 후기 작성 페이지
    	
    	// 후기 수정 페이지
    	
    	// 후기 작성
    	
    	// 후기 수정
    	    	
    	// 후기 삭제 페이지
    	
    	// 후기 삭제

    	// 찜 목록 페이지
    	else if (command.equals("/favorPage.do")) {
    		forward = new FavorPageAction().execute(request, response);    		
    	}
    	// 찜 추가
    	else if (command.equals("/insertFavor.do")) {
    		forward = new InsertFavorAction().execute(request, response);    		
    	}
    	// 찜 삭제
    	else if (command.equals("/deleteFavor.do")) {
    		forward = new DeleteFavorAction().execute(request, response);    		
    	}
    	// 오시는 길 페이지
    	else if (command.equals("/mapPage.do")) {
    		forward = new MapPageAction().execute(request, response);    		
    	}
    	// 결제 성공
    	
    	// 3. 사용자에게 응답. View로 이동
    	if (forward != null) {
    		if (forward.isRedirect()) {
    			response.sendRedirect(forward.getPath());
    		}
    		else {
    			RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
    			dispatcher.forward(request, response);
    		}    		
    	}
    	else {
    		AlertVO saVO = new AlertVO("error", "error", "error", "error", null);
    		request.setAttribute("sa", saVO);
    		request.getRequestDispatcher("alertFalse.jsp").forward(request, response);    		
    	}
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);	
	}

}
