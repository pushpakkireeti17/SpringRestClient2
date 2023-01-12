<%@page import="com.employeeClient.bean.WalletSpring"%>
<%@page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transactions></title>
<style>
</style>
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
<br>
<table border="1" >
            	
                <th>Transaction_Id</th>
                <th>Customer Id</th>
                <th>Transaction Type</th>
                <th>Credit Amount</th>
                <th>Debit Amount</th>
                <th>Balance</th>
                <th>Time</th>
                <c:forEach var="e" items="${trans}">
                <tr>
                    <td>${e.trans_id}</td>
                    <td>${e.user_id}</td>
                    <td>${e.transtype}</td>
                    <td>${e.creditamount}</td>
                    <td>${e.debitamount}</td>
                    <td>${e.balance}</td>
                    <td>${e.time}</td>
                </tr>
            
            </c:forEach>
            
             
        </table>
</body>
<%} %>
	

</html>