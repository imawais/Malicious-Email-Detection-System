<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<link rel="stylesheet" href="style/stylelogin.css" type="text/css" />
</head>
<body>
	<c:import url="header.jsp">
	</c:import>

	<div id="menu">
		<ul>
			<li><a href="keywords.jsp">Manage Keywords</a></li>
			<li><a href="displaykeywords.jsp">Display Keywords</a></li>
			<li><a href="encrypt.jsp">Encrypted Words</a></li>
			<li><a href="displayencrypt.jsp">Display Encryptedwords</a></li>
			<li><a href="alertlist.jsp">Alert List</a></li>
		</ul>
	</div>

	<c:import url="footer.jsp"></c:import>
</body>
</html>