<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="java.util.*"%>
<%@page import="com.kamazoun.model.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Media</title>
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
<%
		String seller_id = request.getParameter("seller_id");
	%>
	<div id="container">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</div>
	<div
		style="position: relative; left: 50px; top: 150px; background-color: white; color: blue">
		<%
			List<String> imageList = DbQuery.getAllProductsImages();
		%>

		<p style="position: relative; left: 350px; font: italic small-caps bold 17px georgia; color: blue">Products Images--feel free to download--:</p>
		
		<br />
		<%
			if (null != imageList && !imageList.isEmpty())
			{
		%>
		<table>
			<tr>
				<%
					for (int i = 0, k = 1; i < imageList.size(); i++, k++)
						{
				%>
				<td><img height="200" src='images/<%= imageList.get(i) %>'></img></td>

				<%
					if (k % 4 == 0)
							{
				%>
			</tr>
			<%
				}
					}
			%>
		</table>
		<%
			}
			else
			{
		%>
		<div
			style="position: absolute; left: 400px; top: 250px; background-color: white; color: blue">
			<p>No image to display</p>
		</div>
		<%
}
%>
	</div>

</body>
</html>