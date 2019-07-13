package com.kamazoun.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.model.ProductItem;
import com.kamazoun.service.warehouse.Warehouse;
import com.kamazoun.service.DbUpdate;

/**
 * Servlet implementation class InventoryManagement
 */
@WebServlet("/InventoryManagement")
public class InventoryManagement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InventoryManagement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		javax.servlet.http.HttpSession session = request.getSession();
		Warehouse.reduceQuantity(Integer.parseInt(request.getParameter("sO_id")));
		
		List<ProductItem> cart = null;
		if(null == session.getAttribute("cart"))
		{
			cart = new ArrayList<ProductItem>();
		}
		else
		{
			cart = (List<ProductItem>)session.getAttribute("cart");
			for(int i = 0 ; i < cart.size(); i++)
			{
				DbUpdate.reduceProductQuantity(cart.get(i).getProduct_id(), cart.get(i).getQuantity());
			}
			
		}
		
		response.sendRedirect("/kamaz_web_commerce_platform/BanqueProcessServlet");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
