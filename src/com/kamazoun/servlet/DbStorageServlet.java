package com.kamazoun.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.model.Product;
import com.kamazoun.model.User;
import com.kamazoun.service.DbInsert;

/**
 * Servlet implementation class DbStorageServlet
 */
@WebServlet(description = "takes the data to be inserted into the db and insert them", urlPatterns = { "/DbStorageServlet" })
public class DbStorageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();//il ne devrait pas de writer ds servlet 
		
		String hint = request.getParameter("hint");
		
		if(null==hint || hint.isEmpty())
			out.print("le hint est null");
		else
		switch(hint)
		{
			case "product":
				Product product = (Product) request.getAttribute("newProduct");
				if(null == product)
				{
					out.print("le produit est null");//ds ce cas renvoyer vers errorpage, mettre aussi du javascript ds la page pr eviter ca
				}
				else
				{
					DbInsert.insertProduct(product);
				}
				
				break;
				
			case "userhint"://le hint ne peut pas etre user //user devrait il remplacer seller, manager et buyer?
				User user = (User) request.getAttribute("newUser");
				if(null == user)
				{
					out.print("le user est null");//ds ce cas renvoyer vers errorpage, mettre aussi du javascript ds la page pr eviter ca
				}
				else
				{
					DbInsert.insertUser(user);
				}
				
				break;
				
			default://ds ce cas renvoyer vers errorpage, mettre aussi du javascript ds la page pr eviter ca
				break;
		}
		
		response.sendRedirect("/kamaz_web_commerce_platform/Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
