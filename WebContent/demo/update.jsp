<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="${initParam.rootPath}/js/jquery-1.10.2.js"></script>
</head>

<body>
	<fieldset style="margin: 150px auto; width: 250px; border-radius: 6px;">
		<legend>用户修改</legend>
		<div>
			<form action="${initParam.rootPath}/Servlet/updateUser.do"
				name="form1" method="post" onsubmit="return checkUser()">
				<table>
					<tr>
						<td><input class="form-control" type="text" name="username"
							id="username" readonly="readonly" value="${param.username }" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="password" name="pwd"
							id="pwd" onblur="checkPwd()" placeholder="密码" /></td>
					</tr>
					<tr>
						<td><input class="form-control" type="password" name="pwd2"
							id="pwd2" onblur="checkPwd2()" placeholder="确认密码" /></td>
					</tr>
					<tr>
						<td><span class="help-block"> <a
								onclick="history.back()">不修改了？</a>
						</span></td>
					</tr>
					<tr>
						<td><button class="btn" type="submit">提交修改</button> <span
							id="Prompt" style="width: 130px; color: red"></span></td>
					</tr>
				</table>
			</form>
		</div>
	</fieldset>
	<script type="text/javascript">
		function checkPwd() {

			if ($("#pwd").val().length != 6) {
				$("#Prompt").html("密码必须是6位！");
				return false;
			} else {
				return true;
			}
		}
		function checkPwd2() {
			if ($("#pwd2").val() != $("#pwd").val()) {
				$("#Prompt").html("密码不一致！");
				return false;
			} else {
				return true;
			}
		}
		function checkUser() {
			if (!checkPwd()) {
				return false;
			}
			if (!checkPwd2()) {
				return false;
			}
			return true;
		}
	</script>
</body>

</html>