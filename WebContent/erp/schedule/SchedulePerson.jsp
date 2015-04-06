<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, kgmp.common.beans.Schedule, java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<%
//개인 목차 출력
String writer = URLDecoder.decode(request.getParameter("writer"), "UTF-8");
int year=Integer.parseInt(request.getParameter("year"));
int month=Integer.parseInt(request.getParameter("month"));
int day=Integer.parseInt(request.getParameter("day"));
List<Schedule> list = schedule_dao.getList(writer, year, month, day);
pageContext.setAttribute("list", list);
int i=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScheduleList</title>
<style type="text/css">
	div.{border:1px solid red;}
	body{margin:0 auto; height:100%; background-color:#F6F6F6;}
	table{width:500px; border-collapse:collapse;}
	table tr, td, th{font-family:맑은 고딕; font-size:11px;}
	tr{border-bottom:1px dotted #B2CCFF; height:25px;}
	#footer{position:fixed; width:100%; bottom:0px; background-color:#EAEAEA; height:35px; border-top:1px solid grey;}
	#hearder{position:relative; height:40px; width:100%; background-color:#EAEAEA; border-bottom:1px solid grey;}
	#body{position:relative; height:100%; width:100%; margin:0 auto;}
	input, img, input.type-image{/* border: 0 none; */ vertical-align:middle;}
	#writer{position:absolute; top:22px; left:320px; font-size:11px; font-family:맑은돋움;}
</style>
<script type="text/javascript">
function popup(schedule_seq, state){
	window.open("ScheduleRead.jsp?schedule_seq="+schedule_seq+"&state="+state,"scheRead","width=520px, height=320px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
	}
</script>
</head>
<body>
	<div id="hearder"><a style="padding:20px; font-size:25px;">Schedule</a><div id="writer"><b>[<%=writer%>]</b>님의_<font color="red"><%=year%>년 <%=month%>월 <%=day%>일</font>_일정</div></div>
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
							<c:if test="${a.alram==1}"><img src="img/alram.png" width="20px"></c:if>
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
			<input type="image" src="../main/images/exit.png" width="40px" onclick="window.close();"/>
		</div>
	</div>
</body>
</html>