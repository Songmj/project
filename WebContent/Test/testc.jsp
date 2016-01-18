<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.ArrayList"%>
<%
	request.setCharacterEncoding("euc-kr");	
%>
<jsp:useBean id="Bean" class="jspbook2.test.studentBean"/>
<jsp:useBean id="Book" class="jspbook2.test.studentBook"/>
<%
	ArrayList list = Bean.getDBList(request.getParameter("name"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
검색결과
<%
	for(Object student:list){
	out.println(student);
	}
%>
</body>
</html>