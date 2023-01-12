<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/index.jsp"></jsp:include>
	<form action="editUsersSubmit">
	<table>
	<tr> <td>
	<tr> <td><input type="hidden"  name="user_name" value = "<c:out value='${user.user_name}' />"> </td>
	<tr> <td><input type="hidden"  name="account_number" value = "<c:out value='${user.account_number}' />"></td>
	<tr> <td>Enter Mobile Number :<input type="text" name="mobile_number" value="${user.mobile_number}" > </td>
	<tr> <td>Enter Customer Name :<input type="text" name="name" value="${user.name}" ></td>
	<tr> <td>Enter Amount : <input type="text" name="amount" value="${user.amount}" ></td>
	<tr> <td>Enter Email : <input type="text" name="email" value="${user.email}" ></td>
	<tr> <td><input type="submit" value="Edit"></td>
	<tr> <td>${message}</td>
	</tr></table>
	</form>
</body>
</html>