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
	.lists  {
	background: #aacbad
	}
	

	.orders  {
	background: #dddddd
	}

	.orders tr:hover {
	background: #aaaaaa
	}
	</style>
</head>
<body>
	<a href="trains"><locale:message code="trains.trains" /></a>
	<a href="stations"><locale:message code="trains.stations" /></a>
	<a href="order"><locale:message code="trains.orders" /></a>
	<a href="orderlist"><locale:message code="trains.allOrders" /></a>

	<center>
		<h1><locale:message code="order.buyInTrain" /></h1>
	</center>
	<br>
	<p>
	
		<locale:message code="order.selectTrain" /> <locale:message code="order.selectFrom" /> ${startstation.nameStation}
		<locale:message code="order.selectIn" />  ${stopstation.nameStation}
		
	</p>
	<c:forEach items="${allListTrain}" var="allListTrain" varStatus="loop">
		<table class="orders">
			
				<tr>
					<th><locale:message code="numer" /></th>
					<th><locale:message code="trains.numTrain" /></th>
					<th><locale:message code="trains.startStation" /></th>
					<th><locale:message code="trains.stopStation" /></th>
					<th><locale:message code="trains.timeStart" /></th>
					<th><locale:message code="routers.price" /></th>

					
				</tr>
			
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
					&price=${allListTrain.summPrice}"> <locale:message code="order.buyTicket" /></a></td>
			</tr>
			<table class="lists">
				
					<tr>
						<th><h5><locale:message code="stations.station" /></h5></th>
						<th><h5><locale:message code="price" /></h5></th>
						<th><h5><locale:message code="trains.timeStart" /></h5></th>
						<th><h5><locale:message code="routers.timeStop" /></h5></th>
					</tr>
				
				<c:forEach items="${allListTrain.listTrainStations}"
					var="routetrain" varStatus="loop">
					<tr>
						
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