<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, kgmp.common.beans.DL" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dl" class="kgmp.common.beans.DL"></jsp:useBean>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<%
/*오늘 날자 계산(형식변환)*/
Calendar cal=Calendar.getInstance();
SimpleDateFormat year = new SimpleDateFormat("yyyy");
SimpleDateFormat month = new SimpleDateFormat("MM");
SimpleDateFormat day = new SimpleDateFormat("dd");
SimpleDateFormat hour = new SimpleDateFormat("HH");
SimpleDateFormat min = new SimpleDateFormat("mm");
SimpleDateFormat time = new SimpleDateFormat("HH:mm");
String nowYear= year.format(cal.getTime());
String nowMonth= month.format(cal.getTime());
String nowDay = day.format(cal.getTime());
int nowHour = Integer.parseInt(hour.format(cal.getTime()));
String nowMin = min.format(cal.getTime());
String nowTime = time.format(cal.getTime());
int nowForSum = Integer.parseInt(nowHour+nowMin);
String id=(String)session.getAttribute("member_id");
/*state check*/
pageContext.setAttribute("state", dl_DAO.getState(id, nowYear, nowMonth, nowDay));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../report/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(window).load(function(){
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	var day = document.getElementById("day").value;
	var add_date = year+"/"+month+"/"+day;
	document.dl.add_date.value = add_date;
	document.dl.submit();
  });
</script>
</head>
<body>
	<form action="DL_check_proc.jsp" method="post" name="dl">
		<input type="hidden" value="${member_id}" name="id">
		<input type="hidden" value="<%=nowYear %>" name="insert_year" id="year">
		<input type="hidden" value="<%=nowMonth %>" name="insert_month" id="month">
		<input type="hidden" value="<%=nowDay %>" name="insert_day" id="day">
		<input type="hidden" name="add_date">
		<c:if test="${state.state==null||state.state==' '}">
			<input type="hidden" value="0" name="state">
			<input type="hidden" value="<%=nowMin%>" name="hi_work_min">
			<input type="hidden" value="<%=nowTime%>" name="hi_work_time">
			<%
				if(nowForSum > 900){
					%>
					<input type="hidden" value="1" name="late"><!--근태결과 지각 카운트-->
					<%
				}
			%>
			<%
				if(nowForSum < 1210){
					int addLunchTime = nowHour+1;
					%>
					<input type="hidden" value="<%=addLunchTime%>" name="hi_work_hour">
					<%
				}else{
					%>
					<input type="hidden" value="<%=nowHour %>" name="hi_work_hour">
					<%
				}
			%>
		</c:if>
		<c:if test="${state.state=='0'}">
			<input type="hidden" value="1" name="state">
			<input type="hidden" value="<%=nowHour %>" name="bye_work_hour">
			<input type="hidden" value="<%=nowMin%>" name="bye_work_min">
			<input type="hidden" value="<%=nowTime%>" name="bye_work_time">
			<%
				if(nowForSum < 1800){
					%>
					<input type="hidden" value="1" name="etc"><!--기타 근무일 카운트-->
					<input type="hidden" value="1" name="work"><!--근태결과 출근 카운트-->
					<input type="hidden" value="1" name="give_up"><!--근태결과 조퇴 카운트-->
					<input type="hidden" value="1" name="total_work_check"><!--근무일 합계 카운트-->
					<%
				}
				if(nowForSum <= 1829&&nowForSum >=1800){
					%>
					<input type="hidden" value="1" name="work_check"><!--정상 근무일 카운트-->
					<input type="hidden" value="1" name="work"><!--근태결과 출근 카운트-->
					<input type="hidden" value="1" name="total_work_check"><!--근무일 합계 카운트-->
					<%
				}
				if(nowForSum >= 1830){
					%>
					<input type="hidden" value="1" name="over_work_check"><!--연장 근무일 카운트-->
					<input type="hidden" value="1" name="work"><!--근태결과 출근 카운트-->
					<input type="hidden" value="1" name="total_work_check"><!--근무일 합계 카운트-->
					<%
				}
			%>
		</c:if>
	</form><br>
	<center>
		<a style="font-family:맑은 고딕; font-size:25px;">설정중...</a><br><br>
		<input type="image" src="/kgmp/erp/schedule/img/prograss.gif"/>
	</center>
</body>
</html>