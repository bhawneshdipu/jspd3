<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	String user=(String)request.getParameter("user");
	String pass=(String)request.getParameter("password");
	String db=(String)request.getParameter("dbname");
	String dburl="jdbc:mysql://localhost/"+db;
	String table=(String)request.getParameter("table");
	//out.print(user+pass+db+dburl);
%>
 <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver" url="<%=dburl %>" user="<%=user %>"  password="<%=pass %>"/>
 <sql:query var="result" dataSource="${snapshot}" >
SELECT `COLUMN_NAME`,`DATA_TYPE` 
FROM `INFORMATION_SCHEMA`.`COLUMNS` 
WHERE `TABLE_SCHEMA`='<%=db %>' 
    AND `TABLE_NAME`='<%=table %>';
</sql:query>
 Column Name1:<select name="column1" id="column1">
<option value="">select</option>
<c:forEach var="row" items="${result.rows}">
<option value='<c:out value="${row.column_name }"></c:out>'><c:out value="${row.column_name}   (${row.data_type })"/></option></c:forEach>  
</select>
 Column Name2:<select name="column2" id="column2">
<option value="">select</option>
<c:forEach var="row" items="${result.rows}">
<option value='<c:out value="${row.column_name }"></c:out>'><c:out value="${row.column_name}   (${row.data_type })"/></option></c:forEach>  
</select><br>
Graph Type:<select name="graph_type" id="graph_type">
<option> select</option>
<option value="bar">Bar Graph </option>

<option value="2bar">2-Bar Graph </option>
<option value="scatter">Scatter Graph</option>
<option value="line">Line Graph</option>


</select> 