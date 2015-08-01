<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="trains"><locale:message code="trains.trains" /></a>
	<a href="stations"><locale:message code="trains.stations" /></a>
	<a href="order"><locale:message code="trains.orders" /></a>
	<a href="orderlist"><locale:message code="trains.allOrders" /></a>
	
	<center>
		<h1><locale:message code="trains.allOrders" /></h1>
	</center>
	<br>

	<table>
		<thead>
			<tr>
				<td><locale:message code="numer" /></td>
				<td><locale:message code="trains.numTrain"/></td>
				<td><locale:message code="trains.startStation"/></td>
				<td><locale:message code="trains.timeStart"/></td>
				<td><locale:message code="trains.stopStation"/></td>
				<td><locale:message code="routers.timeStop"/></td>
				<td><locale:message code="routers.price"/></td>
				
			</tr>
		</thead>
		<c:forEach items="${orders}" var="order" varStatus="loop">
			<tr>
				<td>${loop.index+1}.</td>
				<td>${order.train.firstStation}-${order.train.lastStation}</td>
				<td>${order.startStation.station.nameStation}</td>
				<td>${order.startStation.timeDeparture}</td>
				<td>${order.stopStation.station.nameStation}</td>
				<td>${order.stopStation.timeArrival}</td>
				<td>${order.price}</td>
				<td></td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>