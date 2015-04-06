<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, kgmp.common.beans.Schedule, java.net.*, java.util.*, java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<%
//설정
int state=0;
String writer = (String)session.getAttribute("member_name");
Calendar cal =Calendar.getInstance();
int nowY = cal.get(Calendar.YEAR);
int nowM = cal.get(Calendar.MONTH)+1;
int nowD = cal.get(Calendar.DATE);
//개인 목차 출력
List<Schedule> list = schedule_dao.getList(writer, nowY, nowM, nowD);
pageContext.setAttribute("list", list);
int i=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScheduleList</title>
<link rel="stylesheet" type="text/css" href="../schedule/css/Sche_R.css"/>
<script type="text/javascript">
alert('금일 알람 설정한 일정이 있습니다. 확인해 주세요!!');
function popup(schedule_seq, state){
	window.open("../schedule/ScheduleRead.jsp?schedule_seq="+schedule_seq+"&state="+state,"scheRead","width=520px, height=320px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
	}
</script>
</head>
<body>
	<div id="hearder"><a style="padding:20px; font-size:25px;">Schedule</a><div id="writer"><b>[<%=writer%>]</b>님의_<font color="red"><%=nowY%>년 <%=nowM%>월 <%=nowD%>일</font>_일정</div></div>
	<div id="body"><br/>
		<form name="form">
			<center>
				<table>
					<tr>
						<th width="40px">번호</th>
						<th width="80px">분류</th>
						<th width="260px">일정명</th>
						<th width="100px">시간</th>
					</tr>
				<c:forEach var="a" items="${list}"><%i++; %>
					<tr onclick="popup(${a.schedule_seq}, 0)">
						<td align="center"><%=i%></td>
						<td align="center">
							<c:if test="${a.type==1}">출장</c:if>
							<c:if test="${a.type==2}">휴가</c:if>
							<c:if test="${a.type==3}">내부업무</c:if>
							<c:if test="${a.type==4}">FDA</c:if>
							<c:if test="${a.type==5}">CFDA</c:if>
							<c:if test="${a.type==6}">GMP</c:if>
							<c:if test="${a.type==7}">STED</c:if>
							<c:if test="${a.type==8}">CE</c:if>
						</td>
						<td>
							<a href=#>
							<c:if test="${a.alram==1}"><img src="../schedule/img/alram.png" width="20px"></c:if>
							&nbsp;${a.title}
							</a>
						</td>
						<td align="center">${a.f_hour}시${a.f_min}분~${a.s_hour}시${a.s_min}분</td>
					</tr>
				</c:forEach>
				</table><br/><br/><br/><br/>
			</center>
		</form>
	</div>
	<div id="footer" align="right">
		<div id="buttons" style="padding:5px;">
			<input type="button" value="알림 끄기" onclick="javaScript:location.href='Schedule_alramOff_proc.jsp?year=<%=nowY%>&month=<%=nowM%>&day=<%=nowD%>'">
			<input type="image" src="../main/images/exit.png" width="40px" onclick="javaScript:window.close();"/>
		</div>
	</div>
</body>
</html>