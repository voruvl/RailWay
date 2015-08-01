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
		<h1><locale:message code="order.selectTrain" /></h1>
	</center>
	<br>

	<form action="openorder">
		<locale:message code="order.stationArrival" /><select name="arrivalId" style="height : 23px; width : 163px;">
			<c:forEach items="${stationArrivalList}" var="stationArrival">

				<option value="${stationArrival.id}">${stationArrival.nameStation}</option>
			</c:forEach>

		</select>  <br><locale:message code="order.stationDeparture" /> <select name="departId" style="height : 23px; width : 164px;">
			<c:forEach items="${stationDepartureList}" var="stationDeparture">

				<option value="${stationDeparture.id}">${stationDeparture.nameStation}</option>
			</c:forEach>

		</select><br> <input type="submit" value=<locale:message code="select" />>
	</form>

</body>
</html>