<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="kgmp.common.beans.Schedule, kgmp.common.beans.Member" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao" scope="session"/>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
String id=(String)session.getAttribute("member_id");
String member_sign=member_dao.printSign(id);
%>
<%
int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
Schedule sche= schedule_dao.printSche(schedule_seq);
Member member = member_dao.printVacation(sche.getWriter());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link type="text/css" rel="stylesheet" href="css/Vacation_R.css">
		<script type="text/javascript">
		var win=null;
		  function printIt(printThis){
		    win = window.open('','offprint','width=755 height=526');
		    self.focus();
		    win.document.open();
		    win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
		    win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
		    win.document.write('table{width:800px; border-collapse:collapse;}table th, td{ border:1px solid black;}table th{background-color:#D5D5D5;}');
		    win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
		    win.document.write('<br/><hr style="border: solid 1px grey;"/><br/><br/><br/>');
		    win.document.write(printThis);
		    win.document.write('<br/><br/><br/><hr style="border: solid 1px grey;"/>');
		    win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
		    win.document.close();
		    win.print();
		    win.close();
		  }
		  
		  function popupVaModify(schedule_seq, date_cal){
			   window.open("VacationModify.jsp?schedule_seq="+schedule_seq+"&date_cal="+date_cal,"vaAdd","width=520px, height=270px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
			}
		</script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>휴가신청 </b></div>
				</div>
				<div id = "reportTable">
					<center>
						<table>
							<tr align="center">
								<td rowspan="2" width="500px"><h1>휴 가 계</h1></td>
								<th height="60px">담 당</th>
								<td ><img src="/save/Member_Sign/<%=member_sign%>" width="65px"></td>
							</tr>
							<tr>
								<th height="60px">대 표</th>
								<td align="center">
									<%if(sche.getState()==2){%>
										<b style="color:red;">[Reject]</b>
									<%}else if(sche.getState()==1){%>
									<img src="../management/img/CEO_Signature.gif" width="50px">
									<%}else{%>
										[Wait]
									<%}%>
								</td>
							</tr>
						</table><br/>
						<table>
							<tr>
								<td width="100px"  height="40" align="center">소 속</td>
								<td>&nbsp;<%=member.getDepartment()%></td>
								<td width="100px" align="center">직 위</td>
								<td>&nbsp;<%=member.getW_level()%></td>
							</tr>
							<tr>
								<td height="40px" align="center">성 명</td>
								<td colspan="3">&nbsp;<%=sche.getWriter()%></td>
							</tr>
							<tr>
								<td height="40px" align="center">휴가기간</td>
								<td colspan="3">&nbsp;<%=sche.getYear()%>-<%=sche.getMonth()%>-<%=sche.getDay()%>~<%=sche.getDate2()%> [총 <%=sche.getDate_cal() %>일]</td>
							</tr>
							<tr><th colspan="4" height="40px">휴가사유</th></tr>
							<tr><td colspan="4" height="150px"  align="center"><%=sche.getTitle() %><br><br><%=sche.getContent()%></td></tr>
							<tr>
								<td colspan="4" height="500px">
									<h3  align="center">위 본인은 상기의 사유로 인하여 휴가하고자 합니다.</h3><br><br><br><br><br><br><br><br><br><br><br>
									<p  align="center"><%=sche.getAdd_date()%></p><br><br><br><br>
									<p align="right" style="padding:0px 40px; font-size:13px;">위 신청인 <%=sche.getWriter()%> (인)</p><br><br>
									<h1  align="center">주식회사 한국지엠피 귀하</h1>
								</td>
							</tr>
						</table>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons"align="right">
						<input type="image" src="../hr/img/list.png" width="50px" onClick="goUrl('VacationView.jsp')">
						<%if(sche.getState()==0){%>
							<input type="image" src="../hr/img/modify.png" width="50px" onClick="popupVaModify(<%=schedule_seq%>, <%=sche.getDate_cal()%>)">
							<input type="image" src="../hr/img/del.png" width="50px" onClick="goUrl('Vacation_del_proc.jsp?schedule_seq=<%=schedule_seq%>&date_check=<%=sche.getDate_check()%>')">
						<%}%>
						<input type="image" src="../hr/img/print.png" width="50px" onClick="javascript:printIt(document.getElementById('reportTable').innerHTML)">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>