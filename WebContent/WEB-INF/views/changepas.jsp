
<%@page import="com.employeeClient.bean.WalletSpring"%>
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
	WalletSpring u=(WalletSpring)session.getAttribute("user");
	if(u==null)
	{
%>
<jsp:include page="/index.jsp"></jsp:include>
<h3>Session Expired..!!! Please Login To View the Profile</h3>
<%  }
	else
	{
		
%>
<jsp:include page="/logout.jsp"></jsp:include>
<br>
<br><br>
	<form action="changepass">
		<input type="hidden" value="${user.user_name}" name="t3">
		<table>	
			<tr><td>Old Password</td><td><input type="password" name="t1"></td></tr>
			<tr><td>New Password</td><td><input type="password" name="t2"></td></tr>
			<tr><td><input type="submit" value="Change"></td><td>${message1}</td></tr>
		</table>
	</form>
<%} %>

</body>
</html>