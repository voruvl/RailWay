<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>jQuery UI</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script src="//ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/jquery-ui.min.js"></script>
    <link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/sunny/jquery-ui.css">
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

<script>	
$(function() {
	
    $.get('flowers.html', function(data) {
		 $(data).filter('div').addClass('dcell')
		        .slice(0, 3).appendTo('#row1').end().end()
		        .slice(3).appendTo('#row2')
	});
		
});
</script>
</head>
<body>
    <h1>Цветочный магазин</h1>
    <form method="post">
        <div id="oblock">        
            <div class="dtable">
                <div id="row1" class="drow"></div>
                <div id="row2" class="drow"></div>            
            </div>
        </div>
        <div id="buttonDiv"><button type="submit">Заказать</button></div>                    
    </form>
</body>
<style>
h1 {
    min-width: 70px; border: thick double black; margin-left: auto;
    margin-right: auto; text-align: center; font-size: x-large; padding: .5em;
    color: darkgreen; background-image: url("http://professorweb.ru/downloads/jquery/border.png");
    background-size: contain; margin-top: 0;
}
.dtable {display: table;}
.drow {display: table-row;}       
.dcell {display: table-cell; padding: 10px;}
.dcell > * {vertical-align: middle}
input {width: 2em; text-align: right; border: thin solid black; padding: 2px;}
label {width: 6em;  padding-left: .5em; display: inline-block;}
#buttonDiv {text-align: center;}
button {padding: 12px;}
#oblock {display: block; margin-left: auto; margin-right: auto; min-width: 700px; }
</style>
</html>