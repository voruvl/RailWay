<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Железнодорожные станции</title>
 <style>
	table, th, td
{
border-style:solid;
border-width:1px;
border-collapse:collapse;
padding:2px;
}
th
{
height:28px;
background-color:#f892dc;
color:black;
border-color:black;
}
.stations tr:nth-child(odd) {background: #ffffff}
.stations tr:nth-child(even) {background: #ffeffb}
.stations tr:hover {background: #999}
  </style>
</head>
<body>
	<a href="trains"><locale:message code="trains.trains" /></a>
	<a href="stations"><locale:message code="trains.stations" /></a>
	<a href="order"><locale:message code="trains.orders" /></a>
	<a href="orderlist"><locale:message code="trains.allOrders" /></a>
	
	<center>
		<h1><locale:message code="stations.stations" /></h1>
	</center>
	<form action="addStation" method="get">
		<input type="text" name="namestation" placeholder=<locale:message code="stations.nameStation" /> /><br>
		<input type="submit" value=<locale:message code="insert" /> /><br>
	</form>
	<table class="stations">
		
			<tr>
				<th><locale:message code="numer" /></th>
				<th><locale:message code="stations.nameStation" /></th>

			</tr>
		

		<c:forEach items="${stList}" var="station" varStatus="loop">

			<tr>
				<td>${loop.index+1}.</td>
				<td>${station.nameStation}</td>
				<td><a href="delStation?id=${station.id}"><locale:message code="delete" /></a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>