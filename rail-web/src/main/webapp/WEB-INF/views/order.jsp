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
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="/css/train.css">
    <link type="text/css" href="/ui/jqueryui.custom.css" rel="stylesheet" />
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
	.trains tr:nth-child(odd) {
	background: #ffffff
	}

	.trains tr:nth-child(even) {
	background: #dddddd
	}

	.trains tr:hover {
	background: #aaaaaa
	}

	label {
	float:left;
	}
	.field {clear:both; 
	text-align:right;
	}
	.main {float:left}
  </style>
  <script type="text/javascript">

	$(function() {
	
    $('#dialog').dialog({
		autoOpen: false,
		modal:true,
		resizable:false,
		open: function() {
					$('.ui-dialog-titlebar-close').bind('click', function() {
						$('#dialog').dialog('close');
					})
				}
	});
	
	$('button').button().click(function(e) {
        $('#dialog').dialog("open")
    	});
			
	});
	
	
</script>
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

	<form action="openorder" id="dialog" title="<locale:message code="trains.dialogorder"/>">
		<div class="main">    
	    	
		<locale:message code="order.stationArrival" />
		<div class="field">
		<select name="arrivalId" style="height : 23px; width : 163px;">
			<c:forEach items="${stationArrivalList}" var="stationArrival">

				<option value="${stationArrival.id}">${stationArrival.nameStation}</option>
			</c:forEach>

		</select> 
		</div>
		 <br><locale:message code="order.stationDeparture" />
		<div class="field">
		<select name="departId" style="height : 23px; width : 164px;">
			<c:forEach items="${stationDepartureList}" var="stationDeparture">
				<option value="${stationDeparture.id}">${stationDeparture.nameStation}</option>
			</c:forEach>

		</select>
		</div>
		<br> <input type="submit" value=<locale:message code="select" />>
		</div>
	</form>
	<button id="show" type="button"><locale:message code="trains.dialogorder"/></button>

</body>
</html>