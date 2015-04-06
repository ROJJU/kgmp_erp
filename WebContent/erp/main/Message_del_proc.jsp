<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
int msg_seq=Integer.parseInt(request.getParameter("msg_seq"));
msg_dao.goTrash(msg_seq);
%>
<script>
opener.location.href="MessageView_tap2.jsp"
window.close();
</script>
