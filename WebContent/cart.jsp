<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.kamazoun.model.*"%>
<%@page import="java.util.*"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
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
	<jsp:include page="include/header.jsp"></jsp:include>
</div>

<div style="position:relative;left:0px;top:100px;background-color:white;">

<table>
<tr>
<%
double totalPrice = 0;
List<ProductItem> cart = null;
if(null != session.getAttribute("cart"))
{
	cart = (List<ProductItem>)session.getAttribute("cart");
	
	%><ul><li><table width="100%" cellspacing="5" cellpadding="5"  border="0" ><tr><%
	for(int i = 0, k = 1; i  < cart.size(); i++, k++)
	{
		ProductItem item = (ProductItem)cart.get(i);
		totalPrice += item.getTotalPrice();
		%>
		<td>
		<table align="center">
		<tr align="center">
		<td><%= item.getProduct_code() %></td>
		</tr>
		<tr align="center">
		<td><%= item.getProduct_name() %></td>
		</tr>
		<tr align="center">
		<td>
		<a href="/ProductDetailsServlet?product_id=<%= item.getProduct_id() %>"><img src='images/<%= item.getImg() %>'></img></a>
		</td>
		</tr>
		<tr align="center">
		<td><%= item.getPrice() %></td>
		</tr>
		<tr align="center">
		<td>Quantity: <%= item.getQuantity() %></td>
		</tr>
		<tr align="center">
		<td align="center">
		<form action="/kamaz_web_commerce_platform/RemoveFromCartServlet" method="post">
		Delete : <input type="text" name="quantity" value='1' size="3"/><br />
        <input type="hidden" name="product_id" value="<%= item.getProduct_id() %>"/>
        <input type="submit" value="Delete from Cart"/>
		</form>
		</td>
		</tr>
		</table>
		</td>
		<%
		if(k % 4 == 0)
		{
		%> </tr> <%
		}
	}
	session.setAttribute("cartTotal", totalPrice);
	%>
	</table>
</li>
</ul>
	
<% 
}
%>
</tr>
<table width="100%" cellspacing="25" cellpadding="25"  border="0" ><tr >
<td align="center">Total price : $<%= totalPrice %></td>
</tr>
<tr>
<td align="center">
<a href="/kamaz_web_commerce_platform/BuyProductsServlet?total_price=<%= totalPrice %>"><img src="images/buy_now_icon.jpg" alt="Buy" height="100" width="150"></img></a>
</td>
</tr></table>

</table>

</div>
</body>
</html>