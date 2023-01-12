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
	<form action="editchargesubmit">
	<table>
	<tr> <td>
	<tr> <td>Transaction Type<input type="text"  name="transtype" value = "<c:out value='${user.transtype}' />" readonly> </td>
	<tr> <td>Last date<input type="text"  name="lastdate" value = "<c:out value='${user.lastdate}' />" readonly></td>
	<tr> <td>Enter Frequency :<input type="text" name="freq" value="${user.freq}" > </td>
	<tr> <td>Enter Transaction charge :<input type="text" name="transcharge" value="${user.transcharge}" ></td>
	<tr> <td><input type="submit" value="Edit"></td>
	<tr> <td>${message}</td>
	</tr></table>
	</form>
</body>
</html>