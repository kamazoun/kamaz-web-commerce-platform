<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbUpdate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
<%
String user_id = request.getParameter("user_id");
String img = request.getParameter("img");
DbUpdate.changeUserProfilePhoto(user_id, img); 
response.sendRedirect("/kamaz_web_commerce_platform/administrators/requestAllUsers.jsp");
%>
</body>
</html>