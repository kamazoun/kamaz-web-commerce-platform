<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="com.kamazoun.model.*"%>
<%@page import="com.kamazoun.service.*"%>
<%-- <%@ page errorPage="/errors/exceptions.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>All Users</title>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding
}

ul li {
	float: left;
	width: 10%;
	height: 100px;
}
</style>
</head>

<body>
	<div id="container">
		<jsp:include page="/include/header.jsp"></jsp:include>
	</div>

	<div
		style="position: relative; left: 0px; top: 100px; background-color: white;">
		<%
			List<User> allUsers = (List<User>) request
					.getAttribute("allUsers");
			//List<User> allUsers = (List<User>)session.getAttribute("allUsersForDisplay");
			if (null == allUsers || allUsers.size() == 0)
			{
				out.print(
						"<p style=\"font:italic small-caps bold 15px georgia;color:red\">no user could be found</p>");
			}
			else
			{
		%><ul>
			<li><table width="100%" border="0" cellspacing="5"
					cellpadding="5">
					<%
						for (int i = 0, k = 1; i < allUsers.size(); i++, k++)
							{
					%>
					<td>
						<table height="200" width="200">
							<tr>
								<td align="center"><%=allUsers.get(i).getUser_name()%></td>
							</tr>
							<tr>
								<td align="center"><%=allUsers.get(i).getUser_first_name()%>
									<%=allUsers.get(i).getUser_given_name()%></td>
							</tr>
							<tr>
								<td><a style='font: italic small-caps bold 15px georgia;'
									href='/kamaz_web_commerce_platform/administrators/userProfile.jsp?user_id=<%=allUsers.get(i).getUser_id()%>'><img
										src='/kamaz_web_commerce_platform/images/<%=DbQuery.getUserImageFromId(
							allUsers.get(i).getUser_id())%>'
										alt="user photo"></img></a></td>
							</tr>
							<tr>
								<td align="center"><%=allUsers.get(i).getUser_country()%></td>
							</tr>
							<tr>
								<td align="center"><%=allUsers.get(i).getUser_address()%></td>
							</tr>
							<tr>
								<td align="center"><%=allUsers.get(i).getUser_birthdate()%></td>
							</tr>
							<tr>
								<td align="center"><%=allUsers.get(i).getUser_phone()%></td>
							</tr>
							<tr>
								<td align="center"><%= allUsers.get(i).getUser_details() %></td>
							</tr>
						</table>
					</td>
					<%
		if(k % 4 == 0)
		{
		%>
					</tr>
					<%
		}
	}
	%>
				</table>
				<% 
}	
%></li>
		</ul>


	</div>

</body>
</html>