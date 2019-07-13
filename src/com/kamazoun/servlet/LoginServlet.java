package com.kamazoun.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kamazoun.service.DbQuery;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet
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
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at:
		// ").append(request.getContextPath());

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
		String user_name = request.getParameter("j_username");
		String user_password = request.getParameter("j_password");
		
		if (DbQuery.getPasswordOf(user_name)
				.equalsIgnoreCase(user_password))
		{
			switch (DbQuery.getUserRole(user_name))
			{
				case "administrator":
					session.setAttribute("isLoggedIn", "true");
					session.setAttribute("user_login_type",
							"administrator");
					session.setAttribute("user_login_id",
							DbQuery.getUserIdFromUserName(user_name));
					break;

				case "seller":
					session.setAttribute("isLoggedIn", "true");
					session.setAttribute("user_login_type", "seller");
					session.setAttribute("user_login_id",
							DbQuery.getUserIdFromUserName(user_name));
					break;

				case "buyer":
					session.setAttribute("isLoggedIn", "true");
					session.setAttribute("user_login_type", "buyer");
					session.setAttribute("user_login_id",
							DbQuery.getUserIdFromUserName(user_name));
					break;

				default:
					session.setAttribute("isLoggedIn", "false");
					session.setAttribute("user_login_type", "unknow");
					session.setAttribute("user_login_id",
							DbQuery.getUserIdFromUserName(user_name));
					break;
			}
			/*
			 * PrintWriter out = response.getWriter();
			 * out.print(request.getUserPrincipal().getName());
			 * out.println(request.getRemoteUser());
			 * out.println(request.getRemoteHost());
			 */

			session.setAttribute("user_login_name", user_name);
		}
		response.sendRedirect("Home.jsp");
		/*
		 * RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		 * rd.forward(request, response);
		 */
	}

}
