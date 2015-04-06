<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="spend_dao" class="kgmp.common.dao.Spend_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="spend" class="kgmp.common.beans.Spend"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int spend_seq = Integer.parseInt(request.getParameter("spend_seq"));
int state  = Integer.parseInt(request.getParameter("state"));

String check = spend_dao.updateState(spend_seq, state);

if(check.equals("true")){
	%>
			alert('성공하셨습니다.');
			location.href="adminSpend.jsp";
	<%
}else{
	%>
			alert('실패하셨습니다.');
			location.href="adminSpend.jsp";
	<%
}
%>
</script>