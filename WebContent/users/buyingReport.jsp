<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="com.kamazoun.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Buying Report</title>
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

	<div
		style="position: relative; left: 00px; top: 100px; background-color: white;">
		<table width="100%">
			

			<%
				String buyer_id = request.getParameter("user_id");
				List<SalesRecord> buyingReportList = DbQuery
						.getAllBuyingReportForUser(buyer_id);
				SalesRecord buyingReport;
			%>

			<%
				if (null != buyingReportList && buyingReportList.size()>0)
				{
					%>
					<tr style="color: blue;">
				<td>Product</td>
				<td>Date</td>
				<td>Product id</td>
				<td>Product name</td>
				<td>Seller</td>
				<td>Category</td>
				<td>Unit price</td>
				<td>Quantity</td>
				<td>Total</td>
			</tr>
			<tr><td colspan="9"><hr /></td></tr>
					<%
					
					for (int i = 0; i < buyingReportList.size(); i++)
					{
						buyingReport = buyingReportList.get(i);
						Integer price = DbQuery.getProductPriceFromId(
								buyingReport.getProduct_id() + "");
			%>
			
			
			<tr>
				<td><a
					href="/kamaz_web_commerce_platform/ProductDetailsServlet?product_id=<%=buyingReport.getProduct_id()%>"><img
						height="50"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getProductImageFromId(
							buyingReport.getProduct_id() + "")%>'></img></a></td>
				<td><%=buyingReport.getDate_time()%></td>
				<td><%=buyingReport.getProduct_id()%></td>
				<td><%=DbQuery.getProductNameFromId(
							buyingReport.getProduct_id())%></td>
				<td><a
					href="/kamaz_web_commerce_platform/displayAnUser.jsp?user_id=<%=buyingReport.getSeller_id()%>"><%=DbQuery.getUserAvatarnameFromId(
							buyingReport.getSeller_id())%></a></td>
				<td><%=DbQuery.getProductCodeFromId(
							buyingReport.getProduct_id())%></td>
				<td><%=price%></td>
				<td><%=buyingReport.getQuantity()%></td>
				<td><%=price * buyingReport.getQuantity()%></td>
			</tr>
			<%
				}
				}
				else
				{
					out.print("<tr><td><span style='position: relative; left: 500px; top: 100px;'>No records to display</span></td></tr>");

				}
			%>
		</table>
	</div>
</body>
</html>