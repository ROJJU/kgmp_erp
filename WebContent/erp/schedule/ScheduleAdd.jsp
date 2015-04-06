<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ScheduleAdd</title>
<style type="text/css">
	div.{border:1px solid red;}
	body{margin:0 auto; height:100%; background-color:#F6F6F6;}
	table{width:500px; border-collapse:collapse;}
	table tr, td, th{font-family:맑은돋움; font-size:11px;}
	#footer{position:fixed; width:100%; bottom:0px; background-color:#EAEAEA; height:35px; border-top:1px solid grey;}
	#hearder{position:relative; height:40px; width:100%; background-color:#EAEAEA; border-bottom:1px solid grey;}
	#body{position:relative; height:100%; width:100%; margin:0 auto;}
	input, img, input.type-image{/* border: 0 none; */ vertical-align:middle;}
	th{text-align:left; padding:5px;}
	#writer{position:absolute; top:22px; left:420px; font-size:11px; font-family:맑은돋움;}
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
function popupSearch(){
	window.open("/kgmp/erp/main/MessageSearch.jsp","Search","width=450px, height=470px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
}
</script>
</head>
<body>
	<div id="hearder"><a style="padding:20px; font-size:25px;">Schedule</a><div id="writer">작성자 : ${member_name}</div></div>
	<div id="body"><br/>
		<form name="schedule" action="Schedule_add_proc.jsp" method="post">
			<table>
				<tr>
					<th width="70px"><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;날자</th>
					<td >
						<input type="text" value="선택 날짜 : <%=year%>년<%=month%>월<%=day%>일" readonly>
						<input type="hidden" name="year" value="<%=year%>">
						<input type="hidden" name="month" value="<%=month%>">
						<input type="hidden" name="day" value="<%=day%>">
						<input type="hidden" name="writer" value="${member_name}">
						<input type="hidden" name="emp_pic" value="${member_pic}">
						<input type="hidden" name="id" value="${member_id}">
					</td>
				</tr>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;시간</th>
					<td >
						<input type="text" style="width:20px;" maxlength="2" name="f_hour">시
						<input type="text" style="width:20px;" maxlength="2" name="f_min">분<a> ~ </a>
						<input type="text" style="width:20px;" maxlength="2" name="s_hour">시
						<input type="text" style="width:20px;" maxlength="2" name="s_min">분
					</td>
				</tr>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;분류</th>
					<td>
						<select name="type">
							<option value="1">출장</option>
							<option value="2">휴가</option>
							<option value="3">내부업무</option>
							<option value="4">FDA</option>
							<option value="5">CFDA</option>
							<option value="6">GMP</option>
							<option value="7">STED</option>
							<option value="8">CE</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;일정명</th>
					<td ><input type="text" name="title"></td>
					
				</tr>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;장소</th>
					<td width="200px" ><input type="text" name="location"></td>
				</tr>
				<tr>
					<th ><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;상세일정</th>
					<td ><textarea cols="45" id='chk1' name='content' onkeyup='javascript_:displayBytes(40,"chk1");'></textarea><br/><div id='chk1_bytes' style="text-align:right;"><a style="color:grey; font-family:맑은 돋움; font-size:12px;">0/ 40 Byte(S)</a></div></td>
				</tr>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;알림설정</th>
					<td >
						<select name="alram">
							<option value="0">미 설정</option>
							<option value="1">설정</option>
						</select>
					</td>
				</tr>
			</table><br/>
		</form>
	</div>
	<div id="footer" align="right">
		<div id="buttons" style="padding:5px;">
			<input type="image" src="../hr/img/add.png" width="40px" onclick="javaScript:document.schedule.submit();"/>
			<input type="image" src="../main/images/exit.png" width="40px" onclick="javaScript:window.close();"/>
		</div>
	</div>
</body>
</html>