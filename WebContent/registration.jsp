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
					+ "/Controller?action=registration")%>"
		class="register">
		<input type="hidden" name="action" value="registration" />
		<h1>Registration</h1>
		<fieldset class="row1">
			<legend>Account Details</legend>
			<p>
				<label>Email*</label> <input type="text" name="email"
					value="<%=request.getAttribute("email")%>" />
			</p>
			<p>
				<label>Password*</label> <input type="password" name="password"
					value="" /> <label>Repeat Password*</label> <input type="password"
					name="repeatpassword" value="" /> <label class="obinfo">*obligatory
					fields</label>
			</p>
		</fieldset>
		<fieldset class="row2">
			<legend>Personal Details</legend>
			<p>
				<label>First Name*</label> <input type="text" name="fname"
					class="long" value="" />
			</p>
			<p>
				<label>Last Name*</label> <input type="text" name="lname"
					class="long" value="" />
			</p>
			<p>
				<label>Phone*</label> <select class="phone">
					<option value="1">+92</option>
					<option value="2">+91</option>
					<option value="3">+90</option>
				</select> <input type="text" name="phone" maxlength="11" value="" />
			</p>
			<p>
				<label class="optional">Street</label> <input type="text"
					class="long" name="street" value="" />
			</p>
			<p>
				<label>City*</label> <input name="city" type="text" class="short"
					value="" />
			</p>
			<p>
				<label>Country*</label> <select name="country">
					<option value="1">Pakistan</option>
					<option value="2">United States</option>
					<option value="3">India</option>
					<option value="4">Saudi Arabia</option>
				</select>

				<%--  <input name="country" type="text" value="" /> --%>
			</p>
		</fieldset>
		<fieldset class="row3">
			<legend>Further Information</legend>
			<p>
				<label>Gender*</label><input type="radio"
					name="gender" value="male" /> <label class="gender">Male</label> <input
					type="radio" name="gender" value="female" /> <label class="gender">Female</label>

			</p>
			<p>
				<label>Birthdate*</label> <select name="dob" class="date">
					<option value="1">01</option>
					<option value="2">02</option>
					<option value="3">03</option>
					<option value="4">04</option>
					<option value="5">05</option>
					<option value="6">06</option>
					<option value="7">07</option>
					<option value="8">08</option>
					<option value="9">09</option>
					<option value="10">10</option>
					<option value="11">11</option>
					<option value="12">12</option>
					<option value="13">13</option>
					<option value="14">14</option>
					<option value="15">15</option>
					<option value="16">16</option>
					<option value="17">17</option>
					<option value="18">18</option>
					<option value="19">19</option>
					<option value="20">20</option>
					<option value="21">21</option>
					<option value="22">22</option>
					<option value="23">23</option>
					<option value="24">24</option>
					<option value="25">25</option>
					<option value="26">26</option>
					<option value="27">27</option>
					<option value="28">28</option>
					<option value="29">29</option>
					<option value="30">30</option>
					<option value="31">31</option>
				</select> <select name="dob">
					<option value="1">January</option>
					<option value="2">February</option>
					<option value="3">March</option>
					<option value="4">April</option>
					<option value="5">May</option>
					<option value="6">June</option>
					<option value="7">July</option>
					<option value="8">August</option>
					<option value="9">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select> <input class="year" name="dob" type="text" size="4" maxlength="4" />e.g
				1990

			</p>
			<p>
				<label>Nationality*</label> <select name="nationality">
					<option value="1">Pakistan</option>
					<option value="2">United States</option>
					<option value="3">Saudi Arabia</option>
				</select>

			</p>
		</fieldset>
		<fieldset class="row4">
			<legend>Terms and Mailing</legend>
			<p class="agreement">
				<input type="checkbox" value="1" /> <label>* I accept the <a
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