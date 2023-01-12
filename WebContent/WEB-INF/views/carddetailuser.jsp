<%@page import="com.employeeClient.bean.WalletSpring"%>
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
	WalletSpring w1=(WalletSpring)session.getAttribute("user");
	if(w1==null)
	{
%>
<jsp:include page="/index.jsp"></jsp:include>
<h3>Session Expired...Please Login To View the Profile</h3>
<%  }
	else
	{		
%>	
<body>
<jsp:include page="/logout.jsp"></jsp:include>
<table border="1" >
            	
                <th>Card Number</th>
                <th>Customer Name</th>
                <th>Customer Id</th>
                <th>Cvv</th>
                <th>Exp Month</th>
                <th>Exp Year</th>
                <c:forEach var="e" items="${users}">
                <tr>
                    <td>${e.cardnumber}</td>
                    <td>${e.cardname}</td>
                    <td>${e.cust_id}</td>
                    <td>${e.cvv}</td>
                    <td>${e.expmonth}</td>
                    <td>${e.expyear}</td>
                    </tr>
            
            </c:forEach>
            
             
        </table>
        ${message}
</body>
<%} %>
</html>