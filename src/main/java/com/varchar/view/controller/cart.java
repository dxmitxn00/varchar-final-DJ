package com.varchar.view.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.TeaVO;

/**
 * Servlet implementation class cart
 */
@WebServlet("/cart.do")
public class cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public cart() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		String cartAction = request.getParameter("cartAction");
		
		System.out.println("로그 cartAction: ["+cartAction+"]");
		
		if (cartAction.equals("0")) {
			int teaNum = Integer.parseInt(request.getParameter("teaNum"));
			ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");

			System.out.println("로그 teaNum: ["+request.getParameter("teaNum")+"]");
			
			int i = 0;
			for (TeaVO t : cart) {
				if (t.getTeaNum() == teaNum) {
					cart.remove(i);
					System.out.println(i+" 삭제됨");
					break;
				}
				i++;
			}

			session.setAttribute("cart", cart);
			System.out.println(0);
		}
		else if(cartAction.equals("1")) {
			int teaNum = Integer.parseInt(request.getParameter("teaNum"));
			int teaCnt = Integer.parseInt(request.getParameter("teaCnt"));
			ArrayList<TeaVO> cart = (ArrayList<TeaVO>) session.getAttribute("cart");
			
			System.out.println("로그 teaNum: ["+request.getParameter("teaNum")+"]");
			System.out.println("로그 teaCnt: ["+request.getParameter("teaCnt")+"]");

			int i = 0;
			for (TeaVO t : cart) {
				if (t.getTeaNum() == teaNum) {
					
					cart.get(i).setTeaCnt(teaCnt);
					System.out.println(i+" 재고 변경됨");
					break;
				}
				i++;
			}

			session.setAttribute("cart", cart);
			System.out.println(0);
			
		}
		else if(cartAction.equals("2")) {
			session.removeAttribute("cart");
			
			System.out.println("카트 비워짐");
			System.out.println(0);
			
		}

	}

}
