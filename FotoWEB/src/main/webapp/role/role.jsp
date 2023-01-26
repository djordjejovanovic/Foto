<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Roles</title>
</head>
<body>
	<table>
		<tr>
			<th> roleId </th>
			<th> name </th>
			<th> description </th>
		</tr>
		<c:forEach items="${role }" var="r">
			<tr>
				<td>${r.roleId }</td>
				<td>${r.name }</td>
				<td>${r.description }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>