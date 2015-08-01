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
		<h1>Покупка билета на поезд</h1>
	</center>
	<br>
	<p>
	
		<locale:message code="order.selectTrain" /> <locale:message code="order.selectFrom" /> ${startstation.nameStation}
		<locale:message code="order.selectIn" />  ${stopstation.nameStation}
		
	</p>
	<c:forEach items="${allListTrain}" var="allListTrain" varStatus="loop">
		<table>
			<thead>
				<tr>
					<td><locale:message code="numer" /></td>
					<td><locale:message code="trains.numTrain" /></td>
					<td><locale:message code="trains.startStation" /></td>
					<td><locale:message code="trains.stopStation" /></td>
					<td><locale:message code="trains.timeStart" /></td>
					<td><locale:message code="routers.price" /></td>

					<td></td>
				</tr>
			</thead>
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
					&price=${allListTrain.summPrice}">Купить билет</a></td>
			</tr>
			<table>
				<thead>
					<tr>
						<td></td>
						<td></td>
						<td><h5>Станция</h5></td>
						<td><h5>Цена</h5></td>
						<td><h5>Время приб.</h5></td>
						<td><h5>Время отпр.</h5></td>
					</tr>
				</thead>
				<c:forEach items="${allListTrain.listTrainStations}"
					var="routetrain" varStatus="loop">
					<tr>
						<td></td>
						<td></td>
						<td>${routetrain.station.nameStation}</td>
						<td>${routetrain.price}</td>
						<td>${routetrain.timeArrival}</td>
						<td>${routetrain.timeDeparture}</td>
					</tr>
				</c:forEach>
			</table>
		</table>
	</c:forEach>
</body>
</html>