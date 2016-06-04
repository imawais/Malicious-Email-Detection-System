<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Created</title>

<style type="text/css">
#message {
	position: relative;
	top: 100px;
	width: 300px;
	border: 1px solid gray;
	padding: 20px;
	background-color: #CCFFCC;
	text-align: center;
	font-weight: bold;
}
</style>

</head>
<body>
	
	<c:import url="header.jsp"></c:import>
	<center>

		<div id="message">

			<p>Account created with email:</p>

			<p><%=request.getAttribute("email")%></p>

		</div>


	</center>
	
	<c:import url="footer.jsp"></c:import>

</body>
</html>