<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<jsp:useBean id="report_DAO" class="kgmp.common.dao.Report_dao" scope="session"/>
<%
//상태 변경
int daily_seq = Integer.parseInt(request.getParameter("daily_seq"));
int submit =0;
	if(request.getParameter("submit")!=null)
		submit = Integer.parseInt(request.getParameter("submit"));
	report_DAO.changeState(submit, daily_seq);
%>
<script>
	location.href="DailyRead.jsp?daily_seq=<%=daily_seq%>";
</script>
