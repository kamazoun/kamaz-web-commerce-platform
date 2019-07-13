<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DataVolumes"%>
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
<title>Best buyer</title>
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

<div style="position:relative;left:300px;top:100px;">

<% 
	BuyersPurchases buyerId = DataVolumes.getBestBuyer(); 
%>

<%
if(null != buyerId)
{
		Integer user_id = Integer.parseInt(buyerId.getBuyer_id());
		String img = DbQuery.getUserImageFromId(user_id);
		if(null == img || img.isEmpty())
		{
			img = "users/default.jpg";
		}
		String avatar = DbQuery.getUserAvatarnameFromId(user_id);
		if(null == avatar || avatar.isEmpty())
		{
			avatar = "unregistered client";
		}
		
		String name = DbQuery.getUserFirstnameFromId(user_id) + " " + DbQuery.getUserGivennameFromId(user_id);
		if(null == name || name.isEmpty() || name.equalsIgnoreCase("null null"))
		{
			name = "Unknown";
		}
		
		String phone = DbQuery.getUserPhoneFromId(user_id);
		if(null == phone || phone.isEmpty())
		{
			phone = "Unknown";
		}
		
		
		%>
		<table>
		<tr>
		<td>
		<table>
		<tr>
		<td rowspan="4"><a href="/kamaz_web_commerce_platform/displayAnUser.jsp?user_id=<%=user_id%>"><img src='/kamaz_web_commerce_platform/images/<%=img%>'alt="User photo" border="0" /></a></td>
		<td>
		User: <%=avatar%>
		</td>
		</tr>
		<tr>
		<td>
		Name: <%= name %>
		</td>
		</tr>
		<tr>
		<td>
		Contact: <%= phone %>
		</td>
		</tr>
		<tr>
		<td>
		Quantity of items purchased: <%= buyerId.getQuantity() %>
		</td>
		</tr>
		</table>
		</td>
		</tr>
		<tr><td><hr /></td></tr>
		<%
	}
	%>
	</table>

</div>

</body>
</html>