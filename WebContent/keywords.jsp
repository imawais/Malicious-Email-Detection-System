<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Keywords</title>
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
					+ "/Controller?action=managekeywords")%>"
		method="post">
		<input type="hidden" name="action" value="managekeywords" />
		<p>
			<label>Enter Keywords</label> <input type="text" name="keywords"
				value="<%=request.getAttribute("keywords")%>" /> <input
				type="submit" value="Add" />
		</p>
		<p class="reg-error"><%=request.getAttribute("message")%></p>
	</form>

	<c:import url="footer.jsp"></c:import>
</body>
</html>