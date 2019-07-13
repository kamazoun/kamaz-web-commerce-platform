<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="com.kamazoun.model.*"%>
<%@page import="com.kamazoun.dao.*"%>
<%@page import="com.kamazoun.service.DbInsert"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Thank you</title>
</head>
<body>

<div id="container">
	<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<jsp:useBean id="newClient" class="com.kamazoun.model.Client" scope="request">
<jsp:setProperty name="newClient" property="*"/>
</jsp:useBean>

<%
DbInsert.insertClient(newClient); 
session.setAttribute("client", newClient);
SalesOrders sO = new SalesOrders();
Session ss = (com.kamazoun.model.Session)session.getAttribute("current_session");
sO.setSession_id(ss.getSession_id());
sO.setClient_id(MySQLUtil.queryMaxNo("client", "client_id"));
DbInsert.insertSalesOrder(sO);
session.setAttribute("SO", sO);
List<ProductItem> cart = null;
if(null != session.getAttribute("cart"))
{
	cart = (List<ProductItem>)session.getAttribute("cart");
	
	for(int i = 0; i  < cart.size(); i++)
	{
		ProductItem item = (ProductItem)cart.get(i);
		int product_id = item.getProduct_id();
		SalesOrdersItems sOI = new SalesOrdersItems();
		sOI.setProduct_id(product_id);
		sOI.setSalesorder_id(sO.getSalesorder_id());
		DbInsert.insertSalesOrdersItems(sOI);
	}
	
	DbInsert.addSalesRecord(cart, MySQLUtil.queryMaxNo("client", "client_id"), "UNREGISTERED CLIENT");//la il y a erreur logique puisque l'id d un client peut etre le meme que celui d'un buyer enregistre et on ne saura pas si l achat a ete fait par un buyer ou par un client non enregistre
	//donc j ai ajoute 1000000 a l id d un client pour faire la difference
	//plus besoin de faire ca: le field details va contenir 'UNREGISTERED CLIENT' comme reference
}
%>

<div align="center" style="position:relative;left:0px;top:150px;background-color:white;">
<h1>Your payment has been processed! Thank you for using our service</h1>
<p align="center">The details beyond:</p>
<br />
<br />
<table align="center" cellspacing="10" cellpadding="10" border="0">
<tr>
<td>Name</td>
<td><%= newClient.getFirst_name() + " " + request.getParameter("given_name") %></td>
</tr>
<tr>
<td>Shipping Address</td>
<td><%= request.getParameter("address") %></td>
</tr>
<tr>
<td>Card number</td>
<td><%= request.getParameter("card") %></td>
</tr>
<tr>
<td>Card type</td>
<td><%= request.getParameter("type") %></td>
</tr>
<tr>
<td>Total price: </td>
<td>$<%= session.getAttribute("cartTotal") %></td>
</tr>
</table>
</div>
</body>
</html>