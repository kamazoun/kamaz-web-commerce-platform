<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add products to your online shop</title>
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
/* String isLoggedIn = (String)session.getAttribute("isLoggedIn");
if(!isLoggedIn.equals("true"))
request.getRequestDispatcher("/LoginServlet").forward(request, response); */

String seller_id = request.getParameter("seller_id");
String img = request.getParameter("img");
%>
<div id="container">
	<jsp:include page="/include/header.jsp"></jsp:include>
</div>
<br />
<br />
<div style="position:relative;left:400px;top:150px;background-color:white;color:blue">
<p style="font:italic small-caps bold 17px georgia;color:black">Enter the data of the product to add:</p>

<form action="processProduct.jsp" method="post">
<table>

<tr>
<td>Product name:</td>
<td><input type="text" name="product_name"/></td>
</tr>
<tr>
<td>product code :</td>
<td><input type="text" name="product_code"/></td>
</tr>
<tr>
<td>quantity available :</td>
<td><input type="text" name="quantity_available"/></td>
</tr>
<tr>
<td>price :</td>
<td><input type="text" name="price"/></td>
</tr>
<tr>
<td>details :</td>
<td><textarea name="details" rows="3"></textarea></td>
</tr>
<tr>
<td>Image Url :</td>
<td><input type="text" name="img" value="<%=img%>"/></td>
</tr>
<tr>
<td></td>
<td><input type="submit" value="add product"/></td>
</tr>

</table>
<input type="hidden" name="seller_id" value='<%= seller_id %>' />
<input type="hidden" name="hint" value="product"/>
<input type="hidden" name="sight" value="0"/>
<br />
</form>

</div>


</body>
</html>