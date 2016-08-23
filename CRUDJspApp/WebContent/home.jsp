<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<link href="css/style.css" rel="stylesheet">
</head>
<body>

	<%@ include file="dbconnection.jsp" %>
	<% if(request.getParameter("message")!=null){
		
		out.print(request.getParameter("message"));
	} %>

	
	<p><a href="add.jsp" >Add</a></p>
	<table>
		<tr>
		    <th>Id</th>
			<th>Last Name</th>
			<th>First Name</th>
			<th>Address</th>
			<th>city</th>
			<th>Action</th>
		</tr>
		<%
	    PreparedStatement crs = con.prepareStatement("select * from persons");
		ResultSet rs = crs.executeQuery();
		if(!rs.next())
		{
			out.println("<h3>Sorry! No User Details found!</h3>");
			crs.close();
			return;
		}
				
	%>
		<% 
		while(rs.next())
				{
			%>
		<tr>
			<td>
			<%=rs.getString("pid") %>
			</td>
			<td>
			<%=rs.getString("lastname") %>
			</td>
			<td>
			<%=rs.getString("firstname") %>
			</td>
			<td>
			<%=rs.getString("address") %>
			</td>
			<td>
			<%=rs.getString("city") %>
			</td>
			<td>
			<a href ="edit.jsp?pid=<%=rs.getString("pid") %>" >Edit</a>/<a href ="delete.jsp?pid=<%=rs.getString("pid") %>" >Delete</a>
			
			</td>
			
		</tr>
		<%
				}crs.close();
			
		%>
	</table>
	
	
	

</body>
</html>
