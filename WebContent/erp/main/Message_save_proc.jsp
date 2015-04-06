<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int msg_seq=Integer.parseInt(request.getParameter("msg_seq"));
String check = msg_dao.saveMsg(msg_seq);

if(check.equals("true")){
	%>
			alert('보관 성공 하였습니다.');
			location.href="MessageView.jsp";
	<%
}else{
	%>
			alert('보관 실패 하였습니다.');
			location.href="MessageView.jsp";
	<%
}
%>
</script>
