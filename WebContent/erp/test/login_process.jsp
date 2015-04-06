<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%
String user_id = request.getParameter("user_id") == null ? "" : (String)request.getParameter("user_id");
String user_name = (request.getParameter("user_name")==null) ? "":request.getParameter("user_name");
session.setAttribute("ex_user_id",user_id);
session.setAttribute("ex_user_name",user_name);
response.sendRedirect("access_user.jsp");
%>