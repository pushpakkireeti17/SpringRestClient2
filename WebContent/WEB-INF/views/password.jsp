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
	WalletSpring w1=(WalletSpring)session.getAttribute("user");
%>
<jsp:include page="/index.jsp"></jsp:include>
${user.getName()}
	${user.getMobile_number()}
	<form action="passwordCreation">
	<input type="hidden" value = "${user.name}" name="custName"> 
	<input type="hidden" value = "${user.mobile_number}" name="phone">  
	<input type="hidden" value = "${user.user_name}" name="userName">
	Enter password to create account: <input type="text" name="pass">
	<input type="submit" value="Create Account">
	${message}
	</form>

</body>
</html>