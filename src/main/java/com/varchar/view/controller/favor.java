package com.varchar.view.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.FavorDAO;
import model.FavorVO;

/**
 * Servlet implementation class favor
 */
@WebServlet("/favor.do")
public class favor extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public favor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("favor.do 로그");
		System.out.println("ajax 로그 : "+request.getParameter("fresult"));

	      PrintWriter out=response.getWriter();

	      FavorDAO fDAO = new FavorDAO();
	      FavorVO fVO = new FavorVO();
	      
	      HttpSession session = request.getSession();
	      String memberId = (String) session.getAttribute("ssMemberId");
	      
	      System.out.println("favor.do 서블릿 memberId 로그 : " +memberId);
	      System.out.println("favor.do 서블릿 teaNum 로그 : " +request.getParameter("teaNum"));
	      
	      if(memberId != null) {
	    	  fVO.setMemberId(memberId);
	    	  fVO.setTeaNum(Integer.parseInt(request.getParameter("teaNum")));
	    	  
	    	  if(request.getParameter("fresult").equals("0")){
	    		  fDAO.insert(fVO);
	    		  out.print(1);
	    	  }
	    	  else if(request.getParameter("fresult").equals("1")) {
	    		  fDAO.delete(fVO);
	    		  out.print(0);
	    	  }
	    	  // 상품 목록(teaList.jsp)에서 찜 눌렀을때 찜 확인
	    	  else if(request.getParameter("fresult").equals("2")) {
	    		  // 찜 있을 경우
	    		  System.out.println("favor.do selectOne 로그: "+fDAO.selectOne(fVO));
	    		  if(fDAO.selectOne(fVO)!=null) { 
	    			  fDAO.delete(fVO);
	    			  out.print(0);
	    		  }
	    		  // 찜 없을 경우
	    		  else {
	    			  fDAO.insert(fVO);
		    		  out.print(1);
	    		  }
	    	  }
	      }
	      else {
	    	  
	      }
	      
	      

	}

}
