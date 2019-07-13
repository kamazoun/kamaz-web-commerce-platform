<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Change user status</title>
</head>
<body>
<form action="processUser.jsp" method="post">
avatar : <input type="text" name="user_name"/>
<br />
type : <input type="radio" name="type_id" value='1'/> manager
 <input type="radio" name="type_id" value='2'/> seller
  <input type="radio" name="type_id" value='3'/> buyer
<br />
<input type="hidden" name="hint" value="userStatus"/>
<br />
<input type="submit" value="send"/>
<br />
</form>
</body>
</html>