<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="gachon.gtg.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>uni</th>
		<th>maj</th>
		<th>name</th>
	</tr>
	<c:forEach items="${lvlist}" var="lv">
	<tr>
		<td>${lv.lecname}</td>
		<td>${lv.lectime}</td>
		<td>${lv.lec_credit}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>
