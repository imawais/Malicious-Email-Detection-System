<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Login</title>

<link rel="stylesheet" type="text/css" href="style/login.css" />
<style type="text/css">
.login-error {
	font-size: 12px;
	font-weight: bold;
	font-color: red;
}
</style>

</head>

<body>

	<form
		action="<%=response.encodeUrl(request.getContextPath()
					+ "/Controller?action=adminlogin")%>"
		method="post" class="register">
		<input type="hidden" name="action" value="adminlogin" />
		<h1>Admin Login</h1>
		<fieldset class="id">
			<legend>Logging into secure mail</legend>
			<p>
				<label>Email*</label> <input type="text" name="email" class="mailid"
					value="<%=request.getAttribute("email")%>" autofocus="autofocus" />
			</p>
			<p>
				<label>Password*</label> <input type="password" name="password"
					class="password" value="<%=request.getAttribute("password")%>" />
			</p>
			<p></p>
			<p class="login-error"><%=request.getAttribute("message")%></p>
			<p class="link">
				<a href="adminregister.jsp">New Admin?Register here</a>
			</p>
		</fieldset>
		<div>
			<button type="submit" class="login-button">Login &raquo;</button>
		</div>

	</form>

</body>
</html>