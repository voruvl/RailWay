<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/foundation.min.css">

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
form {
	max-width: 500px;
	margin: 0 auto;
	padding-top: 20px;
}

form button.small {
	padding: 8px 17px;
}

#orders {
	margin: 0 auto;
}
</style>
</head>
<body>
	<a href="trains" class="btn btn-info btn-xs"><locale:message
			code="trains.trains" /></a>
	<a href="stations" class="btn btn-info btn-xs"><locale:message
			code="trains.stations" /></a>
	<a href="order" class="btn btn-info btn-xs"><locale:message
			code="trains.orders" /></a>
	<a href="orderlist" class="btn btn-info btn-xs"><locale:message
			code="trains.allOrders" /></a>
	<center>
		<h1>
			<locale:message code="trains.allOrders" />
		</h1>
	</center>
	<br>

	<table id="orders">
		<thead>
			<tr>
				<th><locale:message code="numer" /></th>
				<th><locale:message code="trains.numTrain" /></th>
				<th><locale:message code="trains.startStation" /></th>
				<th><locale:message code="trains.timeStart" /></th>
				<th><locale:message code="trains.stopStation" /></th>
				<th><locale:message code="routers.timeStop" /></th>
				<th><locale:message code="routers.price" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orders}" var="order" varStatus="loop">
				<tr>
					<td>${loop.index+1}.</td>
					<td>${order.train.firstStation}-${order.train.lastStation}</td>
					<td>${order.startStation.station.nameStation}</td>
					<td>${order.startStation.timeArrival}</td>
					<td>${order.stopStation.station.nameStation}</td>
					<td>${order.stopStation.timeDeparture}</td>
					<td>${order.price}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>