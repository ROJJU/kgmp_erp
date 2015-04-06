<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dl_dao" class="kgmp.common.dao.Dl_dao"  scope="session"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int dl_seq = Integer.parseInt(request.getParameter("dl_seq"));
int state  = Integer.parseInt(request.getParameter("state"));

if(state==2||state==4||state==6){
	state  = Integer.parseInt(request.getParameter("state"))+1;
}else{
	state  = Integer.parseInt(request.getParameter("state"));
}
String check = dl_dao.adminstate(dl_seq, state);

if(check.equals("true")){
	%>
			alert('성공하셨습니다.');
			location.href="adminDl.jsp";
	<%
}else{
	%>
			alert('실패하셨습니다.');
			location.href="adminDl.jsp";
	<%
}
%>
</script>