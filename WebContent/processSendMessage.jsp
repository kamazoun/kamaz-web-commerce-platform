<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="/errors/exceptions.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="newMessage" class="com.kamazoun.model.Notification" scope="request">
<jsp:setProperty name="newMessage" property="*"/>
</jsp:useBean>

<% 
RequestDispatcher rd = request.getRequestDispatcher("/SendMessage");
rd.forward(request, response);
%>

</body>
</html>