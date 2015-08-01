<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Поезда</title>
</head>
<body>
	<a href="trains"><locale:message code="trains.trains" /></a>
	<a href="stations"><locale:message code="trains.stations" /></a>
	<a href="order"><locale:message code="trains.orders" /></a>
	<a href="orderlist"><locale:message code="trains.allOrders" /></a>
	
	<center>
		<h1><locale:message code="routes.routes" /></h1>
	</center>
	<br>
	<h3><locale:message code="trains.train" /> <locale:message code="numer" /> ${train.numer}
		${train.firstStation}-${train.lastStation} <locale:message code="trains.timeStart" />${train.time}</h3>
	<br>
	<p><locale:message code="routes.stops" /></p>
	<table>
		<thead>
			<tr>
				<td><locale:message code="numer" /></td>
				<td><locale:message code="stations.station" /></td>
				<td><locale:message code="trains.timeStart" /></td>
				<td><locale:message code="routers.timeStop" /></td>
				<td><locale:message code="routers.price" /></td>
			</tr>
		</thead>
		<c:forEach items="${routeStations}" var="stations" varStatus="loop">
			<tr>
				<td>${loop.index+1}.</td>
				<td>${stations.station.nameStation}</td>
				<td>${stations.timeArrival}</td>
				<td>${stations.timeDeparture}</td>
				<td>${stations.price}руб.</td>
				<td><a href="delRoute?id=${stations.id}"><locale:message code="delete" /></a></td>
				<td></td>
			</tr>
		</c:forEach>

	</table>
	<br>
	<br>
	<form action="addrouteTrain">
		<select name="stationId">
			<c:forEach items="${stationList}" var="station">

				<option value="${station.id}">${station.nameStation}</option>

			</c:forEach>
		</select> <input type="time" name="timeArrival" placeholder=<locale:message code="trains.timeStart" />>
		<input type="time" name="timeDeparture" placeholder=<locale:message code="routers.timeStop" />>
		<input type="numer" name="price" placeholder=<locale:message code="routers.price" />>
		<input type="hidden" name="trainId" value="${train.id}"> <input
			type="submit" value=<locale:message code="insert" />>
	</form>
	<br>
</body>
</html>
