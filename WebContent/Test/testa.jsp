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
������ ǥ��ü���� ${(param.height-100)*0.9}kg�̸�, �񸸵� ������ ${(param.weight*100)/((param.height-100)*0.9)}�Դϴ�.
<br>
<c:choose>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)>=121}">
	���� : ��
	</c:when>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)>=111}">
	���� : ��ü��
	</c:when>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)>=91}">
	���� : ǥ��
	</c:when>
	<c:when test="${(param.weight*100)/((param.height-100)*0.9)<=90}">
	���� : ��ü��
	</c:when>
</c:choose>
</body>
</html>