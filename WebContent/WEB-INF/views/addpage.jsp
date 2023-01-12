<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add page</title>
<style>
.abutton {
  background-color: #e7e7e7;
  border: none;
 color: black;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  margin: 4px 2px;
  cursor: pointer;
}
.adiv{
text-align: center;
}
.abutton:hover{
background-color: #33E0FF;
}
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #D6EEEE;
}
</style>
</head>

<body>
	<jsp:include page="/index.jsp"></jsp:include>
	<form action="create">
	<table>
	<tr> <td>Enter Name : </td> <td><input type="text" name="name"></td></tr> 
	<tr> <td>Enter Mobile Number : </td> <td><input type="text" name="mobile_number"></td></tr> 
	<tr> <td>Enter Email : </td> <td><input type="text" name="email"></td></tr> 
	<tr> <td>Enter Minimum Balance  : </td> <td><input type="text" name="amount"></td></tr> 
	<tr> <td>Enter User Name : </td> <td><input type="text" name="user_name"></td></tr> 
	<tr> <td><input type="hidden" name="account_number" value="1100010000"></td></tr> 
	<tr> <td><input type="submit" value="Next"></td></tr>
	${message}
	</table>
	</form>
</body>
</html>