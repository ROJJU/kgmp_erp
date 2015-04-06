<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="schedule" class="kgmp.common.beans.Schedule"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));
int state = Integer.parseInt(request.getParameter("state"));
String check = schedule_dao.delSchedule(schedule_seq);

if(check.equals("true")){
	if(state==0){
	%>
			alert('삭제 성공 하였습니다.');
			opener.opener.location.href="ScheduleView.jsp?year=<%=year%>&month=<%=month%>";
			opener.window.close();
			window.close();
	<%
	}else if(state==1){
	%>
			alert('삭제 성공 하였습니다.');
			opener.location.href="ScheduleView_w.jsp?year=<%=year%>&month=<%=month%>&day=<%=day%>";
			window.close();
	<%
	}
}else{
	%>
			alert('삭제 실패 하였습니다.');
			window.close();
	<%
}
%>
</script>

