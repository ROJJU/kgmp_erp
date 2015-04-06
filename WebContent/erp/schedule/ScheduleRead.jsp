<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, kgmp.common.beans.Schedule"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<%
//선택출력
int schedule_seq=Integer.parseInt(request.getParameter("schedule_seq"));
int state=Integer.parseInt(request.getParameter("state"));
pageContext.setAttribute("s", schedule_dao.selectSchedule(schedule_seq));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/Sche_R.css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScheduleRead</title>
</head>
<body>
	<div id="hearder"><a style="padding:20px; font-size:25px;">Schedule</a><div id="writer"><b>[${s.writer}]</b>님의_<font color="red">${s.year}년 ${s.month}월 ${s.day}일</font>_일정</div></div>
	<div id="body"><br/>
		<form name="form">
			<center>
				<table>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;날짜</th>
						<td >${s.year}년 ${s.month}월 ${s.day}일</td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;시간</th>
						<td >${s.f_hour}시${s.f_min}분<a>&nbsp;~&nbsp;</a>${s.s_hour}시${s.s_min}분</td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;분류</th>
						<td >
							<c:if test="${s.type==1}">출장</c:if>
							<c:if test="${s.type==2}">휴가</c:if>
							<c:if test="${s.type==3}">내부업무</c:if>
							<c:if test="${s.type==4}">FDA</c:if>
							<c:if test="${s.type==5}">CFDA</c:if>
							<c:if test="${s.type==6}">GMP</c:if>
							<c:if test="${s.type==7}">STED</c:if>
							<c:if test="${s.type==8}">CE</c:if>
						</td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;일정명</th>
						<td >${s.title}</td>
						
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;장소</th>
						<td width="200px" >${s.location}</td>
					</tr>
					<tr>
						<th ><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;상세일정</th>
						<td ><textarea cols="45" readonly>${s.content}</textarea><br/></td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;알람상태</th>
						<td>
						<c:if test="${s.alram==1}"><img src="img/alram.png" width="20px"><font color="red">&nbsp;알람 설정 되어있음</font></c:if>
						<c:if test="${s.alram==0}"><font color="red">알람 미 설정 되어있음</font></c:if>
						</td>
					</tr>
				</table><br/><br/><br/>
			</center>
		</form>
	</div>
	<div id="footer" align="right">
		<div id="buttons" style="padding:5px;">
			<input type="image" src="../hr/img/modify.png" width="40px" onclick="javaScript:location.href='ScheduleModify.jsp?schedule_seq=${s.schedule_seq}&state=<%=state%>&year=${s.year}&month=${s.month}&day=${s.day}';"/>
			<c:if test="${s.location!='Vacation'}">
				<c:if test="${s.writer==member_name}"><input type="image" src="../hr/img/del.png" width="40px" onclick="javaScript:location.href='Schedule_del_proc.jsp?schedule_seq=${s.schedule_seq}&state=<%=state%>&year=${s.year}&month=${s.month}&day=${s.day}';"/></c:if>
			</c:if>
			<input type="image" src="../main/images/exit.png" width="40px" onclick="javaScript:window.close();"/>
		</div>
	</div>
</body>
</html>