<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String num = request.getParameter("num");
	int number = Integer.parseInt(num);
	String id = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	int advantage = 0;
	id = (String)session.getAttribute("id");
					
	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	int result = 0;
	try {
		Class.forName(driver); //드라이버 이름으로 드라이버를 로드
		conn = DriverManager.getConnection(url, "ngc438", "pass123");
		pstmt = conn.prepareStatement("delete FROM selling where num = ?");
		pstmt.setInt(1, number);
		result = pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}
	if (result != 0) {
		out.println("<script lauguage = javascript>");
		out.println("alert('정상적으로 처리되었습니다!')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	} else {
		out.println("<script lauguage = javascript>");
		out.println("alert('예기치 못한 에러 발생')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>