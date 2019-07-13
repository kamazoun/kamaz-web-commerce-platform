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
<title>Contact Us</title>
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

<div style="position:relative;left:400px;top:150px;">

<table>
<tr>
<td><a href="#"><img src="" alt="kamazoun Inc logo"></img></a></td>
</tr>
<tr>
<td>
<img src="" alt="location logo"></img>
Address: Hangzhou, Shima, 257 3rd floor
</td>
</tr>
<tr>
<td>
<img src="" alt="phone logo"></img>
Phone: 155-5801-6526
</td>
</tr>
<tr>
<td>
<img src="" alt="email logo"></img>
<a href="mailto:kamazoun@hotmail.fr?subject=Feedback&body=Message">Send an email</a>
</td>
</tr>
</table>

</div>

</body>
</html>