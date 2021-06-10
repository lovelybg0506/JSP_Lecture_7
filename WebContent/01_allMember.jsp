<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null; // 결과물을 저장하는 곳
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String uid="scott";
	String pass="tiger";
	String sql="select * from member";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_allMember</title>
</head>
<body>
	<table width="800" border="1">
	<tr>
		<th>이름</th>
		<th>아이디</th>
		<th>암호</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>권한(1:관리자, 2:일반회원)</th>
	</tr>		
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver"); // 오라클 드라이버 로딩
		conn = DriverManager.getConnection(url,uid,pass); // 연결 준비됨
		stmt = conn.createStatement(); // Statement 연결
		rs = stmt.executeQuery(sql);
		/* while(rs.next()){
			out.println("<tr>");//oracle에서 가져온 data를 표현하는 방법,
			out.println("<td>"+rs.getString("name")+"</td>");			
			out.println("<td>"+rs.getString("userid")+"</td>");			
			out.println("<td>"+rs.getString("pwd")+"</td>");			
			out.println("<td>"+rs.getString("email")+"</td>");			
			out.println("<td>"+rs.getString("phone")+"</td>");			
			out.println("<td>"+rs.getString("admin")+"</td>");			
			out.println("</tr>");
		} */
			while(rs.next()){
				String name=rs.getString("name");
				String userid=rs.getString("userid");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String phone=rs.getString("phone");
				String admin=rs.getString("admin");
				
				out.println("이름 : "+name+", 아이디 : "+userid+", 비밀번호 : "+pwd+", email : "+email+", 전화번호 : "+phone+", 권한 : "+admin+"<br>");
			}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		try{
			if(rs != null) // 순서 거꾸로 닫는다
				rs.close();
			if(stmt != null)
				stmt.close();
			if(conn != null)
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
%>	
	</table>
</body>
</html>