<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_itemWrite</title>
</head>
<body>
<!-- ex02_itemWriteResult.jsp 에서 [결과 보기]를 클릭하면 테이블의 모든 레코드를 출력하는 페이지 -->
<h2>입력 완료된 정보</h2>
</body>
<%
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String uid="scott";
	String pass="tiger";
	String sql="select * from item";
%>

<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		System.out.println("드라이버 로딩 성공");
		conn=DriverManager.getConnection(url,uid,pass);
		System.out.println("연결 성공");
		stmt=conn.createStatement();
		rs=stmt.executeQuery(sql);

		out.println("<table border='1'>");
		while(rs.next()){
			out.println("<tr>");
			out.println("<td>"+rs.getString("name")+"</td>");
			out.println("<td>"+rs.getString("price")+"</td>");
			out.println("<td>"+rs.getString("description")+"</td>");
			out.println("</tr>");			
		}
			out.println("</tr>");			
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(stmt != null)
			stmt.close();
		if(conn != null)
			conn.close();
		if(rs != null)
			rs.close();
	}
%>

</html>