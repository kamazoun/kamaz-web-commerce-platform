package com.kamazoun.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.model.Session;
import com.kamazoun.service.DbInsert;
import com.kamazoun.service.DbQuery;

/**
 * Servlet implementation class BuyProductsServlet
 */
@WebServlet("/BuyProductsServlet")
public class BuyProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		javax.servlet.http.HttpSession session = request.getSession();
		
		if(null == session.getAttribute("current_session"))
		{
			Session currentSession = new Session();
			currentSession.setDate(System.currentTimeMillis()/1000);
			session.setAttribute("current_session", currentSession);
			DbInsert.insertSession(currentSession);
		}
		
		double totalPrice = Double.parseDouble(request.getParameter("total_price"));
		request.setAttribute("totalPrice", totalPrice);
		String isLoggedIn = (String)session.getAttribute("isLoggedIn");
		System.out.println(isLoggedIn);
		if(null == isLoggedIn || !isLoggedIn.equals("true"))
		{
			RequestDispatcher rd = request.getRequestDispatcher("/buy.jsp");
			rd.forward(request, response);
		}
		else if(isLoggedIn.equals("true"))
		{
			double amount = DbQuery.getUserAmountFromId(Integer.parseInt((String)session.getAttribute("user_login_id")));
			request.setAttribute("user_amount", amount);
			if(amount >= totalPrice)
			{
				request.setAttribute("isAmountSufficient", "true");
				RequestDispatcher rd = request.getRequestDispatcher("/users/userBuy.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("isAmountSufficient", "false");
				RequestDispatcher rd = request.getRequestDispatcher("/users/userBuy.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
