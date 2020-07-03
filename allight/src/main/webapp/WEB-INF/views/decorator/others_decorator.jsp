<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="decorator"
	uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<decorator:head />
</head>

<body>

	<jsp:include page="/WEB-INF/views/header.jsp" />
	
	<decorator:body />

	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>


</html>