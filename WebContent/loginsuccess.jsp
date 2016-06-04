<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>User menue</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" href="style/stylelogin.css" type="text/css" />
</head>
<body>
	<c:import url="header.jsp">
	</c:import>
	<div id="menu">
		<ul>
			<li><a href="compose.jsp">Compose Mail</a></li>
			<li><a href="inbox.jsp">Inbox</a></li>
			<li><a href="">Sent Items</a></li>
			<li><a href="">Draft</a></li>
			<li><a href="">Spams</a></li>
			<li><a href="">Trash</a></li>
		</ul>
	</div>
	<c:import url="footer.jsp"></c:import>
</body>
</html>
