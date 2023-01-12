<%@page import="com.employeeClient.bean.WalletSpring"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.adiv{
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

<div class ="adiv">
<jsp:include page="/logout.jsp"></jsp:include>
	<form action="fundtransfer1">
	<h4>
	<input type="hidden" value="${user.user_name }" name="t1">
	Enter Beneficiary Account Number To Deposit
	<br>
	<input type="text" name="t2">
	<br>
	<br>
	Enter Money To Deposit
	<br>
	<input type="text" name="t3">
	<br>
	<br>
	<input type="submit" value="Transfer Amount">
	<br>
	${message}</h4></form>	</div>
	<%} %>
</body>
</html>