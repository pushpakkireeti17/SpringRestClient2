<%@page import="com.employeeClient.bean.Creds"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Welcome</title>
<style>
input[type=submit],
button {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
input[type=submit]:hover,
button:hover{
background-color: #58BB5C;
}
.leftbox {
                float:left; 
                width:25%;
                height:100px;
            }
.middleboxl{
                float:left; 
                width:25%;
                height:100px;
            }
.middleboxr{
                float:right; 
                width:25%;
                height:100px;
            }
.rightbox{
                float:right;
                width:25%;
                height:100px;
            }
.boxes
{
	padding-left: 100px;
}
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
</head>
<body>
<jsp:include page="/logoutA.jsp"></jsp:include>
<h1>Welcome to Admin Page - ${user.custName}</h1>
	<br>
	<br>
	<div class="leftbox">
	<form action="adminUser">
	<input type="hidden" value="${user.userName }" name="t1">
	<input type="submit" value="Show Credentials"></form></div>
	<div class="middleboxl">
	<form action="adminWalletUserShow">
	<input type="hidden" value="${user.userName }" name="t1">
	<input type="submit" value="Show Users"></form></div>
	<div class="middleboxr">
	<form action="showcards">
	<input type="hidden" value="${user.userName }" name="t1">
	<input type="submit" value="Show Cards"></form></div>
	<div class="rightbox">
	<form action="charges">
	<input type="hidden" value="${user.userName }" name="t1">
	<input type="submit" value="Show Charges"></form></div>
	<div class="leftbox">
	<form action="adding">
	<input type="hidden" value="${user.userName }" name="t1">
	<input type="submit" value="Charges"></form></div>
	<div class="middleboxl">
	<form action="clientadds">
	<input type="hidden" value="${user.userName }" name="t1">
	<input type="submit" value="Add Client"></form></div>
	<div class="middleboxl">
	<form action="addA">
	<input type="submit" value="Add Admin"></form></div>
	<%} %>

</body>
</html>