
<%@page import="java.io.File"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<jsp:useBean id="bt" class="hackathon_pack.bean" scope="page" />
<jsp:setProperty name="bt" property="*" />

<%
	request.setCharacterEncoding("euc-kr");

	String uploadPath = request.getServletContext().getRealPath("src/img");
	out.println(uploadPath);

	// ������ ����� ����
	int size = 10 * 1024 * 1024; // 10M �Ѱ�
	String filename1 = "";
	MultipartRequest multi = new MultipartRequest(request, uploadPath, size, "euc-kr",
			new DefaultFileRenamePolicy());

	String id = (String) session.getAttribute("id");
	String type = multi.getParameter("inputtype");
	String title = multi.getParameter("inputtitle");
	String subtitle = multi.getParameter("inputsubtitle");
	String author = multi.getParameter("inputauthor");
	String publisher = multi.getParameter("inputpublisher");
	String price = multi.getParameter("inputprice");
	String sellprice = multi.getParameter("inputsellprice");
	String status = multi.getParameter("inputstatus");
	String image = multi.getParameter("inputimage");
	String moreinfo = multi.getParameter("inputbookinfo");

	String fileName = multi.getFilesystemName("inputimage");

	int num = -1;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
	conn = DriverManager.getConnection(url, "ngc438", "pass123");

	pstmt = conn.prepareStatement(
			"INSERT INTO selling(id, num, title, subtitle, author, publisher, moreinfo, image, price, sellprice, type, status) VALUES(?,SEQ_NUMBER.NEXTVAL,?,?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1, id);
	pstmt.setString(2, title);
	pstmt.setString(3, subtitle);
	pstmt.setString(4, author);
	pstmt.setString(5, publisher);
	pstmt.setString(6, moreinfo);
	pstmt.setString(7, fileName);
	pstmt.setString(8, price);
	pstmt.setString(9, sellprice);
	pstmt.setString(10, type);
	pstmt.setString(11, status);
	int result = pstmt.executeUpdate();
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