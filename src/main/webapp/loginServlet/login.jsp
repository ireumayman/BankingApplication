
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String user1 = "Laura", pass1 = "123";
String user2 = "Jenna", pass2 = "456";
String user3 = "Max", pass3 = "789";
Cookie c1 = new Cookie(user1, pass1);
Cookie c2 = new Cookie(user2, pass2);
Cookie c3 = new Cookie(user3, pass3);
response.addCookie(c1);
response.addCookie(c2);
response.addCookie(c3);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<%
	String user = request.getParameter("user");
	String pass = request.getParameter("pass");
	Cookie[] cookies = request.getCookies();
	String name = "", value = "", uname = "", upass = "", date = "";
	boolean isValid = false;
	%>
	<%
	if (cookies != null) {
		for (int i = 0; i < cookies.length; i++) {
			name = cookies[i].getName();
			value = cookies[i].getValue();
			if (name.equals(user) && value.equals(pass)) {
				isValid = true;
			}
			if (name.equals(user)) {
				date = value;
			}
		}

		if (isValid) {
			uname = user;
			upass = pass;

			session.setAttribute(uname, date);
			response.sendRedirect("../viewAccounts.jsp");
		}
		else{
			response.sendRedirect("../Login.html");
		}
	}
	else
		response.sendRedirect("login.jsp");
	%>
</body>
</html>