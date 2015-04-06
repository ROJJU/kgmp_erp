<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
//달력 연산
Calendar cal =Calendar.getInstance(); 
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1 for month of  korea
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript" src="js/Spending_A.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../main/css/BasicBody.css"/>
		<link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
		<link rel="stylesheet" type="text/css" href="css/Spending_A.css"/>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Spending</b></div>
				</div>
				<div id="blackBox"></div>
				<div id = "reportTable">
					<center>
					<form action="Spend_add_proc.jsp" method="post" name="spending" enctype="multipart/form-data">
						<table class="spending">
							<tr>
								<th width="100px">결제명</th>
								<td align="center">
									<input type="text" size="100px" name="title">
								</td>
							</tr>
						</table><br/>
						<table id="condition" class="spending">
							<tr height="30px">
								<th>적요</th>
								<th>금액</th>
								<th>금액(국문)</th>
								<th>결제방법</th>
								<th>비고</th>
							</tr>
							<tr align="center">
								<td><input type="text" name="summary" style="width:140px;"/></td>
								<td><input type="text" name="money"  style="width:140px;"/></td>
								<td><input type="text" name="money_kor"  style="width:140px;"/></td>
								<td><input type="text" name="how"  style="width:140px;"/></td>
								<td><input type="text" name="etc"  style="width:140px;"/></td>
							</tr>
						</table><br/>
						<table class="spending">
							<tr>
								<th width="100px">첨부 영수증</th>
								<td >
									&nbsp;&nbsp;&nbsp;<input type="file" name="spend_img">
								</td>
								<th width="100px">결제일</th>
								<td>
									&nbsp;&nbsp;&nbsp;<input type="date" name="spend_date">
									<input type="hidden" value="${member_name}" name="writer">
									<input type="hidden" value="<%=nowYear%>" name="year">
									<input type="hidden" value="<%=nowMonth%>" name="month">
								</td>
							</tr>
						</table><br/>
					</form>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="../hr/img/cancel.png" width="50px" onClick="goUrl('SpendingView.jsp')">
						<input type="image" src="../hr/img/save.png" width="50px" onClick="formCheck();">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>