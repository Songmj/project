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
귀하의 표준체중은 ${(param.height-100)*0.9}kg이며, 비만도 지수는 ${(param.weight*100)/((param.height-100)*0.9)}입니다.
<br>
<c:choose>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)>=121}">
	판정 : 비만
	</c:when>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)>=111}">
	판정 : 과체중
	</c:when>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)>=91}">
	판정 : 표준
	</c:when>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)<=90}">
	판정 : 저체중
	</c:when>
</c:choose>
</body>
</html>