<%@ page language="java" contentType="text/html; charset=euc-kr"  pageEncoding="euc-kr"%>
<%@ page import=" java.util.*" %>
<%request.setCharacterEncoding("euc-kr");  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="schedule" class="kgmp.common.beans.Schedule"></jsp:useBean>
<jsp:setProperty property="*" name="schedule"/>
<%
int count=Integer.parseInt(request.getParameter("date_check"));
String check = null;
int year=Integer.parseInt(request.getParameter("year"));
int month=Integer.parseInt(request.getParameter("month"))-1;
int day=Integer.parseInt(request.getParameter("day"));
int step=0;

GregorianCalendar today = new GregorianCalendar ();
today.set(year, month, day);
int maxday = today.getActualMaximum ((today.DAY_OF_MONTH ));
for(int j=day; j<=maxday; j++){
	count--;
	step++;
	schedule.setStep(step);
	schedule.setDay(j);
	check=schedule_dao.insertVacation(schedule);
	if(count==0){break;	}
}
for(int a=1; a<=count; a++){
	step++;
	schedule.setStep(step);
	schedule.setDay(a);
		if(Integer.parseInt(request.getParameter("month"))+1<13){
			schedule.setMonth(Integer.parseInt(request.getParameter("month"))+1);
		}else{
			schedule.setYear(year+1);
			schedule.setMonth(1);
		}
	check=schedule_dao.insertVacation(schedule);
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
<%
if(check.equals("true")){
	%>
			alert('저장 성공 하였습니다.');
			opener.location.href="VacationView.jsp";
			window.close();
	<%
}else{
	%>
			alert('저장 실패 하였습니다.');
			opener.location.href="VacationView.jsp";
			window.close();
	<%
}
%>
</script>
</head>
</html>