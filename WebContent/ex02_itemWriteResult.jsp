<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex02_itemWriteResult</title>
</head>
<body>
<!-- ex02_itemWriteForm.html 에서 정보 입력 후 [전송]버튼을 클릭하면 나타나는 결과페이지,
						PreparedStatement 클래스 사용	 		-->
<%
	String sql="insert into item values(?,?,?)";
	Connection conn=null;
	PreparedStatement pstmt=null;
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	String uid="scott";
	String pass="tiger";
%>

<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn=DriverManager.getConnection(url,uid,pass);
		pstmt=conn.prepareStatement(sql);
		
		request.setCharacterEncoding("UTF-8");
		String name=request.getParameter("name");
		String price=request.getParameter("price");
		String description=request.getParameter("description");
		
		pstmt.setString(1,name);
		pstmt.setInt(2,Integer.parseInt(price));
		pstmt.setString(3,description);
		
		pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(pstmt != null)
			pstmt.close();
		if(conn != null)
			conn.close();
	}
%>

				
<h2>레코드가 추가되었습니다.</h2>

<a href="ex02_itemWrite.jsp">결과 보기</a>

</body>
</html>