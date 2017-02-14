<%@page import="com.sun.xml.internal.bind.v2.schemagen.xmlschema.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>显示结果页面</title>
</head>
<body>
	<div class="jumbotron">
	<p>您好，这是普通用户内容页，您是${user.getUsername() } ：欢迎进入本页！</p>
	<ul>
		<li ><a href="#">图书信息</a></li>
		<li ><a href="#">购物车</a></li>
		<li ><a href="#">订单管理</a></li>
		<li ><a href="#" onclick="history.back()">退出</a></li>
	</ul>
	</div>
</body>
</html>