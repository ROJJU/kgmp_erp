<%@page import="kgmp.common.dao.Dl_dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.DL" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<%@ page import="kgmp.common.beans.Member" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
String id_sign=(String)session.getAttribute("member_id");
String member_sign=member_dao.printSign(id_sign);
%>
<%
request.setCharacterEncoding("utf-8");
int dl_seq = Integer.parseInt(request.getParameter("dl_seq"));
DL dl = dl_DAO.getOneDl(dl_seq);
if(request.getParameter("state")!=null){
	String state = request.getParameter("state");
	String id = request.getParameter("id");
	String year = request.getParameter("insert_year");
	String month = request.getParameter("insert_month");
	String day = request.getParameter("insert_day");
	dl_DAO.updateState(dl_seq, state, id, year, month, day);
	response.sendRedirect("DL_etc_paper.jsp?dl_seq="+dl_seq);
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/DL_select.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript">
	    function formCheck(){
		    if(confirm('출근으로 허가 하시겠습니까 ?')){
		    	document.forms[0].submit();
		    }
	    }
		var win=null;
		  function printIt(printThis)  {
		    win = window.open('','offprint','width=755 height=526');
		    self.focus();
		    win.document.open();
		    win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
		    win.document.write('table{border-collapse:collapse;border-bottom:1px solid grey;font-size:11px;color:#333;}table th,td{padding:6px;}table th{border-bottom-width:2px;border-bottom-style:solid;border-bottom-color:grey; font-size:1.1em; }table td{ border-bottom-width:1px; border-bottom-style:dotted; border-bottom-color:grey; }');
		    win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
		    win.document.write(printThis);
		    win.document.write('<br/><br/><br/><hr/>');
		    win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
		    win.document.close();
		    win.print();
		    win.close();
		  }
	    </script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>출근부</b></div>
				</div>
				<div id="tablePlace">
					 <table>
					 	<tr>
					 		<td width="570px" align="center" rowspan="2"><b style="font-size:40px;">출 근 부</b></td>
					 		<td rowspan="2" style="background-color:#D5D5D5; border:1px solid grey;"><h3>결제</h3></td>
					 		<td width="75px;"  height="15px" align="center" style="border:1px solid grey;">담당자</td>
					 		<td width="75px;" align="center" style="border:1px solid grey;">대표</td>
				 		</tr>
					 	<tr>
					 		<td style="border:1px solid grey;" align="center"><img src="/save/Member_Sign/<%=member_sign%>" width="50px"></td>
					 		<td style="border:1px solid grey;" align="center" height="55px">
					 		<%if(dl.getState().equals("3")||dl.getState().equals("5")||dl.getState().equals("7")){%>
					 			<img src="../management/img/CEO_Signature.gif" width="50px">
				 			<%}else if(dl.getState().equals("8")){%>
				 				<font color="red">[Reject]</font>
				 			<%}%>
					 		</td>
				 		</tr>
				 	</table><br>
					<table width="800px">
						<tr>
							<th width="100px">날 자</th>
							<td>&nbsp;<%=dl.getInsert_year()%>년 <%=dl.getInsert_month()%>월 <%=dl.getInsert_day() %>일</td>
						</tr>
						<tr>
							<th>출 근</th>
							<td>&nbsp;<%=dl.getHi_work_hour()%>시 <%=dl.getHi_work_min()%>분</td>
						</tr>
						<tr >
							<th>퇴 근</th>
							<td>&nbsp;<%=dl.getBye_work_hour()%>시 <%=dl.getBye_work_min()%>분</td>
						</tr>
						<tr>
							<th height="25px">분 류</th>
							<td>
							<form action="DL_etc_paper.jsp" method="get">
								<input type="hidden" value="<%=dl_seq%>" name="dl_seq">
								<%if(dl.getState().equals("2")){%>
								&nbsp;출장 <input type="hidden" value="3" name="state">
								<%}%>
								<%if(dl.getState().equals("4")){%>
								&nbsp;외근 <input type="hidden" value="5" name="state">
								<%}%>
								<%if(dl.getState().equals("6")){%>
								&nbsp;기타 <input type="hidden" value="7" name="state">
								<%}if(dl.getState().equals("3")||dl.getState().equals("5")||dl.getState().equals("7")){out.print("<b style='color:red;'>정상 출근 처리</b>");}%>
								<input type="hidden" value="${member_id}" name="id">
								<input type="hidden" value="<%=dl.getInsert_year()%>" name="insert_year">
								<input type="hidden" value="<%=dl.getInsert_month()%>" name="insert_month">
								<input type="hidden" value="<%=dl.getInsert_day() %>" name="insert_day">
							</form>
							</td>
						</tr>
						<tr>
							<th>사 유</th>
							<td>&nbsp;<%=dl.getExcuse() %></td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<a style="color:red; font-size:9px;">작성 내용이 사실이 아닐 경우 회사 방침에 따른 징계가 생길 수 있습니다.</a><br><br><br><br><br>
								제출일 : <%=dl.getRel_add_date() %><br><br><br>
								<b style="font-size:25px;">(주) 한국지엠피</b><br><br>
							</td>
						</tr>
					</table><br>
				</div>
				<div id="buttonPlace" align="right" style="margin:0px 60px;">
					<div id="buttons">
						<input type="image" src="img/list.png" width="50px" onClick="goUrl('DLselectView.jsp')">
						<input type="image" src="img/print.png" width="50px" onClick="javascript:printIt(document.getElementById('tablePlace').innerHTML)">&nbsp;&nbsp;&nbsp;
					</div>
				</div>
				<div id="blank" style="height:40px;"><!--blank--></div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>