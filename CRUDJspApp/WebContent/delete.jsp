<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %>  
<%@ include file="dbconnection.jsp"%>
<%
String pid=request.getParameter("pid");
if(pid == null) {
	con.close();
	return;
}
PreparedStatement crs = con.prepareStatement("delete from persons where pid=?");
crs.setString(1,pid);
//int executeUpdate()
//Executes the 
//SQL statement in this PreparedStatement object, which must be an SQL INSERT, UPDATE or DELETE statement; or an SQL statement that returns nothing, such as a DDL statement.
crs.executeUpdate();
crs.close();
%>
    <%-- <jsp:forward page="home.jsp">
		<jsp:param value="User Record Has Been Deleted Successfully " name="message"/>
	</jsp:forward> 
	--%>
	<% response.sendRedirect("home.jsp?message= Record Deleted Successfull"); %>
	