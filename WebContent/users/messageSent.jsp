<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Message sent</title>
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
	
	<div style="position: relative; left: 500px; top: 250px; color:blue">
	Your message has been sent successfully
	</div>

</body>
</html>