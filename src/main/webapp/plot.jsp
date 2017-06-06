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
<style> /* set the CSS */

.line {
  fill: none;
  stroke: steelblue;
  stroke-width: 2px;
}
.chart {

}

.main text {
    font: 10px sans-serif;	
}

.axis line, .axis path {
    shape-rendering: crispEdges;
    stroke: black;
    fill: none;
}

circle {
    fill: steelblue;
}
.scatterline {
  fill: none;
  stroke: none;
  stroke-width: 2px;
}
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>INDEX </title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="d3.min.js"></script>

<script type="text/javascript" src="test.js"></script>
<script>
var col1Arr=[];
var col2Arr=[];


</script>
</head>
<body>


<%
	String table=(String)request.getParameter("table");
	String column1=(String)request.getParameter("column1");
	String column2=(String)request.getParameter("column2");
	String graph_type=(String)request.getParameter("graph_type");

	String user=(String)request.getParameter("user");
	String pass=(String)request.getParameter("password");
	String db=(String)request.getParameter("dbname");
	String dburl="jdbc:mysql://localhost/"+db;
	//out.print(user+pass+db+dburl);
%>
  <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver" url="<%=dburl %>" user="<%=user %>"  password=""/>
 <sql:query var="result" dataSource="${snapshot}" >
SELECT <%=column1 %>,<%=column2 %> from <%=table %>;
</sql:query>

	<table>
		<tr>
			<th><%=column1 %></th>
			<th><%=column2 %></th>


		</tr>

		<c:forEach var="row" items="${result.rows}">
			<%
				int i = 0;
			%>
			<tr>
				<c:forEach var="column" items="${row}">
					<td><c:out value="${column.value}"></c:out> 
					<c:set var="i" value="<%=i%>" /> 
					<c:choose>

							<c:when test="${i==0}">
								<script>
								//alert(col1Arr);
									col1Arr.push("${column.value}");
								</script>
							</c:when>
							<c:otherwise>
								<script>
								//alert(col2Arr);
									col2Arr.push("${column.value}");
								</script>
							</c:otherwise>
							</c:choose>
							</td>
							<%
							if (i==0){
								i=1;
								}else{
									i=0;
								}
								%>
							
				</c:forEach>

			</tr>
		</c:forEach>
	</table>
<c:set var="graph" value="<%=graph_type%>" /> 
					<c:choose>

							<c:when test="${graph == 'bar' }">
<script type="text/javascript" src="bar.js"></script>
							</c:when>
							<c:when test="${graph == '2bar' }">
<script type="text/javascript" src="2bar.js"></script>
							</c:when>
			<c:when test="${graph== 'line' }">
<script type="text/javascript" src="line.js"></script>
							</c:when>
							
							<c:otherwise>
<script type="text/javascript" src="scatter.js"></script>
							</c:otherwise>
							</c:choose>

</body>
</html>