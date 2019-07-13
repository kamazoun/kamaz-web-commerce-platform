<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>User profile photo</title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding
}

ul li {
	float: left;
	width: 10%;
	height: 100px;
}
</style>
</head>
<body>

	<div id="container">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</div>

	<%
		//Integer user_id = Integer.parseInt((String)(session.getAttribute("user_login_id")));
		String user_id = request.getParameter("user_id");
	%>

	<div
		style="position: relative; left: 0px; top: 60px; background-color: white;">

		<table align="center" cellpadding="10" cellspacing="0" border="0"
			width="600">
			<tr>
				<td><a
					href='changeUserProfilePhoto2.jsp?user_id=<%=user_id%>&img=users/default.jpg'><img
						src='/kamaz_web_commerce_platform/images/users/default.jpg'
						alt="User photo" border="0" /></a></td>

				<td><a
					href='changeUserProfilePhoto2.jsp?user_id=<%=user_id%>&img=users/homme_d_affaire.jpg'><img
						src='/kamaz_web_commerce_platform/images/users/homme_d_affaire.jpg'
						alt="User photo" border="0" /></a></td>
			</tr>
			<tr>
				<td><a
					href='changeUserProfilePhoto2.jsp?user_id=<%=user_id%>&img=users/receptioniste.jpg'><img
						src='/kamaz_web_commerce_platform/images/users/receptioniste.jpg'
						alt="User photo" border="0" /></a></td>

				<td><a
					href='changeUserProfilePhoto2.jsp?user_id=<%=user_id%>&img=users/kamaz.jpg'><img
						src='/kamaz_web_commerce_platform/images/users/kamaz.jpg'
						alt="User photo" border="0" /></a></td>
			</tr>
			<tr>
				<td><a
					href='changeUserProfilePhoto2.jsp?user_id=<%=user_id%>&img=users/utilisatrice.jpg'><img
						src='/kamaz_web_commerce_platform/images/users/utilisatrice.jpg'
						alt="User photo" border="0" /></a></td>

				<td><a
					href='changeUserProfilePhoto2.jsp?user_id=<%=user_id%>&img=users/kamaz.jpg'><img
						src='/kamaz_web_commerce_platform/images/users/kamaz.jpg'
						alt="User photo" border="0" /></a></td>
			</tr>
		</table>
	</div>

</body>
</html>