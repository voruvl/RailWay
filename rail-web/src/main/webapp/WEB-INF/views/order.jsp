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
<style>
form {
	max-width: 500px;
	margin: 0 auto;
	padding-top: 20px;
}

form button.small {
	padding: 8px 17px;
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
			<locale:message code="trains.dialogorder" />
		</h1>
	</center>
	<br>
	<div id="left" ng-app="">
		<form action="openorder" id="dialog"
			title="<locale:message code="trains.dialogorder"/>">

			<div class="row">
				<div class="small-5 columns">
					<label class="right inline"><locale:message
							code="order.stationArrival" /></label>
				</div>
				<div class="small-7 columns">
					<select name="arrivalId">
						<c:forEach items="${stationArrivalList}" var="stationArrival">

							<option value="${stationArrival.id}">${stationArrival.nameStation}</option>
						</c:forEach>

					</select>
				</div>
			</div>
			<div class="row">
				<div class="small-5 columns">
					<label class="right inline"><locale:message
							code="order.stationDeparture" /></label>
				</div>
				<div class="small-7 columns">
					<select name="departId">
						<c:forEach items="${stationDepartureList}" var="stationDeparture">
							<option value="${stationDeparture.id}">${stationDeparture.nameStation}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<button id="show" class="btn btn-success" type="send">
				<locale:message code="trains.dialogorder" />
				<span class="glyphicon glyphicon-ok"></span>
			</button>
		</form>
	</div>
</body>
</html>