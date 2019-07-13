<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Login</title>
</head>
<body>

<div align="center" style="position:relative;left:0px;top:250px;background-color:white;color:blue">
<p>Enter your credentials please:</p>
<form action='/kamaz_web_commerce_platform/LoginServlet' method='post'>
Username: <input type="text" name="j_username"/>
<br />
Password : <input type="password" name="j_password"/>
<br />
<input type="submit" value="log in"/>
</form>
</div>

</body>
</html>