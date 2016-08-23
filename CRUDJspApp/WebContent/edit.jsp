<%@page import="oracle.jdbc.rowset.OracleCachedRowSet"%>
<%@page import="javax.sql.rowset.CachedRowSet"%>
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
<%@ include file="dbconnection.jsp"%>
<%
    String pid=request.getParameter("pid");
	PreparedStatement crs=con.prepareStatement("select * from persons where pid=?");
    crs.setString(1,pid);
    ResultSet rs = crs.executeQuery();
    while(rs.next()){
    %>
   
	<form action="edit.jsp" method="post">
		<p>Enter PId:</p>
		<p>
			<input type="number" name="pid"  value="<%=rs.getString("pid") %>" required disabled="disabled" />
		</p>
		<p>Enter Last Name:</p>
		<p>
			<input type="text" name="lname" value="<%=rs.getString("lastname") %>" required />
		</p>
		<p>Enter First Name:</p>
		<p>
			<input type="text" name="fname" value="<%=rs.getString("firstname") %>" required />
		</p>
		<p>Enter Address:</p>
		<p>
			<input type="text" name="address" value="<%=rs.getString("address") %>" required />
		</p>
		<p>Enter city:</p>
		<p>
			<input type="text" name="city"  value="<%= rs.getString("city") %>"required />
		</p>
		<p>
		<input type="hidden" name="hpid" value="<%=rs.getString("pid") %>"/>
			<input type="submit" name="Update Persons Details" />
			
		</p>
	</form>
    <%} %>
	<a href="home.jsp"><button>Cancel</button></a>
	<%
	String hpid = request.getParameter("hpid");
	String lname = request.getParameter("lname"); 
	String fname = request.getParameter("fname"); 
	String address=request.getParameter("address"); 
	String city=request.getParameter("city"); 
   
	if(hpid == null ||lname ==null || fname ==null || address==null || city == null)
	{
		con.close();
		return;
	}
	System.out.println(hpid);
	PreparedStatement ps=con.prepareStatement("update persons set lastname=?,firstname=?,address=?,city=? where pid =?"); 
	ps.setString(1,lname);
	ps.setString(2,fname);
	ps.setString(3,address);
	ps.setString(4,city);
	ps.setString(5,hpid);
	ps.executeUpdate();
	
	ps.close();
	%>
	<%-- <jsp:forward page="home.jsp">
		<jsp:param value="User Record Has Been Updated Successfully " name="message"/>
	</jsp:forward> --%>
	
	<% response.sendRedirect("home.jsp?message=Record Updated Successfull"); %>
	
</body>
</html>