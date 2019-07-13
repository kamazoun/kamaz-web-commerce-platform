package com.kamazoun.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.model.ProductItem;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet("/RemoveFromCartServlet")
public class RemoveFromCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
javax.servlet.http.HttpSession session = request.getSession();
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		
		List<ProductItem> cart = null;
		if(null == session.getAttribute("cart"))//error
		{
			//condition d'erreur: comment supprimer d'un empty cart?
			//cart = new ArrayList<ProductItem>();
		}
		else
		{
			cart = (List<ProductItem>)session.getAttribute("cart");
			
			for(int i = 0; i < cart.size(); i++)
			{
				if(cart.get(i).getProduct_id() == product_id)
				{
					if(cart.get(i).getQuantity() <= quantity)
					{
						cart.remove(i);
					}
					else
					{
						cart.get(i).setQuantity(cart.get(i).getQuantity()-quantity);
					}
					
					break;
				}
			}
		}
		
		session.setAttribute("cart", cart);
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
