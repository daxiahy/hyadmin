<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<title>用户登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="${initParam.rootPath}/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath}/css/bootstrap.min.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath}/css/bootstrap-theme.min.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.rootPath}/css/templatemo_style.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${initParam.rootPath}/js/jquery-1.10.2.js"></script>
<script type="text/javascript">
	function check() {

		if (!checkyhm()) {
			return false;
		}
		if (!checkmm()) {
			return false;
		}

		return true;

	}
	function checkmm() {
		if ($("#pwd").val()=="") {
			$("#Prompt").html("密码不能空！");
			return false;
		} else{
			$("#Prompt").html("");
			return true;
		}

	}
	function checkyhm() {
		if ($("#yhm").val()=="") {
			$("#Prompt").html("用户名不能空！");
			return false;
		} else  {
			var flag=true;
			$("#Prompt").html("");
			
			
			var url="${initParam.rootPath}/Servlet/checkUser.do";
			$.get(url,{username:login.username.value},function(jr){
				if(jr){
					
					flag=false;
				}else{
					$("#Prompt").html("用户名不存在！");
					flag=true;
				}
			},"json");
			return flag;
		}

	}
</script>
</head>
<body class="templatemo-bg-gray">
	<div class="container">
		<div class="col-md-12">
			<h1 class="margin-bottom-15">用户登录</h1>

			<form name="login"
				class="form-horizontal templatemo-container templatemo-login-form-1 margin-bottom-30"
				role="form" action="${initParam.rootPath}/Servlet/login.do"
				method="post" onsubmit="return check()">
				<div class="form-group">
					<div class="col-xs-12">
						<div class="control-wrapper">
							<label for="username" class="control-label fa-label"></label> <input type="text"
								class="form-control" id="username" name="username" placeholder="用户名"
								onblur="checkyhm()">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<label for="password" class="control-label fa-label"></label> <input type="password"
								class="form-control" id="pwd" name="pwd" placeholder="密码"
								onblur="checkmm()">
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="checkbox control-wrapper">
							<label> <input type="checkbox"> 记住该用户名
							</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<div class="control-wrapper">
							<input type="submit" value="登录"  class="btn btn-info"> <a
								href="#" class="text-right pull-right">忘记密码?</a>
						</div>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<div class="col-md-12">

						<div id="Prompt" style="width: 130px; color: red"
							class="inline-block">${msg}</div>
					</div>
				</div>
			</form>
			<div class="text-center">
				<a onclick="location.href='${initParam.rootPath}/demo/zhuce.jsp'"
					class="templatemo-create-new">用户注册 </a>
			</div>
		</div>
	</div>
</body>
</html>