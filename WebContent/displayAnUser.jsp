<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>A user details</title>
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
	<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<% int user_id = Integer.parseInt((String)(request.getParameter("user_id"))); %>

<div style="position:relative;left:0px;top:60px;background-color:white;">
<table align="center" cellpadding="10" cellspacing="0" border="0" width="600" height="250">
<tr>
<td rowspan="6"><img src='/kamaz_web_commerce_platform/images/<%= DbQuery.getUserImageFromId(user_id) %>' alt="User photo" border="0"/></td>
</tr>
<tr>
<td>Name</td>
<td><span style="color:blue;"><%= DbQuery.getUserFirstnameFromId(user_id) %> <%= DbQuery.getUserGivennameFromId(user_id) %></span></td>
<td></td>
</tr>
<tr>
<td>Type</td>
<td><span style="color:blue;"><%= DbQuery.getUserTypeIdFromId(user_id) %></span></td>
<td></td>
</tr>
<tr>
<td>User name</td>
<td><span style="color:blue;"><%= DbQuery.getUserAvatarnameFromId(user_id) %></span></td>
<td></td>
</tr>
<tr>
<td>Phone</td>
<td><span style="color:blue;"><%= DbQuery.getUserPhoneFromId(user_id) %></span></td>
</tr>
<tr>
<td>Address</td>
<td><span style="color:blue;"><%= DbQuery.getUserAddressFromId(user_id) %></span></td>
</tr>
<tr>
<td></td>
<td>Details</td>
<td><span style="color:blue;"><%= DbQuery.getUserDetailsFromId(user_id) %></span></td>
</tr>
</table>
</div>

</body>
</html>