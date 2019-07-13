<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
<style>
table {
    font-family: arial, sans-serif;
    border-collapse: collapse;
    width: 50%;
}

td, th {
    border: 1px solid #dddddd;
    text-align: left;
    padding: 8px;
}

tr:nth-child(even) {
    background-color: #dddddd;
}
</style>
</head>
<body>
<!-- <table width="700" align="center">
<tr  border = '0'>
<td>
<span>KompanyX</span>
</td>
<td align="right">
<span>Sales Order</span>
</td>
</tr>
<tr  border = '0'>
<td>
<span>Bill to:
NAME
ADDRESS
PHONE</span>
</td>
<td align="right">
<span>Ship to:
NAME
ADDRESS
PHONE</span>
</td>
</tr>
<tr>
<table align = center cellspacing="10" cellspadding="0">
<tr  border = '1'>
<td>
<span>Order #</span>
</td>
<td>
<span>Customer PO #</span>
</td>
<td>
<span>PO Date</span>
</td>
<td>
<span>Requested delivery date</span>
</td>
<td>
<span>Shipped via</span>
</td>
<td>
<span>F.O.B point</span>
</td>
<td>
<span>Terms</span>
</td>
</tr>
<tr>
<td>
<span>Order #</span>
</td>
<td>
<span>Customer PO #</span>
</td>
<td>
<span>PO Date</span>
</td>
<td>
<span>Requested delivery date</span>
</td>
<td>
<span>Shipped via</span>
</td>
<td>
<span>F.O.B point</span>
</td>
<td>
<span>Terms</span>
</td>
</tr>
</table>
</tr>


<tr>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td>
</td>
<td>
</td>
</tr>
<tr>
<td>
</td>
<td>
</td>
</tr>
</table>

 -->
<%com.kamazoun.model.Session ss = (com.kamazoun.model.Session)session.getAttribute("current_session"); 
com.kamazoun.model.SalesOrders sO = (com.kamazoun.model.SalesOrders)session.getAttribute("SO");
com.kamazoun.model.Client client = (com.kamazoun.model.Client)session.getAttribute("client");
List<com.kamazoun.model.ProductItem> cart = null;
cart = (List<com.kamazoun.model.ProductItem>)session.getAttribute("cart");%>

  <table style="width:50%">
  <tr>
    <th><h2>KompanyX Inc</h2>
    <p>Bill to:</p>
    
    </th>
    <th><h1>Sales Order</h1>
    
    <p>SHIP To:</p>
    </th> 
   
  </tr>
 
  
  <tr>
    <td><%= client.getFirst_name()%> + <%= client.getGiven_name() %></td>
    <td><%= client.getAddress() %></td>
   
  </tr>
</table>

          
          
          <table>
  <tr>
    <th>Order#</th>
    <th>CP.O Date</th>
    <th>Shipping Via </th>
    <th>P.O.B Point</th>
    <th>TERMS</th>
  </tr>
  <tr>
    <td><%= sO.getSalesorder_id() %></td>
    <td>Germany</td>
    <td><%= new GregorianCalendar().toString() %></td>
    <td>Land</td>
    <td>NET 30</td>
  </tr>
 
</table>
<h1></h1>



   <table>
  <tr>
    <th>Total</th>
   
  </tr>
  <tr>
    <td><%= session.getAttribute("cartTotal") %></td>
   
  </tr>
  <tr>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td></td>
    <td>6799</td>
   
  </tr>
  
 
</table>


          </div>
          
          
          <form action="/action_page.php">
  received by: <br>
  <input type="text" name="received" >
  Date:
  <input type="text" name="date"> <br>
   Packed by: <br>
  <input type="text" name="received" >
  Date:
  <input type="text" name="date"> <br>
   Shipped by: <br>
  <input type="text" name="received" >
  Date:
  <input type="text" name="date"> <br>
  Invoiced by: <br>
  <input type="text" name="received" >
  Date:
  <input type="text" name="date"> <br>
  PaymentReceived by:  <br>
  <input type="text" name="received" >
  Date:
  <input type="text" name="date"> <br>
  
  
</form>
  
</body>
</html>