package com.kamazoun.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.model.Cart;
import com.kamazoun.model.ProductItem;
import com.kamazoun.service.DbQuery;
import com.kamazoun.service.EventNotification;

/**
 * Servlet implementation class BuyServlet
 */
@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		javax.servlet.http.HttpSession session = request.getSession();
		
		String product_id = request.getParameter("product_id");
		String quantity = request.getParameter("quantity");
		
		ProductItem productItem = DbQuery.getProductItemFromProduct(Integer.parseInt(product_id), Integer.parseInt(quantity));

		List<ProductItem> cart = null;
		if(null == session.getAttribute("cart"))
		{
			cart = new ArrayList<ProductItem>();
		}
		else
		{
			cart = (List<ProductItem>)session.getAttribute("cart");
		}

		if(null != productItem)
			Cart.insertIntoCart(cart, productItem);
		else
			EventNotification.notifyProductQuantityUnsufficient();//Normally should not happen because user cannot order more than quantity available

		session.setAttribute("cart", cart);
		response.sendRedirect("Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
