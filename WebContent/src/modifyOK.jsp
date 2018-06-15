<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>%>
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = (String)session.getAttribute("id");
	String type = request.getParameter("inputtype");
	String title = request.getParameter("inputtitle");
	String subtitle = request.getParameter("inputsubtitle");
	String author = request.getParameter("inputauthor");
	String publisher = request.getParameter("inputpublisher");
	String price = request.getParameter("inputprice");
	String sellprice = request.getParameter("inputsellprice");
	String status = request.getParameter("inputstatus");
	String image = request.getParameter("inputimage");
	String moreinfo = request.getParameter("inputbookinfo");
	String num = (String)request.getParameter("inputnum");
	int number = Integer.parseInt(num);
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	Class.forName(driver); //드라이버 이름으로 드라이버를 로드
	conn = DriverManager.getConnection(url, "ngc438", "pass123");

	pstmt = conn.prepareStatement(
			"update selling set title = ?, subtitle = ?, author = ?, publisher = ?, moreinfo = ?, price = ?, sellprice = ?, type = ?, status = ? where num = ?");
	pstmt.setString(1, title);
	pstmt.setString(2, subtitle);
	pstmt.setString(3, author);
	pstmt.setString(4, publisher);
	pstmt.setString(5, moreinfo);
	pstmt.setString(6, price);
	pstmt.setString(7, sellprice);
	pstmt.setString(8, type);
	pstmt.setString(9, status);
	pstmt.setInt(10,number);
	int result = pstmt.executeUpdate();
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