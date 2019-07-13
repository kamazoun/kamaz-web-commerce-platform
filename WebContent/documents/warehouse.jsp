<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="java.util.*"%>
<%@page import="com.kamazoun.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Warehouse</title>
</head>
<body>
<h1 align="center">WAREHOUSE</h1>
<table cellspacing="10" cellpadding="20" align='center'">
<tr>
<td>Sale order number</td>
<td>Client id</td>
<td>Decision</td>
</tr>
<%
List<SalesOrders> sOList = DbQuery.getAllSalesOrders();
SalesOrders sO;
for(int i = 0; i < sOList.size(); i++)
{
	
	sO = (SalesOrders)sOList.get(i);
	out.print("<tr> <td>" + sO.getSalesorder_id() + "</td> <td> " + sO.getClient_id() + "</td>");
	%>
	<td><a href="/kamaz_web_commerce_platform/InventoryManagement?sO_id=<%= sO.getSalesorder_id()%>">Proceed</a></td> </tr>
	<%
}
%>
</table>
</body>
</html>