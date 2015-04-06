<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="schedule" class="kgmp.common.beans.Schedule"></jsp:useBean>
<jsp:setProperty property="*" name="schedule"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = schedule_dao.insertSchedule(schedule);

if(check.equals("true")){
	%>
			alert('저장 성공 하였습니다.');
			opener.location.href="ScheduleView.jsp?year="+<%=schedule.getYear() %>+"&month="+<%=schedule.getMonth() %>;
			window.close();
	<%
}else{
	%>
			alert('저장 실패 하였습니다.');
			opener.location.href="ScheduleView.jsp";
			window.close();
	<%
}
%>
</script>

