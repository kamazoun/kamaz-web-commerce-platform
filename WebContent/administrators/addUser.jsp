<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add user</title>
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

<div style="position:relative;left:400px;top:150px;background-color:white;color:blue">
<p style="font:italic small-caps bold 17px georgia;color:black">Enter the data of the user to add:</p>
<form action="processUser.jsp" method="post">
<table>
<tr>
<td>avatar :</td>
<td><input type="text" name="user_name"/></td>
</tr>
<tr>
<td>password :</td>
<td><input type="password" name="user_password"/></td>
</tr>
<tr>
<td>birth date(yyyy-mm-dd) :</td>
<td><input type="text" name="user_birthdate"/></td>
</tr>
<tr>
<td>first name :</td>
<td><input type="text" name="user_first_name"/></td>
</tr>
<tr>
<td>given name :</td>
<td><input type="text" name="user_given_name"/></td>
</tr>
<tr>
<td>country :</td>
<td><input type="text" name="user_country"/></td>
</tr>
<tr>
<td>phone number :</td>
<td><input type="text" name="user_phone"/></td>
</tr>
<tr>
<td>address :</td>
<td><input type="text" name="user_address"/></td>
</tr>
<tr>
<td>type :</td>
<td><input type="radio" name="type_id" value='1'/> manager
 <input type="radio" name="type_id" value='2'/> seller
  <input type="radio" name="type_id" value='3'/> buyer</td>
</tr>
<tr>
<td>amount:</td>
<td><input type="text" name="amount" value='0'/></td>
</tr>
<tr>
<td>details :</td>
<td><textarea name="user_details" rows="3"></textarea></td>
</tr>
<tr>
<td>Picture :</td>
<td><input type="text" name="img" value="users/default.jpg"/></td>
</tr>
</table>
<input type="hidden" name="hint" value="userhint"/>
<br />
<input type="submit" value="send"/>
<br />
</form>

</div>
</body>
</html>