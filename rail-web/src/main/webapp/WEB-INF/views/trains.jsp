<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="locale"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	background: #ffeffb
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
		buttons:[{text:"Ok",click:submit},
			    {text:"Clear",click:clear}],
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
	
	function clear(){
		$("#num").val("");
		$("#start").val("");
		$("#stop").val("");
		$("#time").val("");
		$("#dialog").dialog("close");
	}
	function submit(){
		var request="addTrain?num="+$("#num").val()+"&fst="+$("#start").val()+"&lst="+$("#stop").val()+"&time="+$("#time").val();
		$.get(request);
		clear();
		
	}
</script>

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
		<h1>
			<locale:message code="trains.train" />
		</h1>
	</center>
  	<table class="trains">
		
			<tr>
				<th><locale:message code="numer" /></th>
				<th><locale:message code="trains.numTrain" /></th>
				<th><locale:message code="trains.startStation" /></th>
				<th><locale:message code="trains.stopStation" /></th>
				<th><locale:message code="trains.timeStart" /></th>
			</tr>
		
		<c:forEach items="${trList}" var="train" varStatus="loop">
			<tr>
				<td>${loop.index+1}.</td>
				<td>${train.numer}</td>
				<td>${train.firstStation}</td>
				<td>${train.lastStation}
				<td>${train.time}</td>
				<td><a href="delTrain?id=${train.id}"><locale:message
							code="delete" /></a></td>
				<td><a href="routeTrain?id=${train.id}"><locale:message
							code="trains.route" /></a></td>
			</tr>
		</c:forEach>

	</table>
	<br>
	
	<form action="addTrain" method="get" id="dialog" title="<locale:message code="trains.dialoginsert"/>">
	<div class="main">    
	    <div class="field">	
		<label><locale:message code="trains.numTrain"/></label>
		<input id="num"  type="text" name="num"
			placeholder=<locale:message code="trains.numTrain"/> /><br>
		</div>
		
		<div class="field">
		<label><locale:message code="trains.startStation"/></label> 
		<input id="start" type="text" name="fst"
			placeholder=<locale:message code="trains.startStation"/> /><br>
		</div>
	
		<div class="field">
		<label><locale:message code="trains.stopStation"/></label>
		<input id="stop" type="text" name="lst"
			placeholder=<locale:message code="trains.stopStation"/> /><br>
		</div>
		<div class="field">
		<label><locale:message code="trains.timeStart"/></label>
		<input id="time" type="time" name="time"
			placeholder=<locale:message code="trains.timeStart"/> /><br> 
		</div>
		
		<center>
		<input	type="submit" value=<locale:message code="insert"/> />
		
	</div>
	</form>
	<button id="show" type="button"><locale:message code="trains.dialoginsert"/></button>
	
</body>
</html>