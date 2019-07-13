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
		Integer user_id = Integer.parseInt(
				(String) (session.getAttribute("user_login_id")));
		String user_type = (String) session
				.getAttribute("user_login_type");
	%>

	<!-- details de l'utilisateur -->
	<div
		style="position: relative; left: -250px; top: 100px; background-color: white;">

		<table align="center" cellpadding="10" cellspacing="0" border="0"
			width="300" height="250">
			<tr>
				<td rowspan="6"><a
					href='/kamaz_web_commerce_platform/users/profilesphotos2.jsp?user_id=<%=user_id%>'><img
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
				<td><span style="color: blue;"><%=session.getAttribute("user_login_type")%></span></td>
				<td></td>
			</tr>
			<tr>
				<td>User name</td>
				<td><span style="color: blue;"><%=session.getAttribute("user_login_name")%></span></td>
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

		<a
			href='/kamaz_web_commerce_platform/users/profilesphotos.jsp?user_id=<%=user_id%>'></a>

	</div>

	<!-- premier paneau d'icones -->
	<div
		style="position: absolute; left: 650px; top: 250px; background-color: white;">
		<table>
			<tr>
				<!-- supprime l'utilisateur -->
				<td align="center"><a
					style='font: italic small-caps bold 15px georgia;'
					href='/kamaz_web_commerce_platform/users/processDeleteUser.jsp?user_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/delete_user.jpg'
						alt="delete user icon" height="100"></img></a></td>
			</tr>
			<tr>
				<!-- change la photo de profil de l'utilisateur -->
				<td align="center"><a
					style='font: italic small-caps bold 15px georgia;'
					href='/kamaz_web_commerce_platform/users/profilesphotos2.jsp?user_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(user_id)%>'
						alt="user image icon" height="100"></img></a></td>
			</tr>
			<tr>
				<!-- produit le buying report de l'utilisateur -->
				<td align="center"><a
					style='font: italic small-caps bold 15px georgia;'
					href='/kamaz_web_commerce_platform/users/buyingReport.jsp?user_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/user_buying_report.jpg'
						alt="buying report icon" height="100"></img></a></td>
			</tr>
		</table>
	</div>

	<!-- deuxieme paneau d'icones -->
	<div
		style="position: absolute; left: 800px; top: 250px; background-color: white;">

		<table>

			<tr>
				<!-- envoye un message a un utilisateur -->
				<td align="center"><a
					style='font: italic small-caps bold 15px georgia;'
					href='/kamaz_web_commerce_platform/users/sendMessage.jsp?receiver_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/send_message.jpg'
						alt="message icon" height="100"></img></a></td>
			</tr>
			<tr>
				<!-- verifie les messages recus -->
				<td align="center"><a
					style='font: italic small-caps bold 15px georgia;'
					href='/kamaz_web_commerce_platform/users/checkMessagesReceived.jsp?user_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/messages_sent.jpg'
						alt="read messages received icon" height="100"></img></a></td>
			</tr>
			<tr>
				<!-- verifie les messages envoyes -->
				<td align="center"><a
					style='font: italic small-caps bold 15px georgia;'
					href='/kamaz_web_commerce_platform/users/checkMessagesSent.jsp?user_id=<%=user_id%>'><img
						src='/kamaz_web_commerce_platform/images/messages_received.jpg'
						alt="read messages sent icon" height="100"></img></a></td>
			</tr>
		</table>
	</div>

	<!-- troisieme paneau d'icones -->
	<div
		style="position: absolute; left: 950px; top: 250px; background-color: white;">
		<table>
			<tr>
				<%
					if (user_type.equals("administrator")
							|| user_type.equals("seller"))
					{
				%>
				<!-- montre les produits du vendeur -->
				<tr>
					<td align="center"><a
						style='font: italic small-caps bold 15px georgia;'
						href='/kamaz_web_commerce_platform/sellers/requestSellerProducts.jsp?seller_id=<%=user_id%>'><img
							src='/kamaz_web_commerce_platform/images/seller_products.png'
							alt="seller products icon" height="100"></img></a></td>
				</tr>

				<!-- ajoute des produits au magasin du vendeur -->
				<tr>
					<td align="center"><a
						style='font: italic small-caps bold 15px georgia;'
						href='/kamaz_web_commerce_platform/pickImage.jsp?seller_id=<%=user_id%>'><img
							src='/kamaz_web_commerce_platform/images/add_product.jpg'
							alt="add products icon" height="100"></img></a></td>
				</tr>

				<!-- produit le sales report pour le seller -->
				<tr>
					<td align="center"><a
						style='font: italic small-caps bold 15px georgia;'
						href='/kamaz_web_commerce_platform/sellers/salesReport.jsp?seller_id=<%=user_id%>'><img
							src='/kamaz_web_commerce_platform/images/sales_report.jpg'
							alt="sales reports icon" height="100"></img></a></td>
				</tr>
				<%
				}
			%>
			</tr>
		</table>
	</div>
</body>
</html>