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
<title>Sales Report</title>
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
				String seller_id = request.getParameter("seller_id");
				List<SalesRecord> salesReportList = DbQuery
						.getAllSalesReportForSeller(seller_id);
				SalesRecord salesReport;
			%>

			<%
				if (null != salesReportList && salesReportList.size() > 0)
				{
					%>
					
					<tr style="color: blue;">
				<td>Product</td>
				<td>Date</td>
				<td>Product id</td>
				<td>Product name</td>
				<td>Buyer</td>
				<td>Category</td>
				<td>Unit price</td>
				<td>Quantity</td>
				<td>Total</td>
			</tr>
			<tr><td colspan="9"><hr /></td></tr>
					
					<%
					
					for (int i = 0; i < salesReportList.size(); i++)
					{
						salesReport = salesReportList.get(i);
						Integer price = DbQuery.getProductPriceFromId(
								salesReport.getProduct_id() + "");
			%>
			
			<tr>
				<td><a
					href="/kamaz_web_commerce_platform/ProductDetailsServlet?product_id=<%=salesReport.getProduct_id()%>"><img
						height="50"
						src='/kamaz_web_commerce_platform/images/<%=DbQuery.getProductImageFromId(
							salesReport.getProduct_id() + "")%>'></img></a></td>
				<td><%=salesReport.getDate_time()%></td>
				<td><%=salesReport.getProduct_id()%></td>
				<td><%=DbQuery.getProductNameFromId(
							salesReport.getProduct_id())%></td>
				<td><a
					href="/kamaz_web_commerce_platform/displayAnUser.jsp?user_id=<%=salesReport.getBuyer_id()%>"><%=DbQuery.getUserAvatarnameFromId(
							salesReport.getBuyer_id())%></a></td>
				<td><%=DbQuery.getProductCodeFromId(
							salesReport.getProduct_id())%></td>
				<td><%=price%></td>
				<td><%=salesReport.getQuantity()%></td>
				<td><%=price * salesReport.getQuantity()%></td>
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