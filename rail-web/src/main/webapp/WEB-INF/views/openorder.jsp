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
<script
	src="http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/foundation/5.5.3/css/foundation.min.css">

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Поезда</title>
<style>
form {
	max-width: 500px;
	margin: 0 auto;
	padding-top: 20px;
}

form button.small {
	padding: 8px 17px;
}

#lists {
	margin: 0 auto;
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
			<locale:message code="order.buyInTrain" />
		</h1>
	</center>
	<br>
	<p>

		<locale:message code="order.selectTrain" />
		<locale:message code="order.selectFrom" />
		${startstation.nameStation}
		<locale:message code="order.selectIn" />
		${stopstation.nameStation}

	</p>
	<c:forEach items="${allListTrain}" var="allListTrain" varStatus="loop">
		<table id="orders">
			<thead>
				<tr>
					<th><locale:message code="numer" /></th>
					<th><locale:message code="trains.numTrain" /></th>
					<th><locale:message code="trains.startStation" /></th>
					<th><locale:message code="trains.stopStation" /></th>
					<th><locale:message code="trains.timeStart" /></th>
					<th><locale:message code="routers.price" /></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${loop.index+1}.</td>
					<td>${allListTrain.train.numer}</td>
					<td>${allListTrain.train.firstStation}</td>
					<td>${allListTrain.train.lastStation}
					<td>${allListTrain.train.time}</td>
					<td>${allListTrain.summPrice}</td>
					<td><a
						href="createorders?trainId=${allListTrain.train.id}
					&firstStation=${startstation.id}
					&lastStation=${stopstation.id}
					&price=${allListTrain.summPrice}"
						class="btn btn-primary btn-xs"> <locale:message
								code="order.buyTicket" /><span
							class="glyphicon glyphicon-ok"></span>
					</a></td>
				</tr>
			</tbody>
			<table id="lists">
				<thead>
					<tr>
						<th><locale:message code="stations.station" /></th>
						<th><locale:message code="price" /></th>
						<th><locale:message code="trains.timeStart" /></th>
						<th><locale:message code="routers.timeStop" /></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${allListTrain.listTrainStations}"
						var="routetrain" varStatus="loop">
						<tr>

							<td>${routetrain.station.nameStation}</td>
							<td>${routetrain.price}</td>
							<td>${routetrain.timeArrival}</td>
							<td>${routetrain.timeDeparture}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

		</table>
	</c:forEach>
</body>
</html>