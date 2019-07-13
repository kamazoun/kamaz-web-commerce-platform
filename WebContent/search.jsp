<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.kamazoun.model.*"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Search results</title>
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

<div style="position:relative;left:0px;top:5px;background-color:white;">
<p align="center" style="font:italic small-caps bold 25px georgia;color:blue">Exact match results:</p>

<br />
<%
	List<Product> exactProductList = (List<Product>)request.getAttribute("exactProductResults");
if(null == exactProductList || exactProductList.size() == 0)
{
	out.print("<p style=\"font:italic small-caps bold 15px georgia;color:red\">An exact match could not be found</p>");
}
else
{
	%><ul><li><table width="100%" border="0" cellspacing="5" cellpadding="5"><%
	for(int i = 0, k = 1; i < exactProductList.size(); i++, k++)
	{
		%>
		<td>
		<table>
		<tr>
		<td align="center"><%= exactProductList.get(i).getProduct_code() %></td>
		</tr>
		<tr>
		<td align="center"><%= exactProductList.get(i).getProduct_name() %></td>
		</tr>
		<tr>
		<td>
		<a href="/kamaz_web_commerce_platform/ProductDetailsServlet?product_id=<%= exactProductList.get(i).getProduct_id() %>"><img src='images/<%= exactProductList.get(i).getImg() %>'></img></a>
		</td>
		</tr>
		<tr>
		<td align="center">$<%= exactProductList.get(i).getPrice() %></td>
		</tr>
		<tr>
		<td align="center">
		<form action="/kamaz_web_commerce_platform/AddToCartServlet" method="post">
		Quantity : <input type="text" name="quantity" value='1' size='3'/><br />
        <input type="hidden" name="product_id" value="<%= exactProductList.get(i).getProduct_id() %>"/>
        <input type="submit" value="Add to Cart"/>
		</form>
		<%-- <a href="/AddToCartServlet?product_id=<%= exactProductList.get(i).getProduct_id() %>">Add to cart</a> --%>
		</td>
		</tr>
		</table>
		</td>
		<%
		if(k % 5 == 0)
		{
		%> </tr> <%
		}
	}
	%></table><% 
}	
%>
</li>
</ul>
<br />
</div>


<%-- <div style="left:0px;top:50px;background-color:white;">
<hr />
<p align="center" style="font:italic small-caps bold 25px georgia;color:blue">Additional fuzzy match results:</p>
<br />
<br />
<%
	List<Product> fuzzyProductList = (List<Product>)request.getAttribute("fuzzyProductResults");
if(null == fuzzyProductList || fuzzyProductList.size() == 0)
{
	//out.print("<p style=\"font:italic small-caps bold 15px georgia;color:red\">An fuzzy match could not be found</p>");
}
else
{
	%><ul><li><table width="100%" border="0" cellspacing="5" cellpadding="5"><%
	for(int i = 0, k = 1; i < fuzzyProductList.size(); i++, k++)
	{
		%>
		<td>
		<table>
		<tr>
		<td align="center"><%= fuzzyProductList.get(i).getProduct_code() %></td>
		</tr>
		<tr>
		<td align="center"><%= fuzzyProductList.get(i).getProduct_name() %></td>
		</tr>
		<tr>
		<td>
		<a href="/kamaz_web_commerce_platform/ProductDetailsServlet?product_id=<%= fuzzyProductList.get(i).getProduct_id() %>"><img src='images/<%= fuzzyProductList.get(i).getImg() %>'></img></a>
		</td>
		</tr>
		<tr>
		<td align="center">$<%= fuzzyProductList.get(i).getPrice() %></td>
		</tr>
		<tr>
		<td align="center">
		<form action="/kamaz_web_commerce_platform/AddToCartServlet" method="post">
		Quantity : <input type="text" name="quantity" value='1' size='3'/><br />
        <input type="hidden" name="product_id" value="<%= fuzzyProductList.get(i).getProduct_id() %>"/>
        <input type="submit" value="Add to Cart"/>
		</form>
		<a href="/AddToCartServlet?product_id=<%= fuzzyProductList.get(i).getProduct_id() %>">Add to cart</a>
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
</div> --%>

</div>

</body>
</html>