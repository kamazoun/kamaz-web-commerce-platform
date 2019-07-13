<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbUpdate"%>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Details</title>
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
<% DbUpdate.IncreaseProductSight(Integer.parseInt((String)request.getAttribute("product_id"))); %>

<jsp:useBean id="productDetails" class="com.kamazoun.model.Product" scope="request"></jsp:useBean>
<table width="400" border="0" align="center" cellpadding="5" cellspacing="5" style="font:italic small-caps bold 17px georgia;color:blue">
<tr>
<td align="center" style="font:italic small-caps bold 25px georgia;color:blue">&nbsp;<jsp:getProperty property="product_name" name="productDetails"/></td>
</tr>
<tr align="center">
<td rowspan="2">&nbsp;<img src='images/<jsp:getProperty property="img" name="productDetails"/>' /></td>
</tr>
<tr>
<td align="center" style="font:italic small-caps bold 25px georgia;color:blue">&nbsp;</td>
</tr>
<tr align="center">
<td align="center">&nbsp;$<jsp:getProperty property="price" name="productDetails"/></td>
</tr>
<tr align="center">
<td align="center" colspan="2">&nbsp;<jsp:getProperty property="details" name="productDetails"/></td>
</tr>

<tr align="center">
<td align="center">&nbsp;Quantity available: <jsp:getProperty property="quantity_available" name="productDetails"/></td>
</tr>
<tr align="center">
<td align="center">&nbsp;Seller name: <%= DbQuery.getUserNameFromId(productDetails.getSeller_id()) %></td>
</tr>
<tr align="center">
<td align="center">&nbsp;Number of views: <jsp:getProperty property="sight" name="productDetails"/></td>
</tr>
</table>
</div>
</body>
</html>