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
	String id = request.getParameter("id");
	String password = request.getParameter("pw");

	Connection conn = null;

	ResultSet rs = null;

	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";

	try {
		Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
		conn = DriverManager.getConnection(url, "ngc438", "pass123");
		Statement stmt= conn.createStatement();
		String strSQL= "SELECT * FROM bookmember WHERE id='" + id + "'";
		rs = stmt.executeQuery(strSQL);
		if(rs.next()){
			if(password.equals(rs.getString("password"))){	//���̵�, ��й�ȣ ��ġ
				session.setAttribute("id", id);
				out.println("<script lauguage = javascript>");
				out.println("alert('�α��� ����.');");
				out.println("location.href='main.jsp';");
				out.println("</script>");
			}
			else{
				out.println("<script lauguage = javascript>");
				out.println("alert('��й�ȣ�� �߸��Ǿ����ϴ�.');");
				out.println("history.back();");
				out.println("</script>");
			}
		}
		else{
			out.println("<script lauguage = javascript>");
			out.println("alert('���̵� �߸��Ǿ����ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
			
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
%>

</html>
