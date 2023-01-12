<%@page import="com.employeeClient.bean.Creds"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	Creds c=(Creds)session.getAttribute("user");
	if(c==null)
	{
%>
<%@page import="com.employeeClient.bean.WalletSpring"%>
<h3>Session Expired...Please Login To View the Profile</h3>
<%  }
	else
	{		
%>	
<jsp:include page="/logoutA.jsp"></jsp:include>
<br>
<br>
	<form action="addAdmin">
	<table>
	<tr> <td>Enter Name : </td> <td><input type="text" name="custName"></td></tr> 
	<tr> <td>Enter Mobile Number : </td> <td><input type="text" name="phone"></td></tr> 
	<tr> <td>Enter User Name : </td> <td><input type="text" name="userName"></td></tr> 
	<tr> <td>Enter Password : </td> <td><input type="text" name="pass"></td></tr> 
<tr><td><input type="submit" value="Next"></td></tr>
	</table>
	</form>
</body>
<%} %>
</html>