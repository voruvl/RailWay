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
	<span style="float: right"> <a href="?lang=en">en</a> <a
		href="?lang=ru">ru</a>
	</span>
	<center>
		<h3>
			<locale:message code="trains.train" />
		</h3>

	</center>
	<form action="addTrain" method="get">
		<input type="text" name="num" placeholder=<locale:message code="trains.numTrain"/> /><br>
		<input type="text" name="fst" placeholder=<locale:message code="trains.startStation"/> /><br>
		<input type="text" name="lst" placeholder=<locale:message code="trains.stopStation"/> /><br>
		<input type="time" name="time" placeholder=<locale:message code="trains.timeStart"/> /><br>
		<input type="submit" value=<locale:message code="insert"/> /><br>
	</form>
	<table>
		<thead>
			<tr>
				<td><locale:message code="numer"/></td>
				<td><locale:message code="trains.numTrain"/></td>
				<td><locale:message code="trains.startStation"/></td>
				<td><locale:message code="trains.stopStation"/></td>
				<td><locale:message code="trains.timeStart"/></td>
			</tr>
		</thead>
		<c:forEach items="${trList}" var="train" varStatus="loop">
			<tr>
				<td>${loop.index+1}.</td>
				<td>${train.numer}</td>
				<td>${train.firstStation}</td>
				<td>${train.lastStation}
				<td>${train.time}</td>
				<td><a href="delTrain?id=${train.id}"><locale:message code="delete"/></a></td>
				<td><a href="routeTrain?id=${train.id}"><locale:message code="trains.route"/></a></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>