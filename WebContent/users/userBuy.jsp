<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbInsert"%>
<%@page import="com.kamazoun.service.purchasing.Purchase"%>
<%@page import="com.kamazoun.service.sales.Sale"%>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="com.kamazoun.service.DbUpdate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.kamazoun.model.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Buying</title>
<style>
ul{ list-style-type: none; margin:0; padding
}
ul li{
float:left;
width:10%;
height:100px;
}
</style>
</head>

<body>
<div id="container">
	<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<div align="center" style="position:relative;left:0px;top:50px;background-color:white;">

<% String isAmountSufficient = (String) request.getAttribute("isAmountSufficient");
double user_amount = (double)request.getAttribute("user_amount");
double totalPrice = (double)request.getAttribute("totalPrice");
String address = DbQuery.getUserAddressFromId(Integer.parseInt((String)session.getAttribute("user_login_id")));
if(isAmountSufficient.equals("true"))
{
	new Sale((List<ProductItem>)session.getAttribute("cart"));
	new Purchase((List<ProductItem>)session.getAttribute("cart"));
	
	
	DbUpdate.reduceUserAmountOf(Integer.parseInt((String)session.getAttribute("user_login_id")), totalPrice);
	
	DbInsert.addSalesRecord((List<ProductItem>)session.getAttribute("cart"), Integer.parseInt((String)session.getAttribute("user_login_id")), "REGISTERED USER");
	
	%><br />
	<p style="font:italic small-caps bold 15px georgia;">Your order has been processed, thank you</p>
	<br /><p>The information below:</p><br />
	<table border="0" cellspacing="5" cellpadding="5">
	<tr>
	<td>Name</td>
	<td style="font:italic small-caps bold 15px georgia;"><%= DbQuery.getUserFirstnameFromId(Integer.parseInt((String)session.getAttribute("user_login_id"))) %> <%= DbQuery.getUserGivennameFromId(Integer.parseInt((String)session.getAttribute("user_login_id"))) %></td>
	</tr>
	<tr>
	<td>Address</td>
	<td style="font:italic small-caps bold 15px georgia;"><%= address %></td>
	</tr>
	<tr>
	<td>Total price</td>
	<td style="font:italic small-caps bold 15px georgia;">$<%= totalPrice %></td>
	</tr>
	<tr>
	<td>Remaining amount in the account</td>
	<td style="font:italic small-caps bold 15px georgia;">$<%= DbQuery.getUserAmountFromId(Integer.parseInt((String)session.getAttribute("user_login_id"))) %></td>
	</tr>
	</table>
	<%
}
else
{
	%>
	<div align="center">
	<p>Your account does not contain enough money for this purchase.</p>
	<p>Please Choose the link below to enter different bank information for this purchase</p>
	<p style="font:italic small-caps bold 25px georgia;"><a href="/kamaz_web_commerce_platform/buy.jsp">Use a bank card</a></p>
	<br /><br />
	<p>Or return to your cart to remove some items.</p>
	</div>
	<%
}
	
%>
</div>
</body>
</html>