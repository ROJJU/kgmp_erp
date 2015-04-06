<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, kgmp.common.beans.Schedule"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<%
//선택출력
int schedule_seq=Integer.parseInt(request.getParameter("schedule_seq"));
int year = Integer.parseInt(request.getParameter("year"));
int month = Integer.parseInt(request.getParameter("month"));
int day = Integer.parseInt(request.getParameter("day"));
int state = Integer.parseInt(request.getParameter("state"));
pageContext.setAttribute("s", schedule_dao.selectSchedule(schedule_seq));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScheduleRead</title>
<style type="text/css">
	div.{border:1px solid red;}
	body{margin:0 auto; height:100%;  background-color:#F6F6F6;}
	table{width:500px; border-collapse:collapse;}
	table tr, td, th{font-family:맑은 고딕; font-size:11px;}
	tr{border-bottom:1px dotted #B2CCFF; height:25px;}
	#footer{position:fixed; width:100%; bottom:0px; background-color:#EAEAEA; height:35px; border-top:1px solid grey;}
	#hearder{position:relative; height:40px; width:100%; background-color:#EAEAEA; border-bottom:1px solid grey;}
	#body{position:relative; height:100%; width:100%; margin:0 auto;}
	input, img, input.type-image{border: 0 none; vertical-align:middle; font-family:맑은 고딕; font-size:11px; background-color:none;}
	th{text-align:left; padding:5px;}
	#writer{position:absolute; top:22px; left:310px; font-size:11px; font-family:맑은돋움;}
</style>
<script type="text/javascript">
//바이트 채크
function displayBytes( sz, id )
{
    var form= document.schedule;
    var obj = document.getElementById( id );
    if (obj.value.bytes() > sz)
    { //80바이트를 넘기면
        if (event.keyCode != '8') //백스페이스는 지우기작업시 바이트 체크하지 않기 위해서
        {
            alert( sz+'바이트까지 입력이 가능합니다.');
        }
        obj.value = obj.value.substring(0, obj.value.length-1);
    }
    eval('document.all.'+id+'_bytes').innerHTML = eval('form.'+id).value.bytes()+" / 40 Byte(S)";
}
String.prototype.bytes = function()
{
    var str = this;
    var l = 0;
    for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 128) ? 2 : 1;
    return l;
}
</script>
</head>
<body>
	<div id="hearder"><a style="padding:20px; font-size:25px;">Schedule_Modify</a><div id="writer"><b>[${s.writer}]</b>님의_<font color="red">${s.year}년 ${s.month}월 ${s.day}일</font>_일정</div></div>
	<div id="body"><br/>
		<form name="schedule" action="Schedule_modify_proc.jsp" method="post">
			<center>
				<table>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;날짜</th>
						<td>${s.year}년${s.month}월${s.day}일(<font color="red">날자는 변경 하실 수 없습니다.</font>)</td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;시간</th>
						<td >
							<input type="hidden" name="schedule_seq" value="<%=schedule_seq%>">
							<input type="hidden" name="year" value="<%=year%>">
							<input type="hidden" name="month" value="<%=month%>">
							<input type="hidden" name="day" value="<%=day%>">
							<input type="hidden" name="state" value="<%=state%>">
							<input type="text" value="${s.f_hour}" style="width:20px;" name="f_hour">시
							<input type="text" value="${s.f_min}" style="width:20px;" name="f_min">분
							<a>&nbsp;~&nbsp;</a>
							<input type="text" value="${s.s_hour}" style="width:20px;" name="s_hour">시
							<input type="text" value="${s.s_min}" style="width:20px;" name="s_min">분</td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;분류</th>
						<td >
						<input type="hidden" value="${s.schedule_seq}" name="schedule_seq">
						<select name="type">
							<option value="1">출장</option>
							<option value="2">휴가</option>
							<option value="3">내부업무</option>
							<option value="4">FDA</option>
							<option value="5">CFDA</option>
							<option value="6">GMP</option>
							<option value="7">STED</option>
							<option value="8">CE</option>
						</select>&nbsp; |  현제 분류 : 
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
						<td ><input type="text" value="${s.title}" style="width:300px;" name="title"></td>
						
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;장소</th>
						<td width="200px" ><input type="text" value="${s.location}" style="width:300px;"  name="location"></td>
					</tr>
					<tr>
						<th ><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;상세일정</th>
						<td ><textarea cols="45" id='chk1' name='content' onkeyup='javascript_:displayBytes(40,"chk1");'>${s.content}</textarea><br/><div id='chk1_bytes' style="text-align:right;"><a style="color:grey; font-family:맑은 돋움; font-size:12px;">0/ 40 Byte(S)</a></div></td>
					</tr>
					<tr>
						<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;알림설정</th>
						<td >
							<select name="alram">
								<option value="0">미 설정</option>
								<option value="1">설정</option>
							</select>&nbsp; |  현제 분류 : 
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
			<input type="image" src="../hr/img/modify.png" width="40px" onclick="javaScript:document.schedule.submit();"/>
			<input type="image" src="../main/images/exit.png" width="40px" onclick="javaScript:window.close();"/>
		</div>
	</div>
</body>
</html>