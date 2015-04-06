<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%
int num = Integer.parseInt(request.getParameter("str"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/Weekly_R.css"/>
		<script type="text/javascript">
		var win=null;
		  function printIt(printThis)  {
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
		</script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Weekly Report </b></div>
				</div>
				<div id = "reportTable">
					<p align="right"><b>- 8월 5주차 -</b></p>
					<center>
						<table class="week">
							<tr><td colspan="7" height="30px" class="style"><b>한국지엠피 주간 업무 보고</b></td></tr>
							<tr><td colspan="7" ><p align="right">작성자:김찬홍&nbsp;&nbsp;</p></td></tr>
							<tr>
								<td class="style" width="110px">일(요일)</td>
								<td class="style" width="100px">파견근무업체</td>
								<td class="style" width="150px">파견근무지</td>
								<td class="style"  width="50px">분류</td>
								<td class="style">내부 진행 사항/주요업무</td>
								<td class="style"  width="40px">첨부</td>
								<td class="style">외부 업무</td>
							</tr>
							<%for(int i=0;i<=num;i++){
								String a= Integer.toString(i);
								String company = request.getParameter("company"+a);
								String work = request.getParameter("work"+a);
								String content = request.getParameter("content"+a);
								String week = request.getParameter("week"+a);
								String date = request.getParameter("date"+a);
								String group = request.getParameter("group"+a);
							%>
							<tr>
								<td class="style"><%=date%> (<%=week %>)</td>
								<td><%=company %></td>
								<td><%=work%></td>
								<td><%=group%></td>
								<td><%=content %></td>
								<td><input type="image" src="img/icon_attach.gif"></td>
								<td><input type="image" src="img/out.gif"></td>
							</tr>
							<%}%>
							<!--
							<tr>
								<td>-</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>-</td>
								<td></td>
								<td>블로그</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.22 (월)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.25 (화)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.26 (수)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.27 (목)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>-->
						</table>  <br><br>
						<table class="week">
							<tr><td colspan="7" height="30px" class="style"><b>한국지엠피 차주 업무 계획</b></td></tr>
							<tr>
								<td class="style" width="110px">일(요일)</td>
								<td class="style" width="100px">파견근무업체</td>
								<td class="style" width="150px">파견근무지</td>
								<td class="style"  width="50px">분류</td>
								<td class="style">내부 진행 사항/주요업무</td>
								<td class="style"  width="40px">첨부</td>
								<td class="style">외부 업무</td>
							</tr>
							<tr>
								<td rowspan="3" class="style">2014.00.00 (금)</td>
								<td>본사</td>
								<td>성균관대산학협력센터</td>
								<td>내부</td>
								<td>[K-GMP CD] 중간 보고 후 각 페이지 수정 보완</td>
								<td><input type="image" src="img/icon_attach.gif"></td>
								<td><input type="image" src="img/out.gif"></td>
							</tr>
							<tr>
								<td>-</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>-</td>
								<td></td>
								<td>블로그</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.22 (월)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.25 (화)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.26 (수)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td class="style">2014.08.27 (목)</td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="../notice/img/list.png" width="50px" onClick="goUrl('WeeklyView.jsp')">
						<input type="image" src="../notice/img/modify.png" width="50px" onClick="goUrl('EmploymentAdd.jsp')">
						<input type="image" src="../notice/img/del.png" width="50px">
						<input type="image" src="img/print.png" width="50px" onClick="javascript:printIt(document.getElementById('reportTable').innerHTML)">
						<input type="image" src="img/exl.png" width="50px">
						<input type="image" src="img/hwp.png" width="50px">
					</div>
				</div>
			</div>		
		</div>
	</body>
</html>