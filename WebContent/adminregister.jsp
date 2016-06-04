<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Form</title>
<link rel="stylesheet" href="style/styleregistration.css"
	type="text/css" />
	
<style type="text/css">
.reg-error {
	font-size: 12px;
	font-weight: bold;
	font-color: red;
}
</style>
</head>
<body>
	<form method="post"
		action="<%=response.encodeUrl(request.getContextPath()
					+ "/Controller?action=adminregistration")%>"
		class="register">
		<input type="hidden" name="action" value="adminregistration" />
		<h1>Registration</h1>
		<fieldset class="row1">
			<legend>Account Details</legend>
			<p>
				<label>Email</label> <input type="text" name="email"
					value="<%=request.getAttribute("email")%>" />
			</p>
			<p>
				<label>Password</label> <input type="password" name="password"
					value="" /> <label>Repeat Password</label> <input type="password"
					name="repeatpassword" value="" /> 
			</p>
		</fieldset>
		
		<fieldset class="row4">
			<legend>Terms and Mailing</legend>
			<p class="agreement">
				<input type="checkbox" value="1" /> <label>I accept the <a
					href="#">Terms and Conditions.</a></label>
			</p>
			<p class="agreement">
				<input type="checkbox" value="2" /> <label>I want to receive
					personalized offers by your site</label>
			</p>
			<p class="agreement">
				<input type="checkbox" value="3" /> <label>Allow partners to
					send me personalized offers and related services</label>
			</p>
		</fieldset>
		<div>

			<p class="reg-error"><%=request.getAttribute("message")%></p>
			<div>
				<button class="button" type="submit">Register &raquo;</button>
			</div>
	</form>


</body>
</html>