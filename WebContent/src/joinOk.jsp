<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
</head>

<%
	String certificate = (String) session.getAttribute("certificate");
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	String usercertif = request.getParameter("certificate");

	if (!(certificate.equals(usercertif)))
		out.println("<script>alert('������ȣ�� �߸��Ǿ����ϴ�!');history.back();</script>");

	Connection conn = null;
	PreparedStatement pstmt = null;

	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url, "ngc438", "pass123");
		pstmt = conn.prepareStatement("INSERT INTO bookmember(id, password) VALUES(?,?)");
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		int result = pstmt.executeUpdate();
		if (result != 0) {
			out.println("<script lauguage = javascript>");
			out.println("alert('���������� ó���Ǿ����ϴ�!')");
			out.println("location.href='signin.jsp'");
			out.println("</script>");
		} else {
			out.println("<script lauguage = javascript>");
			out.println("alert('����ġ ���� ���� �߻�')");
			out.println("location.href='main.jsp'");
			out.println("</script>");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	out.println("<script lauguage = javascript>");
	out.println("location.href='signin.jsp'");
	out.println("</script>");
%>

</html>
