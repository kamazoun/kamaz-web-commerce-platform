<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Sign up</title>
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

<div style="position:relative;left:0px;top:150px;background-color:white;">

<div style="position:relative;left:400px;top:50px;background-color:white;color:blue">
<form action="administrators/processUser.jsp" method="post">
avatar : <input type="text" name="user_name" style="position:relative;left:117px;top:0px;background-color:white;"/>
<br />
password : <input type="password" name="user_password" style="position:relative;left:96px;top:0px;background-color:white;"/>
<br />
birth date(yyyy-mm-dd) : <input type="text" name="user_birthdate" style="position:relative;left:1px;top:0px;background-color:white;"/>
<br />
first name : <input type="text" name="user_first_name" style="position:relative;left:92px;top:0px;background-color:white;"/>
<br />
given name : <input type="text" name="user_given_name" style="position:relative;left:82px;top:0px;background-color:white;"/>
<br />
country : <input type="text" name="user_country" style="position:relative;left:108px;top:0px;background-color:white;"/>
<br />
phone number : <input type="text" name="user_phone" style="position:relative;left:65px;top:0px;background-color:white;"/>
<br />
address : <input type="text" name="user_address" style="position:relative;left:108px;top:0px;background-color:white;"/>
<br />
type : <!-- <input type="radio" name="type_id" value='1' style="position:relative;left:80px;top:0px;background-color:white;"/> manager -->
 <input type="radio" name="type_id" value='2' style="position:relative;left:60px;top:0px;background-color:white;"/> seller
  <input type="radio" name="type_id" value='3' style="position:relative;left:70px;top:0px;background-color:white;"/> buyer
<br />
<input type="hidden" name="amount" value='0'/>
<br />
details : <br /><textarea name="user_details" rows="3" style="position:relative;left:80px;top:0px;background-color:white;"></textarea>
<br />
Picture : <input type="text" name="img" value="users/default.jpg"/>
<br />
<input type="hidden" name="hint" value="userhint"/>
<br />
<input type="submit" value="send"/>
<br />
</form>
</div>
</div>
</body>
</html>