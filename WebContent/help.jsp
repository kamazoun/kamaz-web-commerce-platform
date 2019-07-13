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
<title>Help</title>
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

<div style="position:relative;left:300px;top:100px;width:700px">

<p style='position:relative;left:200px;top:00px; font-size:25px; color:blue'>General help content</p>

<p>This site is an online shopping cart allowing users to browse products and purchase them.</p>

<p style='position:relative;left:200px;top:00px; font-size:25px; color:blue'>Administrators</p>

<p>Administrators have the highest level of authorization on the website and can use all the functions the site offers.</p>

<p style='position:relative;left:200px;top:00px; font-size:25px; color:blue'>Sellers</p>

<p>Sellers are authorized to the /sellers, /buyers, and global namespace of the website hierarchy. </p>
</div>

</body>
</html>