<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Compose Mail</title>
<link rel="stylesheet" type="text/css" href="style/stylecompose.css" />
</head>
<body>
	<c:import url="header.jsp"></c:import>
	<form class="compose">
		<p>
			<label>To:</label> <input type="text" class="sendtoid" />e.g
			example@securemail.com
		</p>
		<p>
			<label>Bcc:</label> <input type="text" class="bcc" />
		</p>
		<p>
			<label>Subject:</label> <input type="text" class="subject" />
		</p>
		<p>
			<label class="message-label">Message:</label>
			<textarea name="textarea" cols="10" rows="10" class="message">
</textarea>
		</p>
		<div>
			<button type="submit" class="send">Send &raquo;</button>
		</div>
		<div>
			<input type="file" class="AttachFile">
		</div>
		</button>
		</div>
	</form>

</body>
</html>