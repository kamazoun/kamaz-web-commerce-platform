<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbUpdate"%>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@page import="com.kamazoun.model.Notification"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Read message</title>
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
	
	<%
	String notification_id = request.getParameter("message_id");
	
	Notification message = DbQuery.retrieveNotification(notification_id);
	%>
	<% String answer = (message.getSeen().equalsIgnoreCase("true"))?"Yes":"No"; %>
	
	<%if(null != message) 
	{
	%>
	
	<div style="position:relative;left:250px;top:200px;">
	<table width="600">
	<tr>
	<td style="color: blue;">Send by: <%=DbQuery.getUserFirstnameFromId(message.getSender_id())%> <%=DbQuery.getUserGivennameFromId(message.getSender_id())%></td>
	</tr>
	<tr>
	<td style="color: blue;">Received by: <%=DbQuery.getUserFirstnameFromId(message.getReceiver_id())%> <%=DbQuery.getUserGivennameFromId(message.getReceiver_id())%></td>
	</tr>
	<tr>
	<td style="color: blue;">At: <%=message.getTime()%></td>
	</tr>
	<tr>
	<td style="color: blue;">Already read: <%= answer %></td>
	</tr>
	<tr><td></td></tr><tr><td></td></tr><tr><td></td></tr><tr><td></td></tr>
	<tr>
	<td style="color: blue;"><%= message.getDetails() %></td>
	</tr>
	<tr>
	<td><hr></hr></td>
	</tr>
	<tr>
	<td><%= message.getMessage() %></td>
	</tr>
	</table>
	
	<%} 
	DbUpdate.checkMessageAsSeen(message.getNotification_id() + "");
	%>
</div>


</body>
</html>