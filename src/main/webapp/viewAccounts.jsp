<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="account.css" />
<meta charset="ISO-8859-1">
<title><%= session.getAttributeNames().nextElement() %>'s Account</title>
</head>
<body>
	<ul>
		<li><a href="logout.jsp">Logout</a></li>
	</ul>


	<%
	String x = "", y = "";
	Enumeration creds = session.getAttributeNames();
	while (creds.hasMoreElements()){
		x = (String) creds.nextElement();
		y = (String) session.getAttribute(x);
	}
	%>

	<%
	if (x.equals("")) {
		response.sendRedirect("Login.html");
	} else {
		HashMap<String, String[]> map1 = new HashMap<>();
		HashMap<String, Double> map2 = new HashMap<>();
		map1.put("Laura", new String[]{"100500100", "200500100"});
		map1.put("Jenna", new String[]{"300500200"});
		map1.put("Max", new String[]{"400500200", "500500300"});

		map2.put("100500100", 7000.25);
		map2.put("200500100", 80500.4);
		map2.put("300500200", 5000582.56);
		map2.put("400500200", 94200.2);
		map2.put("500500300", 8000456.65);
		
		String[] accounts = map1.get(x);
		
		%>
		<h2>Welcome <%=x%>!</h2>
		<h4>Last Access Date:	<%= Long.valueOf(y) < 1000 ? "None" : new Date(Long.valueOf(y)) %></h4>
		<table>
		<tr>
			<th>Account Number</th>
			<th>Balance</th>
		</tr>
		<% for(String m: accounts) {%>
				
				<tr>
					<td><%=m%></td>
					<td><%=map2.get(m)%></td>
				</tr>
			
		<% } %>
		</table>
	<% } %>

</body>
</html>