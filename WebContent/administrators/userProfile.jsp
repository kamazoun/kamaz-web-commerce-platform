<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>User profile</title>
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
		Integer user_id = Integer
				.parseInt(request.getParameter("user_id"));

		String type = DbQuery.getUserTypeIdFromId(user_id);
		switch (type)
		{
			case "1":
				type = "administrator";//out.print("administrator");
				break;
			case "2":
				type = "seller";
				break;
			case "3":
				type = "buyer";
				break;
			default:
				break;
		}
	%>

	<div
		style="position: relative; left: 0px; top: 60px; background-color: white;">

		<table align="center" cellpadding="10" cellspacing="0" border="0"
			width="600" height="250">
			<tr>
				<td rowspan="6"><a
					href='/kamaz_web_commerce_platform/users/profilesphotos.jsp?user_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(user_id)%>'
						alt="User photo" border="0" /></a></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><span style="color: blue;"><%=DbQuery.getUserFirstnameFromId(user_id)%>
						<%=DbQuery.getUserGivennameFromId(user_id)%></span></td>
				<td></td>
			</tr>
			<tr>
				<td>Type</td>
				<td><span style="color: blue;"><%=type%></span></td>
				<%-- <td><span style="color:blue;"><%= session.getAttribute("user_login_type") %></span></td> --%>
				<td></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><span style="color: blue;"><%=DbQuery.getUserAvatarnameFromId(user_id)%></span></td>
				<td></td>
			</tr>
			<tr>
				<td>Amount</td>
				<td><span style="color: blue;">$<%=DbQuery.getUserAmountFromId(user_id)%></span></td>
				<td></td>
			</tr>
			<tr>
				<td>Phone</td>
				<td><span style="color: blue;"><%=DbQuery.getUserPhoneFromId(user_id)%></span></td>
			</tr>
			<tr>
				<td></td>
				<td>Address</td>
				<td><span style="color: blue;"><%=DbQuery.getUserAddressFromId(user_id)%></span></td>
			</tr>
			<tr>
				<td></td>
				<td>Details</td>
				<td><span style="color: blue;"><%=DbQuery.getUserDetailsFromId(user_id)%></span></td>
			</tr>
		</table>

	</div>

	<br />
	<br />
	<br />

	<!-- Tableau contenant les icones -->

	<table align="center" cellpadding="10" cellspacing="0" border="0"
		width="600">
		<tr>
		<!-- supprime l'utilisateur -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/administrators/processDeleteUser.jsp?user_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/delete_user.jpg'
					alt="delete user icon" height="100"></img></a></td>
					
				<!-- ajoute un nouvel utilisateur -->	
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/administrators/addUser.jsp'><img
					src='/kamaz_web_commerce_platform/images/add_user.jpg'
					alt="add user icon" height="100"></img></a></td>
			
			<%
				if (type.equals("administrator") || type.equals("seller"))
				{
			%>
			<!-- montre les produits du vendeur -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/sellers/requestSellerProducts.jsp?seller_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/seller_products.png'
					alt="seller products icon" height="100"></img></a></td>
					
					<!-- ajoute des produits au magasin du vendeur -->
					<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/pickImage.jsp?seller_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/add_product.jpg'
					alt="add products icon" height="100"></img></a></td>
			
			<!-- produit le sales report pour le seller -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/sellers/salesReport.jsp?seller_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/sales_report.jpg'
					alt="sales reports icon" height="100"></img></a></td>
			<%
				}

				else if (type.equals("buyer"))
				{
			%>
			
			<%
				}
			%>
			
			<!-- produit le buying report de l'utilisateur -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/users/buyingReport.jsp?user_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/user_buying_report.jpg'
					alt="buying report icon" height="100"></img></a></td>

			<!-- change la photo de profil de l'utilisateur -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/users/profilesphotos.jsp?user_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(user_id)%>'
					alt="user image icon" height="100"></img></a></td>

			<!-- envoye un message a un utilisateur -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/users/sendMessage.jsp?receiver_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/send_message.jpg'
					alt="message icon" height="100"></img></a></td>
					
			<!-- verifie les messages recus -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/users/checkMessagesReceived.jsp?user_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/messages_sent.jpg'
					alt="read messages received icon" height="100"></img></a></td>
					
					
				<!-- verifie les messages envoyes -->
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/users/checkMessagesSent.jsp?user_id=<%=user_id%>'><img
					src='/kamaz_web_commerce_platform/images/messages_received.jpg'
					alt="read messages sent icon" height="100"></img></a></td>
		</tr>
		<%-- <tr>
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/administrators/processDeleteUser.jsp?user_id=<%=user_id%>'>Delete
					User</a></td>
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/administrators/addUser.jsp'>Add
					New User</a></td>

			<%
				if (type.equals("administrator"))
				{
			%>
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/sellers/requestSellerProducts.jsp?seller_id=<%=user_id%>'>Products</a></td>
			<%
				}

				else if (type.equals("seller"))
				{
			%>
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/sellers/requestSellerProducts.jsp?seller_id=<%=user_id%>'>Products</a></td>
			<%
				
			%>
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/sellers/salesReport.jsp'>Sales</a></td>
			<%
				}

				else if (type.equals("buyer"))
				{
			%>
			<td align="center"><a
				style='font: italic small-caps bold 15px georgia;'
				href='/kamaz_web_commerce_platform/administrators/addUser.jsp'>Procurements</a></td>
			<%
				}
			%>

		</tr> --%>
	</table>




</body>
</html>