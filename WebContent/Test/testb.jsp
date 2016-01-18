<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.sql.*"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt=null;
	String jdbc_driver="com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost:3306/jspbookdb";
	
	Class.forName(jdbc_driver);
	conn=DriverManager.getConnection(jdbc_url,"root","jspbook");
	
	String sql="insert into student values(?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("name"));
	pstmt.setString(2, request.getParameter("major"));
	pstmt.setFloat(3, Float.parseFloat(request.getParameter("gpa")));
	
	if(request.getParameter("name")!=null){
		pstmt.executeUpdate();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2># 학생 리스트</h2>
<%
	String name="";
	float gpa=0;
	try{
		String SQL="select * from student";
		pstmt=conn.prepareStatement(SQL);
		ResultSet rs = pstmt.executeQuery();
		int i=1;
		
		while(rs.next()){
			out.println(i+" : "+rs.getString(1)+", "+rs.getString(2)+", "+rs.getFloat(3)+"<br>");
			if(rs.getFloat(3)>gpa){
				gpa=rs.getFloat(3);
				name=rs.getString(1);
			}
			i++;
		}
		rs.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		System.out.println(e);
	}
%>
<br>
1등=<%=name%>, 학점<%=gpa%>
</body>
</html>