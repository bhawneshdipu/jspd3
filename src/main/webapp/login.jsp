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
<title>LOGIN </title>
<link rel="stylesheet" type="text/css" href="style.css">
<script type="text/javascript" src="d3.min.js"></script>

<script type="text/javascript" src="test.js"></script>

</head>
<body>

<form action="home.jsp" method="post"  >
Name   :
<input type="text" id="user" name="user" ><br>
Password:
<input type="password" id="password" name="passowrd"><br>
Database: 
<input type="text" id="dbname" name="dbname"><br>
<input type="submit" value="submit">
</form>
  <sql:setDataSource var="snapshot" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost/jsonread" user="root"  password=""/>
 <sql:query var="result" dataSource="${snapshot}" >
show tables;
</sql:query>
