<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" isErrorPage="true"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Unfortunate Error</title>
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
String exceptionTypeFullName = exception.getClass().getName();
String exceptionTypeName =  exceptionTypeFullName.substring(exceptionTypeFullName.lastIndexOf(".")+1);
String request_uri = (String) request.getAttribute("javax.servlet.error.request_uri");
%>


<div id="container">
	<jsp:include page="/include/header.jsp"></jsp:include>
</div>

<div style="position:relative;left:0px;top:100px;background-color:white;">
<h1 align="center" style="font:italic small-caps bold georgia;color:red">We are sorry! An error occurred during the process of your request...</h1>

<table>
<tr>
<td><h3>Our technical service will be alerted and will do the necessary to prevent this kind of errors to happen again.</h3>
<hr />
<h5>Please check the following for more information:</h5>
<p>Error type full name: <%= exceptionTypeFullName %></p>
<p>Exception type: <%= exceptionTypeName %> </p>
<p>Source URI: <%= request_uri %></p>
</td>
<td><img src="/kamaz_web_commerce_platform/images/error.jpg" alt="Technical service support icon"/></td>
</tr>
</table>

</div>


</body>
</html>