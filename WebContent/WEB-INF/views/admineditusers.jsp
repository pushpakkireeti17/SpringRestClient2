<%@page import="com.employeeClient.bean.Creds"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<jsp:include page="/index.jsp"></jsp:include>
	<form action="editCredUsersSubmit">
	<table>
	<tr> <td>
	<tr> <td><input type="hidden"  name="userName" value = "<c:out value='${user.userName}' />"> </td>
	<tr> <td>Enter Mobile Number :<input type="text" name="phone" value="${user.phone}" > </td>
	<tr> <td>Enter Customer Name :<input type="text" name="custName" value="${user.custName}" ></td>
	<tr> <td>Enter Password : <input type="text" name="pass" value="${user.pass}" ></td>
	<tr> <td><input type="submit" value="Edit"></td>
	<tr> <td>${message}</td>
	</tr></table>
	</form>
	<%} %>
</body>
</html>