<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(".buttonclass").click(function(){
	var table = $("<table>")
	for(var i=0;i<4;i++){
		var tr =$("<tr>");
		for(var j=0;j<3;j++){
			var td=$("<td>");
			td.html(i+"+"+j);
			tr.append(td);
		}
		table.append(tr);
	}
	$("body").append(table);
});

</script>
</head>
<body>

</body>
</html>