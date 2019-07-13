package com.kamazoun.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kamazoun.model.User;
import com.kamazoun.service.DbQuery;

/**
 * Servlet implementation class GetUsersServlet
 */
@WebServlet("/GetUsersServlet")
public class GetUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		/*Ici il faut que j ajoute une methode pour verifier si il y a le credential necessaire pour afficher tous les utilisateurs, i.e. managers. Sellers slmt ces clients*/
		//c est vrai que c est ds le dossier admin dc pourquoi accessible via un simple user?
		List<User> allUsers = DbQuery.getAllUsers();
		
		//System.out.println("Number of users in list: " + allUsers.size());
		
		request.setAttribute("allUsers", allUsers);
		
		/*HttpSession session = request.getSession();
		
		session.setAttribute("allUsersForDisplay", allUsers);*/
		
		RequestDispatcher rd = request.getRequestDispatcher("/administrators/showAllUsers.jsp");//le container ne verifie pas le credential qd envoye a partir du servlet, il va falloir le faire moi meme
		rd.forward(request, response);
	
		//la chose a faire est simple envoye ca d abord vers un jsp sous /admin puis de la vers le servlet
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
