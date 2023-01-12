<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/index.jsp"></jsp:include>
<div align="center">
<h2>Please use your admin credentials to login</h2>
	<form action="adminLogin">
	<table>
	<tr><td>User Name : <input type="text" name="t1"></td></tr>
	<tr><td>User Password : <input type="password" name="t2"></td></tr>
	<tr><td><input type="submit" value="Login"></td></tr>
	</table>
	</form>
	</div>
</body>
</html>