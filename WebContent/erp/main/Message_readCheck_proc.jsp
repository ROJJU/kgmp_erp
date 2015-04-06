<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<%@ page import="java.util.*, java.text.*" %>
<%
Calendar cal=Calendar.getInstance();
SimpleDateFormat Time = new SimpleDateFormat("HH:mm");
String chk_time = Time.format(cal.getTime());
int msg_seq=Integer.parseInt(request.getParameter("msg_seq"));
String check = msg_dao.ReadCheckMsg(chk_time, msg_seq);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script>
<%

if(check.equals("true")){
	%>
			alert('성공 하였습니다.');
				opener.location.href="MessageView.jsp"
				window.close();
	<%
}else{
	%>
			alert('실패 하였습니다.');
				opener.location.href="MessageView.jsp"
				window.close();
	<%
}
%>
</script>
</head>
</html>