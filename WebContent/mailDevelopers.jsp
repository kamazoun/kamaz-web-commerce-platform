<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="com.kamazoun.service.DbQuery"%>
<%@page import="java.text.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="/errors/exceptions.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Mail developers</title>
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

<%
		Integer user_id = 99999999;
		String receiver_id = "1";

		GregorianCalendar calendar = new GregorianCalendar();
		DateFormat formatter = DateFormat.getDateTimeInstance(
				DateFormat.FULL, DateFormat.FULL, Locale.US);
		TimeZone timeZone = TimeZone.getTimeZone("CST");
		formatter.setTimeZone(timeZone);

		String dateTime = formatter.format(calendar.getTime());
	%>



	<div style="position: relative; left: 500px; top: 100px;">


		<table>
			<tr>
				<td align="center">Send a suggestion to an Administrator:</td>
			</tr>
			<tr>
				<td style="color: blue" align="center">Admin</td>
			</tr>
			<tr>
				<td align="center"><img
					src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(
					Integer.parseInt(receiver_id))%>'
					alt="user photo"></img></td>
			</tr>
			<tr>
				<td>
					<form action="processSendMessage.jsp"
						method="post">
						<input type="text" name="details" value='@suggestion:' size='61'
							title="title of the message" /> <br />
					 	<textarea rows="10" cols="50" name="message"></textarea>
						<input type="hidden" name="seen" value='false' /> <input
							type="hidden" name="time" value="<%=dateTime%>"></input> <input
							type="hidden" name="sender_id" value="<%=user_id%>"></input> <br />
						<input type="hidden" name="receiver_id" value="<%=receiver_id%>"></input>
						<br /> <input type="submit" value="send" /><input type="reset"
							value="delete" />
					</form>
				</td>
			</tr>
		</table>

	</div>

</body>
</html>