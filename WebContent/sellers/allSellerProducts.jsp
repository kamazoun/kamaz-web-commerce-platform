<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.kamazoun.model.*"%>
<%@page import="com.kamazoun.service.*"%>
<%-- <%@ page errorPage="/errors/exceptions.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Seller's Products</title>
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



<div style="position:relative;left:0px;top:50px;">
<%
	List<Product> productList = (List<Product>)request.getAttribute("allSellerProducts");
if(null == productList || productList.size() == 0)
{
	out.print("<p align=center style=\"font:italic small-caps bold 15px georgia;color:red\">This seller, currently, has no products on the site</p>");
}
else
{
	%><ul><li><table width="100%" cellspacing="5" cellpadding="5"  border="0" ><tr><%
	for(int i = 0, k = 1; i < productList.size(); i++, k++)
	{
		%>
		<td>
		<table>
		<tr>
		<td align="center"><%= productList.get(i).getProduct_code() %></td>
		</tr>
		<tr>
		<td align="center"><%= productList.get(i).getProduct_name() %></td>
		</tr>
		<tr>
		<td>
		<a href="/kamaz_web_commerce_platform/ProductDetailsServlet?product_id=<%= productList.get(i).getProduct_id() %>"><img height="200" src='/kamaz_web_commerce_platform/images/<%= productList.get(i).getImg() %>'></img></a>
		</td>
		</tr>
		<tr>
		<td align="center">$<%= productList.get(i).getPrice() %></td>
		</tr>
		<tr>
		<td align="center">
		<form action="/kamaz_web_commerce_platform/AddToCartServlet" method="post">
		Quantity : <input type="text" name="quantity" value='1' size='3'/><br />
        <input type="hidden" name="product_id" value="<%= productList.get(i).getProduct_id() %>"/>
        <input type="submit" value="Add to Cart"/>
		</form>
		<%-- <a href="/AddToCartServlet?product_id=<%= productList.get(i).getProduct_id() %>">Add to cart</a> --%>
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
	%></table><% 
}	
%>
</li>
</ul>
</div>



</body>
</html>