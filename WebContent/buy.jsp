<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>paying information</title>
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

<div style="position:relative;left:0px;top:50px;background-color:white;">

<%--Ici on va developer un formulaire pour recevoir les donnees de l'utilisateur qui n'est pas logged in: carte bancaire, address, ... --%>
<h2>You need to enter some informations to proceed your payment:</h2>
<br />

<%Double total_price = (Double)session.getAttribute("cartTotal"); //devrait etre de type double%>

<div style="margin-top:50px;position:absolute;margin-left:400px;color:blue">
<form action="buyThanks.jsp" method="post">
first name : <input type="text" name="first_name"  style="position:relative;left:80px;top:0px;background-color:white;"/>
<br />
given name : <input type="text" name="given_name" style="position:relative;left:70px;top:0px;background-color:white;"/>
<br />
address : <input type="text" name="address" style="position:relative;left:97px;top:0px;background-color:white;"/>
<br />
card number : <input type="text" name="card" style="position:relative;left:64px;top:0px;background-color:white;"/>
<br />
card password : <input type="password" name="password" style="position:relative;left:53px;top:0px;background-color:white;"/>
<br />
phone  : <input type="text" name="phone" style="position:relative;left:105px;top:0px;background-color:white;"/>
<br />
<input type="hidden" value="<%= total_price %>" name="total_price"/>
type : <input type="radio" name="type" value='Visa' /> Visa
 <input type="radio" name="type" value='MasterCard'/> MasterCard
  <input type="radio" name="type" value='America Express'/> America Express
<br /><br />
<input type="submit" value="send" style="position:relative;left:100px;top:25px;background-color:white;"/>
</form>
</div>
</div>
</body>
</html>