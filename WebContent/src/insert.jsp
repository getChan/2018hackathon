<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>
<%
	request.setCharacterEncoding("euc-kr");
	String id = (String)session.getAttribute("id");
	if (session.getAttribute("id") == null) {
		out.println("<script>");
		out.println("alert('����ġ ���� ���� �߻�.');");
		out.println("self.close();");
		out.println("</script>");
	}
	
	String content = request.getParameter("inputcontent");
	String type = request.getParameter("inputtype");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String driver = "oracle.jdbc.driver.OracleDriver"; //����̹� �̸� ����
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Class.forName(driver); //����̹� �̸����� ����̹��� �ε�
	conn = DriverManager.getConnection(url, "ngc438", "pass123");
	pstmt = conn
			.prepareStatement("Insert into bookorder(num,id,content,type) values (SEQ_NUMBER2.NEXTVAL,?,?,?)");
	pstmt.setString(1, id);
	pstmt.setString(2, content);
	pstmt.setString(3, type);
	int res = pstmt.executeUpdate();
	if (res != 0) {
		out.println("<script>");
		out.println("alert('����� �Ϸ�Ǿ����ϴ�.');");
		out.println("window.opener.location.href = 'board.jsp';");
		out.println("self.close();");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('����ġ ���� ���� �߻�.');");
		out.println("self.close();");
		out.println("</script>");
	}
%>