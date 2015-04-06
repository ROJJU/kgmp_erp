<%@ page language="java" contentType="text/html; charset=euc-kr"  pageEncoding="euc-kr"%>
<%@ page import=" java.util.*" %>
<%request.setCharacterEncoding("euc-kr");  %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="schedule" class="kgmp.common.beans.Schedule"></jsp:useBean>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="dl" class="kgmp.common.beans.DL"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
//setting
String id=request.getParameter("id");
String add_date=null;
int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
int state = Integer.parseInt(request.getParameter("state"));
int date_check = Integer.parseInt(request.getParameter("date_check"));
String check = null;
int year=Integer.parseInt(request.getParameter("year"));
int month=Integer.parseInt(request.getParameter("month"))-1;
int day=Integer.parseInt(request.getParameter("day"));
int count=Integer.parseInt(request.getParameter("date_check"));

//insert info for dl
GregorianCalendar today = new GregorianCalendar ();
today.set(year, month, day);
int maxday = today.getActualMaximum ((today.DAY_OF_MONTH ));
for(int j=day; j<=maxday; j++){
	count--;
	month=Integer.parseInt(request.getParameter("month"));
	add_date=year+"/"+month+"/"+j;
	dl_DAO.insertVacation(year, month, j, id, add_date);
	if(count==0){break;	}
}
for(int a=1; a<=count; a++){
	add_date=year+"/"+month+"/"+a;
		if(Integer.parseInt(request.getParameter("month"))+1<13){
			month=Integer.parseInt(request.getParameter("month"))+1;
		}else{
			year=year+1;
			month=1;
		}
	dl_DAO.insertVacation(year, month, a, id, add_date);
}

//update state for vacation commit
	for(int i=date_check; i>0; i--){
		check = schedule_dao.updateState(schedule_seq, state);
		schedule_seq++;
	}
%>
<%
if(check.equals("true")){
	%>
			alert('수정 성공 하였습니다.');
			location.href="adminVacation.jsp";
	<%
}else{
	%>
			alert('수정 실패 하였습니다.');
			location.href="adminVacation.jsp";
	<%
}
%>
</script>