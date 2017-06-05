<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSON JSP </title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="d3.min.js"></script>

<script type="text/javascript" src="test.js"></script>

</head>
<body>




<%
	String user=(String)request.getParameter("user");
	String pass=(String)request.getParameter("password");
	String db=(String)request.getParameter("dbname");
	String dburl="jdbc:mysql://localhost/"+db;
	out.print(user+pass+db+dburl);
%>
 <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver" url="<%=dburl %>" user="<%=user %>"  password="<%=pass %>"/>

 <sql:query var="result" dataSource="${snapshot}" >


select distinct(table_name) from information_schema.columns
where table_schema = '<%=db %>'
order by table_name,ordinal_position


</sql:query>
 
Table Name:<select name="table" id="table">
<c:forEach var="row" items="${result.rows}">
 <c:out value="<option value=${row.table_name}>${row.table_name}</option>"/>
</c:forEach>
  
</select>

<script type="text/javascript" src="axis.js"></script>
<script type="text/javascript" src="bar.js"></script>
 
</body>
</html>