package com.kamazoun.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.model.Product;
import com.kamazoun.service.DbQuery;

/**
 * Servlet implementation class GetSellerProductsServlet
 */
@WebServlet("/GetSellerProductsServlet")
public class GetSellerProductsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSellerProductsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int seller_id = Integer.parseInt(request.getParameter("seller_id"));
		
		List<Product> allSellerProducts = DbQuery.getAllProductsFromSeller(seller_id);
		
		request.setAttribute("allSellerProducts", allSellerProducts);
		
		RequestDispatcher rd = request.getRequestDispatcher("/sellers/allSellerProducts.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
