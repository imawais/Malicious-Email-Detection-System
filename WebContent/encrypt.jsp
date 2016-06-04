<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Encryption</title>
<style type="text/css">
.reg-error {
	font-size: 12px;
	font-weight: bold;
	font-color: red;
}
</style>
</head>
<body>
	<c:import url="header.jsp"></c:import>

	<form
		action="<%=response.encodeUrl(request.getContextPath()
					+ "/Controller?action=encryptword")%>"
		method="post">
		<input type="hidden" name="action" value="encryptword" />
		<p>
			<label>Enter Actual Words:</label> <input type="text" name="encrpt"
				value="<%=request.getAttribute("")%>" /> <input type="submit"
				value="Perform Encryption" />
		</p>
		<p class="reg-error"><%=request.getAttribute("message")%></p>
	</form>

	<c:import url="footer.jsp"></c:import>
</body>
</html>