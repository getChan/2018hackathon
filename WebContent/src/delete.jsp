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
					
	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	int result = 0;
	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url, "ngc438", "pass123");
		pstmt = conn.prepareStatement("delete FROM selling where num = ?");
		pstmt.setInt(1, number);
		result = pstmt.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}
	if (result != 0) {
		out.println("<script lauguage = javascript>");
		out.println("alert('���������� ó���Ǿ����ϴ�!')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	} else {
		out.println("<script lauguage = javascript>");
		out.println("alert('����ġ ���� ���� �߻�')");
		out.println("location.href='main.jsp'");
		out.println("</script>");
	}
%>