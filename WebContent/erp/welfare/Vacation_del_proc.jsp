<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="schedule" class="kgmp.common.beans.Schedule"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
int date_check=Integer.parseInt(request.getParameter("date_check"));
String check = null;
	for(int i=date_check; i>0; i--){
		check = schedule_dao.delSchedule(schedule_seq);
		schedule_seq++;
	}
%>
<%
if(check.equals("true")){
	%>
			alert('삭제 성공 하였습니다.');
			location.href="VacationView.jsp";
	<%
}else{
	%>
			alert('삭제 실패 하였습니다.');
			location.href="VacationView.jsp";
	<%
}
%>
</script>

