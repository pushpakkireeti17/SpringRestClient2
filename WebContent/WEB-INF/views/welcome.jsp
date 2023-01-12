
<%@page import="com.employeeClient.bean.WalletSpring"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
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
</style>
</head>
<body>
<% 
	WalletSpring w1=(WalletSpring)session.getAttribute("user");
	if(w1==null)
	{
%>
<jsp:include page="/index.jsp"></jsp:include>
<h3>Session Expired...Please Login To View the Profile</h3>
<%  }
	else
	{		
%>	
<jsp:include page="/logout.jsp"></jsp:include>
	<h1 style="color:tomato; text-align: center;">Welcome Back ${user.name }</h1>
	<br>
	<br>
	<div class="boxes">
	<div class="leftbox">
	<form action="showbalance">
	<input type="hidden" value="${user.user_name }" name="t1">
	<input type="submit" value="Show Balance">
	<br>${messageB}
	</form>
	</div>
	<div class="middleboxl">
	<a href="withdraw"><button>Withdraw Money</button></a>
	</div>
	<div class="middleboxr">
	<a href="deposit"><button>Deposit Money</button></a>
	</div>
	<div class="rightbox">
	<a href="fundtransfer"><button>Fund Transfer</button></a>
	</div>
	<br>
	<div class="middleboxl">
	<form action="transactions">
	<input type="hidden" value="${user.user_name }" name="t1">
	<input type="submit" value="Transactions">
	</form>
	</div>
	<br>
	<div class="middleboxl">
	<form action="showcard">
	<input type="hidden" value="${user.user_name }" name="t1">
	<input type="submit" value="Show Cards"></form></div>
	<br>
	<br>
	<div class="leftbox">
	<form action="apply">
	<input type="hidden" value="${user.user_name }" name="t1">
	<input type="hidden" value="${user.name }" name="t2">
	<input type="submit" value="Apply For Card">
	<br>
	</form>
	<br>
	${messageD}
	</div>
	</div>
	<%} %>
	
</body>
</html>