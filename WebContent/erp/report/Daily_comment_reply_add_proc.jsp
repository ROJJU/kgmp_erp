<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.util.*" %>
<jsp:useBean id="report_DAO" class="kgmp.common.dao.Report_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="report" class="kgmp.common.beans.Report"></jsp:useBean>
<jsp:setProperty property="*" name="report"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
//setting date
Calendar cal =Calendar.getInstance(); 
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1
//setting parameters
int year_m = nowYear;
int month_m = nowMonth;
if(request.getParameter("year_m") != null)
	year_m = Integer.parseInt(request.getParameter("year_m"));
if(request.getParameter("month_m") != null)
	month_m = Integer.parseInt(request.getParameter("month_m"));

int daily_seq = Integer.parseInt(request.getParameter("daily_seq"));
int year_s = year_m;
int month_s = month_m;
int day_s = 0;
int year_g = year_m;
int month_g = month_m;
int day_g = 0;

if(request.getParameter("year_s") != null)
	year_s = Integer.parseInt(request.getParameter("year_s"));
if(request.getParameter("month_s") != null)
	month_s = Integer.parseInt(request.getParameter("month_s"));
if(request.getParameter("day_s") != null)
	day_s = Integer.parseInt(request.getParameter("day_s"));
if(request.getParameter("year_g") != null)
	year_g = Integer.parseInt(request.getParameter("year_g"));
if(request.getParameter("month_g") != null)
	month_g = Integer.parseInt(request.getParameter("month_g"));
if(request.getParameter("day_g") != null)
	day_g = Integer.parseInt(request.getParameter("day_g"));
String check = report_DAO.insertCommentReply(report);

if(check.equals("true")){
	%>
			alert('코맨트를 저장 하였습니다.');
			<%if(day_s==0){%>
			location.href="DailyRead.jsp?daily_seq="+<%=report.getDaily_seq()%>+"&year_m="+<%=year_m%>+"&month_m="+<%=month_m%>+"&year_g="+<%=year_g%>+"&month_g="+<%=month_g%>+"&day_g="+<%=day_g%>+"";
			<%}else if(day_g==0){%>
			location.href="DailyRead.jsp?daily_seq="+<%=report.getDaily_seq()%>+"&year_m="+<%=year_m%>+"&month_m="+<%=month_m%>+"&year_s="+<%=year_s%>+"&month_s="+<%=month_s%>+"&day_s="+<%=day_s%>+"";
			<%}%>
	<%
}else{
	%>
			alert('저장 실패 하였습니다.');
			<%if(day_s==0){%>
			location.href="DailyRead.jsp?daily_seq="+<%=report.getDaily_seq()%>+"&year_m="+<%=year_m%>+"&month_m="+<%=month_m%>+"&year_g="+<%=year_g%>+"&month_g="+<%=month_g%>+"&day_g="+<%=day_g%>+"";
			<%}else if(day_g==0){%>
			location.href="DailyRead.jsp?daily_seq="+<%=report.getDaily_seq()%>+"&year_m="+<%=year_m%>+"&month_m="+<%=month_m%>+"&year_s="+<%=year_s%>+"&month_s="+<%=month_s%>+"&day_s="+<%=day_s%>+"";
			<%}%>
	<%
}
%>
</script>
