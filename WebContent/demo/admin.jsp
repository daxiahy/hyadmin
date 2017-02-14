<%@page import="com.bd.pojo.Pager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.bd.pojo.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户信息管理中心</title>
<script type="text/javascript"
	src="${initParam.rootPath}/js/jquery-1.10.2.js"></script>

<style type="text/css">
	.btn{width:100px;background-color: #FAFAFA;height: 25px;border-radius:6px}
	p{text-align: center;margin: 10px;}
	.centerAlign{width:80%;margin: auto;}
	span{color:blue}
	tr{height: 33px;}
	th{text-align: center; }
	.line1{background-color: #FAFAFA}
	.line2{background-color: #F0F8FF}
</style>
</head>
<body>
<div id="head">
	<p>欢迎管理员<span style="color:red">admin</span>登录用户信息管理中心！</p>
	<p><span style="float:right;"><a href="${initParam.rootPath}/demo/login.jsp">[退出系统]</a></span></p>
	<hr />
</div>
<div id="find" style="background-color: #FAFAFA"  class="centerAlign">
	<form name="form1" action="${initParam.rootPath}/Servlet/getUsers.do" method="post">
		<p style="padding-top: 10px;">
			<span>用户名：</span>
			<input name="username" id="username" value="${param.username}"  style="width: 100px;"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
			<span>身份标识:</span>
			<select name="sfbz" id="sfbz" style="width: 100px;">
				<option value="" ${param.sfbz==""?"selected":""}>请选择</option>
				<option value="3"  ${param.sfbz=="3"?"selected":""}>学生</option>
				<option value="5" ${param.sfbz=="5"?"selected":""}>老师</option>
			</select>
		</p>
		<p>
			<input type="submit" value="查询" class="btn"/>
			<input type="button" value="重置"  class="btn" onclick="doClear()"/>
		</p>	
	</form>
	<hr/>
</div>
<div id="content" style="height: 430px;overflow: auto;"  class="centerAlign">
	<table class="table table-hover" style="width: 100% ;text-align: center;" >
		<tr style="background-color: lightblue">
			<th>用户编号</th>
			<th>用户名</th>
			<th>用户密码</th>
			<th>用户身份</th>
			<th>用户注册时间</th>
			<th>操作</th>
		</tr>
		<tbody>
		<c:if test="${not empty listUsers }">
			<c:forEach items="${listUsers }" var="yh" varStatus="status">
				<tr class='${status.index % 2 == 0 ? "line1" : "line2" }'>
					<td>${pager.minNum + status.index }</td>
					<td>${yh.username}</td>
					<td>${yh.pwd}</td>
					<td>${yh.sfbz}</td>
					<td>${yh.zcsj}</td>
					<td>
						<a href="#" onclick="deleteUser('${yh.yhbh}')">删除</a>
						<a href="${initParam.rootPath}/demo/update.jsp?username=${yh.username}">修改</a>
					</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="6">
					<jsp:include page="pager.jsp"></jsp:include>
				</td>
			</tr>
		</c:if>
		
		</tbody>
		
	</table>
</div>
<div id="foot">
	<hr /> 
	<p align="center">daxiahy@163.com&copy;2016</p>
</div>
<script type="text/javascript">
function deleteUser(yhbh){
	var ret = confirm("是否确认删除？");
	if(ret){
		var url=  "${initParam.rootPath}/Servlet/deleteUser.do?yhbh="+yhbh;
		$.getJSON(url,function(resultMsg){
			if(resultMsg.msgCode==1){
				form1.submit();
			}else{
				alert("删除失败！");
			}
		});
	}
}
//重置
function doClear(){
	$("#username").val("");
	$("#sfbz").val("");
}
</script>
</body>
</html>