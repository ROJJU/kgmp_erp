<%@page contentType="text/xml; charset=utf-8" %>
<%@ page language="java" import="java.sql.*"%>

<%
String driver="oracle.jdbc.driver.OracleDriver";
String user="kgmp";
String pass="kgmp0315480055";
String dbURL="jdbc:oracle:thin:@localhost:1521:xe";


String sql;
String rtn_xml;

Connection connection;
Statement stmt 	= null;
ResultSet rs 	= null;
rtn_xml = "";

try{
	Class.forName(driver);
	connection=DriverManager.getConnection(dbURL,user,pass);
	
	sql = "select distinct state from message where state=1";
	
	stmt = connection.createStatement();
	rs = stmt.executeQuery(sql);		
%>							
<customer>
<%
	while (rs.next()){		
		out.println("<person>");
		out.println("<name>" + rs.getString("state") + " </name>");
		out.println("<age>" + rs.getString("state") +  "</age>");
		out.println("<tel>" + rs.getString("state") +  "</tel>");
		out.println("<addr>" + rs.getString("state") +  "</addr>");
		out.println("</person>");		
	}		
%>
</customer>
<%
}
catch(ClassNotFoundException cne){
	
}catch(SQLException se){
}
%>