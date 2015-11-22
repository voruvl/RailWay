<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Железнодорожные станции</title>
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

#stations {
	margin: 0 auto;
}

#stations button.tiny {
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
			<locale:message code="stations.stations" />
		</h1>
	</center>
	<div id="left" ng-app="">
	<form action="addStation" method="get" id="dialog"
		title="<locale:message code="stations.dialoginsert"/>">

		<div class="row">
			<div class="small-5 columns">
				<label class="right inline"><locale:message
						code="stations.nameStation" /></label>
			</div>
			<div class="small-7 columns">
				<input id="nameStation" type="text" name="namestation"
					placeholder=<locale:message code="stations.nameStation"/> />
			</div>
		</div>
		<button id="show" class="btn btn-success" type="send">
			<locale:message code="stations.dialoginsert" />
			<span class="glyphicon glyphicon-save"></span>
		</button>
	</form>
	</div>
	<br>
	<div id="right">
	<table id="stations">
		<thead>
			<tr>
				<th><locale:message code="numer" /></th>
				<th><locale:message code="stations.nameStation" /></th>
				<th></th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${stList}" var="station" varStatus="loop">
				<tr>
					<td>${loop.index+1}.</td>
					<td>${station.nameStation}</td>
					<td><a href="delStation?id=${station.id}"
						class="btn btn-danger btn-xs"><locale:message code="delete" /><span
							class="glyphicon glyphicon-trash"></span></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>