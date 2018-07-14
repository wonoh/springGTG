<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<% 
		if(session.getAttribute("logincheck")==null || session.getAttribute("logincheck").equals("")){
			response.sendRedirect("login"); 
		}
		else{
			response.sendRedirect("create"); 	
		}
	
	%>
</body>
</html>