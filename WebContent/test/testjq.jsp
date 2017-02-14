<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.rootPath}/js/jquery-1.10.2.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#btn").click(function(){
				$("#reddiv").fadeToggle(2000);
				$("#greendiv").fadeToggle("slow");
			});
		});
		
		$(document).ready(function(){
			$("#flip").click(function(){
				$("#panel").slideToggle(300);
			});
		});
	</script>
	<style type="text/css">
		div#panel,p#flip{
			margin: 0px;
			padding: 4px;
			text-align: center;
			background: #F4FFDD;
			border: solid 1px #B2B2B2;
		 }
		 div#panel{
		 	height: 110px;
		 	
		 }
	</style>
</head>
<body>
	<button id="btn">淡入和淡出切换</button>
	<br>
	<div id="reddiv" style="width:100px; height: 100px;background-color: red;"></div>
	<br>
	<div id="greendiv" style="width:100px; height: 100px;background-color: green;"></div>
	<p>段落以两秒的速度隐藏</p>
	
	<div id="panel">
		<p>$(selector).slideDown(speed,callback);</p>
		<p>$(selector).slideUp(speed,callback);</p>
		<p>$(selector).slideToggle(speed,callback);</p>
		
	</div>
	<p id="flip">单机这里滑动</p>
</body>
</html>