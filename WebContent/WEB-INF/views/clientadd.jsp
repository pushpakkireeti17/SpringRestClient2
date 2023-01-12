<%@page import="com.employeeClient.bean.Creds"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Add</title>
</head>
<% 
	Creds c=(Creds)session.getAttribute("user");
	if(c==null)
	{
%>
<jsp:include page="/index.jsp"></jsp:include>
<h3>Session Expired...Please Login To View the Profile</h3>
<%  }
	else
	{		
%>	
<body>
<jsp:include page="/logoutA.jsp"></jsp:include>
<br>
<br>
	<form action="addingClient">
	<table>
	<tr> <td>Enter Ip : </td> <td><input type="text" name="ipAdd"></td></tr> 
	<tr> <td>Enter Name : </td> <td><input type="text" name="clientName"></td></tr> 
	<tr> <td>Enter access : </td> <td><select name="accessValid"><option value="1" label="Approve"></option><option value="0" label="Decline"></option></select></td></tr> 
	<tr> <td><input type="submit" value="Create"></td></tr>
	</table>
	</form>
</body>
	${message}
<%} %>
</html>