<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="msg" class="kgmp.common.beans.Message"></jsp:useBean>
<jsp:setProperty property="*" name="msg"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = msg_dao.insertMessage(msg);

if(check.equals("true")){
	%>
			alert('전송 성공 하였습니다.');
				window.close();
	<%
}else{
	%>
			alert('전송 실패 하였습니다.');
			window.close();
	<%
}
%>
</script>
