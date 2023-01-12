<%@page import="com.employeeClient.bean.Creds"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page import = "javax.servlet.*,java.text.*" %>
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
<jsp:include page="/logoutA.jsp"></jsp:include>
	<form action="addchargemethod">
	<table>
	<%
         Date dNow = new Date( );
         SimpleDateFormat ft = 
         new SimpleDateFormat ("yyyy/mm/dd");
         ft.format(dNow);
      %>
	<tr><td><input type="hidden" name="lastdate" value= <%= (new java.util.Date())%>></td></tr>
	<tr><td>Enter transaction type: </td> <td><input type="text" name="transtype"></td></tr> 
	<tr><td>Enter transaction charge : </td> <td><input type="text" name="transcharge"></td></tr>
	<tr><td>Enter transaction frequency : </td> <td><input type="text" name="freq"></td></tr>  
	<tr><td><input type="submit" value="Add"></td>
	${message}
	</table>
	</form>
</body>
<%} %>
</html>