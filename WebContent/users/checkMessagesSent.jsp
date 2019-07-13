<?xml version="1.0" encoding="ISO-8859-1" ?>
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
<title>Messages sent</title>
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
	
	
<div style="position:relative;left:0px;top:200px;">

	<%
	String user_id = request.getParameter("user_id");
	List<Notification> receivedMessages = DbQuery.getAllMessagesReceivedByUser(user_id);
	List<Notification> sentMessages = DbQuery.getAllMessagesSentByUser(user_id);
	String messageLinkColor = "black";
	%>
	
	<table width="100%">
	<tr>
	<td align="center" colspan="3">
	<span style="color:blue;"><big>Messages Sent (the messages not read yet by your recipients are blue)</big></span>
	</td>
	</tr>
	<tr><td> </td></tr>
	<tr><td> </td></tr>
	<tr><td> </td></tr>
	<tr><td> </td></tr>
	<tr style="color:blue;">
	<td width="50%">Time</td>
	<td width="20%">To</td>
	<td width="30%">Title</td>
	</tr>
	<tr><td> </td></tr>
	<tr><td colspan="3"><hr /></td></tr>
	<%for(int i = 0; i < sentMessages.size(); i++)
	{
		if(sentMessages.get(i).getSeen().equalsIgnoreCase("true"))
		{
			messageLinkColor = "red";
		}
		else
		{
			messageLinkColor = "blue";
		}

	%>
	<tr>
	<td style="color: <%= messageLinkColor %>;"><%= sentMessages.get(i).getTime()%></td>
	<td style="color: <%= messageLinkColor %>;"><%= DbQuery.getUserAvatarnameFromId(sentMessages.get(i).getReceiver_id()) %></td>
	<td><a href="seeMessage.jsp?message_id=<%=sentMessages.get(i).getNotification_id()%>"><span style="color: <%= messageLinkColor %>;"><%= sentMessages.get(i).getDetails()%></span></a></td>
	</tr>
	<%
	}
	%>
	</table>

</div>
</body>
</html>