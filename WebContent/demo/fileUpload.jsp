<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>文件上传</title>
	<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
	
</head>
<body>
<form name="form1" action="${initParam.rootPath}/FileController/fileUpload.do" 
	method="post" enctype="multipart/form-data">
	用户名：<input type="text" id="yhm" name="yhm"/>
	<input type="file" name="file"/>
	<input type="submit" id="upload"  name="upload" value="上传"/>
</form>

<div id="userImg" name="userImg">
<img alt="图片" src="${url }"></div>

</body>
</html>
