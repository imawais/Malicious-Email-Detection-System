<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Encrypted Words</title>
<style>
table {
	border-collapse: collapse;
}

table,th,td {
	border: 1px solid black;
}

table {
	width: 100%;
}

th {
	height: 50px;
}
</style>
</head>
<body>

	<c:import url="header.jsp"></c:import>

	<sql:setDataSource var="ds" dataSource="jdbc/secure_mail" />

	<sql:query dataSource="${ds}" sql="select * from encryptedwords"
		var="results"></sql:query>
	<table>

		<tr>
			<th>Actual Words</th>
			<th>Encrypted Words</th>
		</tr>
		
		<c:forEach var="encrypt" items="${results.rows}">
			
			<tr>
				<td>${encrypt.aword}</td>
				<td>${encrypt.eword}</td>
			</tr>

		</c:forEach>

	</table>

	<c:import url="footer.jsp"></c:import>
</body>
</html>