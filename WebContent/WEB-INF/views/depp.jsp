
<%@page import="com.employeeClient.bean.WalletSpring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
/* <link href="../allstyle.css" rel="stylesheet" type="text/css"> */
body {
text-align: center;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<% 
	WalletSpring w1=(WalletSpring)session.getAttribute("user");
	if(w1==null)
	{
%>
<jsp:include page="/index.jsp"></jsp:include>
<h3>Please Login To View the Profile</h3>
<%  }
	else
	{			
%>
<jsp:include page="/logout.jsp"></jsp:include>
<div>
<br>
<br>
	<form action="deposit1">
	<input type="hidden" value="${user.user_name }" name="t1">
	Enter Money To Deposit : 
	<input type="text" name="t2">
	<br>
	<br>
	<input type="submit" value="Deposit Amount">
	<BR>
	${message}</form></div>
	
<%} %>
</body>
</html>