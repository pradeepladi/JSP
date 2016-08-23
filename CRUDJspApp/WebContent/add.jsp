<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page errorPage="error.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="add.jsp" method="post">
		<p>Enter PId:</p>
		<p>
			<input type="number" name="pid" required />
		</p>
		<p>Enter Last Name:</p>
		<p>
			<input type="text" name="lname" required />
		</p>
		<p>Enter First Name:</p>
		<p>
			<input type="text" name="fname" required />
		</p>
		<p>Enter Address:</p>
		<p>
			<input type="text" name="address" required />
		</p>
		<p>Enter city:</p>
		<p>
			<input type="text" name="city" required />
		</p>
		<p>
			<input type="submit" name="Add Persons Details" />
			
		</p>
	</form>
	<a href="home.jsp"><button>Cancel</button></a>
	<%
	String pid = request.getParameter("pid");
	String lname = request.getParameter("lname");
	String fname = request.getParameter("fname");
	String address = request.getParameter("address");
	String city = request.getParameter("city");
	if(pid == null || lname == null || fname==null || address == null || city == null)
		return;
	%>
	<%@ include file="dbconnection.jsp"%>
	<% 
	PreparedStatement crs = con.prepareStatement("insert into persons (pid,lastname,firstname,address,city) values(?,?,?,?,?)");
	crs.setString(1,pid );
	crs.setString(2,lname );
	crs.setString(3,fname );
	crs.setString(4,address );
	crs.setString(5,city );
	crs.executeUpdate();
	crs.close();
	
	%>
	<%-- <jsp:forward page="home.jsp">
		<jsp:param value="New User Has Been Added Successfully " name="message"/>
	</jsp:forward> --%>
	
	<% response.sendRedirect("home.jsp?message= Record Added Successfull"); %>
	
</body>
</html>