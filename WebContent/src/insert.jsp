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
		out.println("alert('예기치 못한 오류 발생.');");
		out.println("self.close();");
		out.println("</script>");
	}
	
	String content = request.getParameter("inputcontent");
	String type = request.getParameter("inputtype");
	Connection conn = null;
	PreparedStatement pstmt = null;
	String driver = "oracle.jdbc.driver.OracleDriver"; //드라이버 이름 설정
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	Class.forName(driver); //드라이버 이름으로 드라이버를 로드
	conn = DriverManager.getConnection(url, "ngc438", "pass123");
	pstmt = conn
			.prepareStatement("Insert into bookorder(num,id,content,type) values (SEQ_NUMBER2.NEXTVAL,?,?,?)");
	pstmt.setString(1, id);
	pstmt.setString(2, content);
	pstmt.setString(3, type);
	int res = pstmt.executeUpdate();
	if (res != 0) {
		out.println("<script>");
		out.println("alert('등록이 완료되었습니다.');");
		out.println("window.opener.location.href = 'board.jsp';");
		out.println("self.close();");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('예기치 못한 오류 발생.');");
		out.println("self.close();");
		out.println("</script>");
	}
%>