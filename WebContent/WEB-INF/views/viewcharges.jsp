<%@page import="com.employeeClient.bean.Creds"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<table border="1" >
            	
                <th>Transaction Type</th>
                <th>Transaction Charge</th>
                <th>Transaction Date</th>
                <th>Transaction Frequency</th>
                <c:forEach var="e" items="${users}">
                <tr>
                    <td>${e.transtype}</td>
                    <td>${e.transcharge}</td>
                    <td>${e.lastdate}</td>
                    <td>${e.freq}</td>
                    <td> <form action="editcharge"><input type="hidden" value=${e.transtype} name="t1"><input type="submit" value="Edit"></form></td>
                    <td> <form action="deletecharge"><input type="hidden" value=${e.transtype} name="t1"><input type="submit" value="Delete"></form></td>
                    <td> <form action="runcharge"><input type="hidden" value=${e.transtype} name="t1"><input type="submit" value="Run Charge"></form></td>
                </tr>
            
            </c:forEach>
            
             
        </table>
        ${message}
</body>
<%} %>
</html>