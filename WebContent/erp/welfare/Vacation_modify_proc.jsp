<%@ page language="java" contentType="text/html; charset=euc-kr"  pageEncoding="euc-kr"%>
<%@ page import=" java.util.*" %>
<%request.setCharacterEncoding("euc-kr");  %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="schedule" class="kgmp.common.beans.Schedule"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<jsp:setProperty property="*" name="schedule"/>
<script>
<%
int year=Integer.parseInt(request.getParameter("year"));
int month=Integer.parseInt(request.getParameter("month"))-1;
int day=Integer.parseInt(request.getParameter("day"));
int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
int j=day;
int date_check = schedule.getDate_check();
int v=0;
int next=1;
String check = null;
GregorianCalendar today = new GregorianCalendar ();
today.set(year, month, day);
int maxday = today.getActualMaximum ((today.DAY_OF_MONTH ));

	for(int i=date_check; i>0; i--){
			if(j<=maxday){
				schedule.setSchedule_seq(schedule_seq);
				schedule.setDay(j);
				check = schedule_dao.modifyVacation(schedule);
				schedule_seq++;
				j++;
				v++;
			}
	}
	for(int sum = date_check-v; sum>0; sum--){
		if(j>=maxday){
			System.out.println(schedule.getMonth());
			if(Integer.parseInt(request.getParameter("month"))+1<13){
				schedule.setMonth(Integer.parseInt(request.getParameter("month"))+1);
			}else{
				schedule.setYear(year+1);
				schedule.setMonth(1);
			}
			schedule.setSchedule_seq(schedule_seq);
			schedule.setDay(next);
			check = schedule_dao.modifyVacation(schedule);
			schedule_seq++;
			next++;
		}
	}
%>
<%
if(check.equals("true")){
	%>
			alert('수정 성공 하였습니다.');
			window.close();
	<%
}else{
	%>
			alert('수정 실패 하였습니다.');
			window.close();
	<%
}
%>
</script>