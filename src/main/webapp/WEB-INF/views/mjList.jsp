<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table border="1">
	<tr>
		<th>uni</th>
		<th>maj</th>
		<th>name</th>
	</tr>
	<c:forEach items="${mjlist}" var="mj">
	<tr>
		<td>${mj.univ_cd}</td>
		<td>${mj.maj_cd}</td>
		<td>${mj.name}</td>
	</tr>
	</c:forEach>
</table>
</body>
</html>