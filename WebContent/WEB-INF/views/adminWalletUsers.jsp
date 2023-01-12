<%@page import="com.employeeClient.bean.Creds"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Show Users</title>
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
<table border="1" >
            	
                <th>Customer Account number</th>
                <th>Customer Name</th>
                <th>Customer Phone</th>
                <th>Customer Balance</th>
                <th>Customer Email</th>
                <th>Customer Username</th>
                <c:forEach var="e" items="${users}">
                <tr>
                    <td>${e.account_number}</td>
                    <td>${e.name}</td>
                    <td>${e.mobile_number}</td>
                    <td>${e.amount}</td>
                    <td>${e.email}</td>
                    <td>${e.user_name}</td>
                    <td> <form action="editUsers"><input type="hidden" value=${e.user_name} name="t1"><input type="submit" value="Edit"></form></td>
                    <td> <form action="deleteUser"><input type="hidden" value=${e.user_name} name="t1"><input type="submit" value="Delete"></form></td>
                </tr>
            
            </c:forEach>
            
             
        </table>
        ${message}
</body>
<%} %>
</html>