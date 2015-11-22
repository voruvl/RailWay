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

#routers {
	margin: 0 auto;
}

#routers button.tiny {
	margin-bottom: 0;
	padding: 5px 10px;
}

#left {
	left: 0px;
	position: absolute;
}

#right {
	left: 400px;
	position: absolute;
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
			<locale:message code="trains.route" />
		</h1>
	</center>
	<br>
	<h3>
		<locale:message code="trains.trains" />
		<locale:message code="numer" />
		${train.numer} ${train.firstStation}-${train.lastStation}
		<locale:message code="trains.timeStart" />
		${train.time}
	</h3>
	
	<locale:message code="routes.stops" />
	<div id="left" ng-app="">
		<form action="addrouteTrain" method="get" id="dialog"
			title="<locale:message code="trains.route"/>">

			<div class="row">
				<div class="small-5 columns">
					<label class="right inline"><locale:message
							code="stations.station" /> </label>
				</div>
				<div class="small-7 columns">
					<select name="stationId" id="station">
						<c:forEach items="${stationList}" var="station">
							<option value="${station.id}">${station.nameStation}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<div class="row">
				<div class="small-5 columns">
					<label class="right inline"><locale:message
							code="trains.timeStart" /></label>
				</div>
				<div class="small-7 columns">
					<input type="time" name="timeArrival" id="tstart"
						placeholder=<locale:message code="trains.timeStart" />>
				</div>
			</div>

			<div class="row">
				<div class="small-5 columns">
					<label class="right inline"><locale:message
							code="routers.timeStop" /></label>
				</div>
				<div class="small-7 columns">
					<input type="time" name="timeDeparture" id="tstop"
						placeholder=<locale:message code="routers.timeStop" />>
				</div>
			</div>

			<div class="row">
				<div class="small-5 columns">
					<label class="right inline"><locale:message
							code="routers.price" /></label>
				</div>
				<div class="small-7 columns">
					<input type="text" name="price" id="price"
						placeholder=<locale:message code="routers.price" />>
				</div>
			</div>
			<center>
				<button id="show" class="btn btn-success" type="send">
					<locale:message code="insert" />
					<span class="glyphicon glyphicon-save"></span>
				</button>
				<input type="hidden" name="trainId" value="${train.id}">
	</div>
	</form>
	</div>
	<div id="right">
		<table id="routers">
			<thead>
				<tr>
					<th><locale:message code="numer" /></th>
					<th><locale:message code="stations.station" /></th>
					<th><locale:message code="trains.timeStart" /></th>
					<th><locale:message code="routers.timeStop" /></th>
					<th><locale:message code="routers.price" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${routeStations}" var="stations" varStatus="loop">
					<tr>
						<td>${loop.index+1}.</td>
						<td>${stations.station.nameStation}</td>
						<td>${stations.timeArrival}</td>
						<td>${stations.timeDeparture}</td>
						<td>${stations.price}$</td>
						<td><a href="delRoute?id=${stations.id}"
							class="btn btn-danger btn-xs"><locale:message code="delete" /><span
								class="glyphicon glyphicon-trash"></span></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
