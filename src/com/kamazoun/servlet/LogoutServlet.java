package com.kamazoun.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException
	{
		javax.servlet.http.HttpSession session = request.getSession();

		session.setAttribute("isLoggedIn", null);
		session.setAttribute("user_login_type", null);
		session.setAttribute("user_login_id", null);
		session.setAttribute("user_login_name", null);
		response.sendRedirect("/kamaz_web_commerce_platform/Home.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException
	{
		// TODO Auto-generated method stub

		javax.servlet.http.HttpSession session = request.getSession();

		session.setAttribute("isLoggedIn", null);
		session.setAttribute("user_login_type", null);
		session.setAttribute("user_login_id", null);
		session.setAttribute("user_login_name", null);
		response.sendRedirect("Home.jsp");
	}

}
