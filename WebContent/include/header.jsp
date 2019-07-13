<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<style>
ol {
	list-style: none;
}

.olLink a {
	color: blue;
}

.olLink li {
	padding: 5px;
	float: left;
}

ul {
	list-style: none;
}

.ulLink li {
	padding: 0px;
	float: right;
}

/* Dropdown Button */
.dropbtn {
	color: blue;
	padding: 5px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn:hover, .dropbtn:focus {
	background-color: gray;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: blue;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Dropdown Button */
.dropbtn2 {
	color: blue;
	padding: 5px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn2:hover, .dropbtn2:focus {
	background-color: gray;
}

/* The container <div> - needed to position the dropdown content */
.dropdown2 {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content2 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content2 a {
	color: blue;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content2 a:hover {
	background-color: #f1f1f1
}



/* Dropdown Button */
.dropbtn3 {
	color: blue;
	padding: 5px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn3:hover, .dropbtn3:focus {
	background-color: gray;
}

/* The container <div> - needed to position the dropdown content */
.dropdown3 {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content3 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content3 a {
	color: blue;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content3 a:hover {
	background-color: #f1f1f1
}




/* Dropdown Button */
.dropbtn4 {
	color: blue;
	padding: 5px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn4:hover, .dropbtn4:focus {
	background-color: gray;
}

/* The container <div> - needed to position the dropdown content */
.dropdown4 {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content4 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content4 a {
	color: blue;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content4 a:hover {
	background-color: #f1f1f1
}


/* Dropdown Button */
.dropbtn5 {
	color: blue;
	padding: 5px;
	font-size: 16px;
	border: none;
	cursor: pointer;
}

/* Dropdown button on hover & focus */
.dropbtn5:hover, .dropbtn5:focus {
	background-color: gray;
}

/* The container <div> - needed to position the dropdown content */
.dropdown5 {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content5 {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content5 a {
	color: blue;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content5 a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu (use JS to add this class to the .dropdown-content container when the user clicks on the dropdown button) */
.show {
	display: block;
}
</style>
<%
	response.setIntHeader("Refresh", 5);
	String isLoggedIn = (String) session.getAttribute("isLoggedIn");
	String user_type = (String) session.getAttribute("user_login_type");
%>

<div id="header">
	<div
		style="top: 0px; left: 0px; width: 350px; height: 30px; float: left">
		<a style="text-decoration: none;"
			href="/kamaz_web_commerce_platform/Home.jsp"><span
			style="position: relative; left: 17px; top: 0px; font: italic bold 50px georgia; color: blue;">kamazoun
				Inc.</span></a> <span
			style="position: relative; left: 0px; top: 30px; font: italic small-caps bold 25px georgia; color: blue;">Online
			Shopping</span>
	</div>

</div>
<!-- entete superieure: login & sign in -->
<div style="direction: rtl; position: relative; left: -17px; top: 0px;">
	<ul class="ulLink">
		<%
			if (null == isLoggedIn || !isLoggedIn.equals("true")) {
				out.print("<li><a href='/kamaz_web_commerce_platform/signup.jsp'>signup</a></li>");
				out.print("<li><a href='/kamaz_web_commerce_platform/users/login.jsp'>login</a></li>");
			} else {
				String user_id = DbQuery.getUserIdFromUserName((String) session.getAttribute("user_login_name"));
				/* out.print(
						"<li><a href='/kamaz_web_commerce_platform/users/userProfile.jsp' style='font:italic small-caps bold 15px georgia;'>"
								+ (String) session.getAttribute(
										"user_login_name")
								+ "</a></li>");
				out.print(
						"<li><a href='/kamaz_web_commerce_platform/users/logout.jsp'>log out</a></li>"); */
		%>
		<li><div class="dropdown2" style="text-decoration: underline;">
				<a onclick="myFunction2()" class="dropbtn2"><%=session.getAttribute("user_login_name")%></a>
				<div id="myDropdown2" class="dropdown-content2">
					<a href='/kamaz_web_commerce_platform/users/userProfile.jsp'
						style='font: italic small-caps bold 15px;'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="User photo" border="0" /><%=session.getAttribute("user_login_name")%>'
						profile</a> <a href='/kamaz_web_commerce_platform/users/logout.jsp'>log
						out</a>
				</div>
			</div></li>
		<%
			}
		%>
		<li style="color:blue;">
			<%
				Calendar calendar = new GregorianCalendar();
				String am_pm;
				int hour = calendar.get(Calendar.HOUR_OF_DAY);
				int minute = calendar.get(Calendar.MINUTE);
				String CT = hour + ":" + minute;
				//out.println("Current Time is: " + CT + "\n");
			%> <%=CT%>
		</li>
	</ul>
</div>

<div
	style="margin-top: 0px; position: absolute; margin-left: 400px; color: blue;">
	<ol class="olLink">
		<li><a href="/kamaz_web_commerce_platform/Home.jsp">Home</a></li>
		<li><a href="/kamaz_web_commerce_platform/cart.jsp">Cart</a></li>
		<li><a href="/kamaz_web_commerce_platform/buy.jsp">Buy</a></li>
		<li><form
				action="/kamaz_web_commerce_platform/SearchProductServlet"
				method="post">
				<input type="text" name="searchTag" /> <input type="image"
					src="/kamaz_web_commerce_platform/images/search_icon.png"
					alt="Search"
					style="max-width: 100px; height: 11px; border: 1px solid blue; padding: 0px; margin: 0px;" />
			</form></li>

		<%
			if (null != isLoggedIn && isLoggedIn.equals("true") && null != user_type && !user_type.isEmpty()) {
				String user_id = DbQuery.getUserIdFromUserName((String) session.getAttribute("user_login_name"));
				if (user_type.equalsIgnoreCase("administrator")) {
		%>
		<li>
			<div class="dropdown" style="text-decoration: underline;">
				<a onclick="myFunction()" class="dropbtn">Administrator</a>
				<div id="myDropdown" class="dropdown-content">
					<a href='/kamaz_web_commerce_platform/users/userProfile.jsp'
						style='font: italic small-caps bold 11px georgia;'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="User photo" border="0" /><%=session.getAttribute("user_login_name")%>
						profile</a> <a style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/processDeleteUser.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/delete_user.jpg'
						alt="delete user icon"></img>Delete account</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/profilesphotos2.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="user image icon"></img>Change profile photo</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/buyingReport.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/user_buying_report.jpg'
						alt="buying report icon"></img>Buying report</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/sendMessage.jsp?receiver_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/send_message.jpg'
						alt="message icon"></img>Send message</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/checkMessagesReceived.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/messages_received.jpg'
						alt="read messages received icon"></img>Messages received</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/checkMessagesSent.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/messages_sent.jpg'
						alt="read messages sent icon"></img>Messages sent</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/sellers/requestSellerProducts.jsp?seller_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/seller_products.png'
						alt="seller products icon"></img>My shop'products</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/pickImage.jsp?seller_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/add_product.jpg'
						alt="add products icon"></img>Add products to my shop</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/sellers/salesReport.jsp?seller_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/sales_report.jpg'
						alt="sales reports icon"></img>Sales report</a> <a style='font: italic small-caps bold 11px georgia;'
						href="/kamaz_web_commerce_platform/administrators/requestAllUsers.jsp"><img height="25" align="left"
						src='/kamaz_web_commerce_platform/images/all_users.jpg'
						alt="all users icon"></img>All users</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/administrators/addUser.jsp'><img height="25" align="left"
						src='/kamaz_web_commerce_platform/images/add_user.jpg'
						alt="add user icon"></img>Register a new user</a>
				</div>
			</div>
		</li>
		<%
			} else if (user_type.equalsIgnoreCase("seller")) {
		%>
		<li>
			<div class="dropdown" style="text-decoration: underline;">
				<a onclick="myFunction()" class="dropbtn">Seller</a>
				<div id="myDropdown" class="dropdown-content">
					<a href='/kamaz_web_commerce_platform/users/userProfile.jsp'
						style='font: italic small-caps bold 11px georgia;'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="User photo" border="0" /><%=session.getAttribute("user_login_name")%>
						profile</a> <a style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/processDeleteUser.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/delete_user.jpg'
						alt="delete user icon"></img>Delete account</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/profilesphotos2.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="user image icon"></img>Change profile photo</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/buyingReport.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/user_buying_report.jpg'
						alt="buying report icon"></img>Buying report</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/sendMessage.jsp?receiver_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/send_message.jpg'
						alt="message icon"></img>Send message</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/checkMessagesReceived.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/messages_received.jpg'
						alt="read messages received icon"></img>Messages received</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/checkMessagesSent.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/messages_sent.jpg'
						alt="read messages sent icon"></img>Messages sent</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/sellers/requestSellerProducts.jsp?seller_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/seller_products.png'
						alt="seller products icon"></img>My shop'products</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/pickImage.jsp?seller_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/add_product.jpg'
						alt="add products icon"></img>Add products to my shop</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/sellers/salesReport.jsp?seller_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/sales_report.jpg'
						alt="sales reports icon"></img>Sales report</a>
				</div>
			</div>
		</li>
		<%
			} else if (user_type.equalsIgnoreCase("buyer")) {
		%>
		<li>
			<div class="dropdown" style="text-decoration: underline;">
				<a onclick="myFunction()" class="dropbtn">Buyer</a>
				<div id="myDropdown" class="dropdown-content">
					<a href='/kamaz_web_commerce_platform/users/userProfile.jsp'
						style='font: italic small-caps bold 11px georgia;'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="User photo" border="0" /><%=session.getAttribute("user_login_name")%>
						profile</a> <a style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/processDeleteUser.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/delete_user.jpg'
						alt="delete user icon"></img>Delete account</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/profilesphotos2.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(Integer.parseInt(user_id))%>'
						alt="user image icon"></img>Change profile photo</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/buyingReport.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/user_buying_report.jpg'
						alt="buying report icon"></img>Buying report</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/sendMessage.jsp?receiver_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/send_message.jpg'
						alt="message icon"></img>Send message</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/checkMessagesReceived.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/messages_received.jpg'
						alt="read messages received icon"></img>Messages received</a> <a
						style='font: italic small-caps bold 11px georgia;'
						href='/kamaz_web_commerce_platform/users/checkMessagesSent.jsp?user_id=<%=user_id%>'><img
						height="25" align="left"
						src='/kamaz_web_commerce_platform/images/messages_sent.jpg'
						alt="read messages sent icon"></img>Messages sent</a>
				</div>
			</div>

		</li>
		<%
			}
			}
		%>

		<li>
			<div class="dropdown5" style="text-decoration: underline;">
				<a onclick="myFunction5()" class="dropbtn5">Technical Elements</a>
				<div id="myDropdown5" class="dropdown-content5">
					<a href="/kamaz_web_commerce_platform/graph.jsp">Charts</a>
					<a href="/kamaz_web_commerce_platform/mainPurchases.jsp">Purchases</a>
					<a href="/kamaz_web_commerce_platform/mainSales.jsp">Sales</a>
					  <a href="/kamaz_web_commerce_platform/bestSeller.jsp">Best seller</a> <a href="/kamaz_web_commerce_platform/bestBuyer.jsp">Best
						buyer</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown4" style="text-decoration: underline;">
				<a onclick="myFunction4()" class="dropbtn4">Extra</a>
				<div id="myDropdown4" class="dropdown-content4">
					 <a href="/kamaz_web_commerce_platform/mailDevelopers.jsp">Send a word to
						administrators</a>
						<a href="/kamaz_web_commerce_platform/multimedia.jsp">Media</a>
				</div>
			</div>
		</li>
		<li>
			<div class="dropdown3" style="text-decoration: underline;">
				<a onclick="myFunction3()" class="dropbtn3">Help</a>
				<div id="myDropdown3" class="dropdown-content3">
					<a
						href="/kamaz_web_commerce_platform/help.jsp">Help</a>
					 <a
						href="/kamaz_web_commerce_platform/contactUs.jsp">Contact us</a>
				</div>
			</div>
		</li>
	</ol>
</div>

<script>
	/* When the user clicks on the button, 
	 toggle between hiding and showing the dropdown content */
	function myFunction() {
		document.getElementById("myDropdown").classList.toggle("show");
	}

	function myFunction2() {
		document.getElementById("myDropdown2").classList.toggle("show");
	}

	function myFunction3() {
		document.getElementById("myDropdown3").classList.toggle("show");
	}

	function myFunction4() {
		document.getElementById("myDropdown4").classList.toggle("show");
	}

	function myFunction5() {
		document.getElementById("myDropdown5").classList.toggle("show");
	}

	// Close the dropdown menu if the user clicks outside of it
	window.onclick = function(event) {
		if(!event.target.matches('.dropbtn'))
			{
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
			}
		
		if(!event.target.matches('.dropbtn2'))
		{
			var dropdowns2 = document.getElementsByClassName("dropdown-content2");
			var i;
			for (i = 0; i < dropdowns2.length; i++) {
				var openDropdown2 = dropdowns2[i];
				if (openDropdown2.classList.contains('show')) {
					openDropdown2.classList.remove('show');
				}
			}
		}
		
		
		if(!event.target.matches('.dropbtn3'))
		{
			var dropdowns3 = document.getElementsByClassName("dropdown-content3");
			var i;
			for (i = 0; i < dropdowns3.length; i++) {
				var openDropdown3 = dropdowns3[i];
				if (openDropdown3.classList.contains('show')) {
					openDropdown3.classList.remove('show');
				}
			}
		}
		
		
		if(!event.target.matches('.dropbtn4'))
		{
			var dropdowns4 = document.getElementsByClassName("dropdown-content4");
			var i;
			for (i = 0; i < dropdowns4.length; i++) {
				var openDropdown4 = dropdowns4[i];
				if (openDropdown4.classList.contains('show')) {
					openDropdown4.classList.remove('show');
				}
			}
		}
		
		
		if(!event.target.matches('.dropbtn5'))
		{
			var dropdowns5 = document.getElementsByClassName("dropdown-content5");
			var i;
			for (i = 0; i < dropdowns5.length; i++) {
				var openDropdown5 = dropdowns5[i];
				if (openDropdown5.classList.contains('show')) {
					openDropdown5.classList.remove('show');
				}
			}
		}
		
	}
	
	
</script>
