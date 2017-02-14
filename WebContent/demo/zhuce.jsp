<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>注册</title>
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<script type="text/javascript"
	src="${initParam.rootPath}/js/jquery-1.10.2.js"></script>
</head>
<body>
	<fieldset style="margin: 150px auto; width: 250px; border-radius: 6px;">
		<legend>用户注册</legend>
		<form name="form1" 
			method="post"
			>
			
			<table>
				<tr>
					<td>用户名：</td>
					<td><input class="form-control" name="username" id="username" maxlength="16"
						onblur="checkYhm()" /></td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;码：</td>
					<td><input class="form-control" type="password" name="pwd" id="pwd" maxlength="6"
						onblur="checkPwd()" /></td>
				</tr>
				<tr>
					<td>确认密码：</td>
					<td><input class="form-control" type="password" name="pwd2" id="pwd2" maxlength="6"
						onblur="checkPwd2()" /></td>
				</tr>
				<tr>
					<td>身份标识：</td>
					<td><input type="radio" name="sfbz" id="sfbz3" value="3"
						id="xs" checked="checked" /><label for="xs">学生</label> <input
						type="radio" name="sfbz" id="sfbz5" value="5" id="js" /><label
						for="js">老师</label></td>
				</tr>
				<tr>
					<td colspan="2" style="font-size: 10px;"><span
						style="color: red;" id="warn">${msg}</span> <a
						style="float: right; color: blue"
						href="${initParam.rootPath}/demo/login.jsp">已有账户</a></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="button" value="注册" onclick="javascript:zhuce()" style="width: 70px" /> <input
						type="reset" value="重置" style="width: 70px" /></td>
				</tr>
			</table>
			
		</form>
	</fieldset>
	<script type="text/javascript">
		function zhuce(){
			if(checkUser()){
			var url="${initParam.rootPath}/Servlet/regester.do";	
			$.getJSON(url,$("form").serialize(),function(zc){
				if(zc.msgCode == 1){
					alert("注册成功！"); 
					location="${initParam.rootPath}/demo/login.jsp";
					
				}else{
					alert("注册失败！");
				}
			});
			}
		}
	
		function checkYhm() {
			if ($("#username").val() == "") {
				$("#warn").html("用户名不能为空");

				return false;
			} else {
				var flag=true;
				$("#warn").html("");
				
				
				var url="${initParam.rootPath}/Servlet/checkUser.do";
				$.get(url,{username:form1.username.value},function(jr){
					if(jr){
						$("#warn").html("用户名已被注册！");
						flag=false;
					}else{
						flag=true;
					}
				},"json");
				return flag;
			}
		}
		function checkPwd() {
			if ($("#pwd").val().length != 6) {
				$("#warn").html("密码不合法");

				return false;
			} else {
				$("#warn").html("");
				return true;
			}
		}
		function checkPwd2() {
			if ($("#pwd2").val() != $("#pwd").val()) {
				$("#warn").html("密码不一致！");
				return false;
			} else {
				$("#warn").html("");
				return true;
			}
		}
		function checkUser() {
			if (!checkYhm()) {
				return false;
			}
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
