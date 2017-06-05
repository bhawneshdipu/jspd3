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
  <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/jsonread" user="root"  password=""/>
 <sql:query var="result" dataSource="${snapshot}" >
SELECT * from matchtable;
</sql:query>
 
<table>
<tr>
   <th>NAME</th>
   <th>MATCH</th>
   <th>DATE</th>
   <th>Team 1 Key</th>
   <th>Team 1 Name</th>
   <th>Team 1 Code</th>
   <th>Team 2 Key</th>
   <th>Team 2 Name</th>
   <th>Team 2 Code</th>
   <th>Team 1 Score</th>
   <th>Team 2 Score</th>
   
   
 
</tr>

<c:forEach var="row" items="${result.rows}">
<script>
	name="${row.name}";
	dateArr.push("${row.date}");
	score1Arr.push("${row.score1}");
	score2Arr.push("${row.score2}");
	tnameArr.push("${row.t1code}");
	tnameArr.push("${row.t2code}");
	score.push("${row.score1}");
	score.push("${row.score2}");
</script>
<tr>

   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.matchname}"/></td>
 	<td><c:out value="${row.date}"/></td>
   <td><c:out value="${row.t1key}"/></td>
   <td><c:out value="${row.t1name}"/></td>
   <td><c:out value="${row.t1code}"/></td>
   <td><c:out value="${row.t2key}"/></td>
   <td><c:out value="${row.t2name}"/></td>
   <td><c:out value="${row.t2code}"/></td>
   <td><c:out value="${row.score1}"/></td>
   <td><c:out value="${row.score2}"/></td>
 
</tr>
</c:forEach>
</table>

<script type="text/javascript" src="axis.js"></script>
<script type="text/javascript" src="bar.js"></script>

<button type='button' onclick='one()'>click</button>
</body>
</html>