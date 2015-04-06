<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Schedule, java.util.Map, java.util.List" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao" scope="session"/>
<%@ page import="kgmp.common.beans.Member" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%@ page import=" java.util.*" %>
<%

//setting calendar
Calendar cal =Calendar.getInstance(); 
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1
String id=(String)session.getAttribute("member_id");
String writer=(String)session.getAttribute("member_name");
String member_sign=member_dao.printSign(id);
double countV=schedule_dao.countVacation(writer, nowYear);

//print vacation date
Member member = member_dao.printDate(id);
int vacation_date=0;
//check have to add vacation date or not
if(member_dao.isVacation(id, nowYear, nowMonth)){
	int updateMonth=nowMonth+1;
	if(updateMonth==13){
		updateMonth=1;
		nowYear=nowYear+1;
		vacation_date=member.getVacation_date()+1;
	}else if(updateMonth==1){
		System.out.println("초기화 진행 완료");
	}else{
		vacation_date=member.getVacation_date()+1;
	}
	member_dao.updateVacation(nowYear, updateMonth, id, vacation_date);
}
%>
<%
//setting page
	request.setCharacterEncoding("utf-8");
	String linkURL = "VacationView.jsp";
	int currentPage = 1;
	String search = "all";
	String find = "";
	if(request.getParameter("currentPage") != null)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	if(request.getParameter("search") != null)
		search=request.getParameter("search");
	if(request.getParameter("find") != null)
		find= request.getParameter("find");
//get list
	Map<String, Object> pageAll = schedule_dao.getVacation(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<Schedule> list = (List<Schedule>)pageAll.get("list");
//set attribute for print
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pageList", pageList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/Vacation_V.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script type="text/javascript">
		function popupVaAdd(){
			var member_sign = document.getElementById("member_sign").value;
				if(member_sign=="null"||member_sign==" "||member_sign=="-"){
					alert("서명 등록을 하셔야 합니다. (인사>인사카드관리>개인서명관리)에서 서명 등록 후 진행 하시기 바랍니다.");
				}else{
	 			  	window.open("VacationAdd.jsp","vaAdd","width=520px, height=270px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
				}
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
					<div id ="pageTitle"><b>Vacation</b></div>
					<div id ="dailyAdd"><input type="image" src="../schedule/img/link.png" width="11px" onclick="popupVaAdd()"></div>
						<input type="hidden" value="<%=member_sign%>" id="member_sign">
				</div>
				<div id="can" align="center">
					<b>휴가일수</b><br><%=member.getVacation_date()%>일
				</div>
				<div id="use">
					<b>사용일수</b><br><a style="color:blue"><%=countV%>일</a>
				</div>
				<div id="left">
					<b>잔여일수</b><br><a style="color:red;"><%=member.getVacation_date()-countV%>일</a>
				</div>
				<div id = "DLTable">
					<center>
						<table width="800px">
							<tr>
								<th width="100px">신청번호</th>
								<th width="70px">성 명</th>
								<th>휴가명_[적요]</th>
								<th width="60px">근태 수</th>
								<th width="150px">근태 기간</th>
								<th width="40px">상 태</th>
							</tr>
						<c:if test="${list=='[]'}"><tr><td colspan="7" align="center">등록된 휴가 신청이 없습니다.</td></tr></c:if>
						<c:forEach var="a" items="${list}">
							<c:if test="${member_name==a.writer}"><tr onclick="goUrl('VacationRead.jsp?schedule_seq=${a.schedule_seq}')" class="a"></c:if>
							<c:if test="${member_name!=a.writer}"><tr onclick="javaScript:alert('서류 열람은 본인만 가능합니다.');" class="a"></c:if>
								<td align="center">${a.year}-${a.schedule_seq}</td>
								<td align="center" >${a.writer}</td>
								<td>${a.title}_[${a.content}]</td>
								<th align="center" >${a.date_cal}일</th>
								<th align="center" >${a.year}-${a.month}-${a.day}~${a.date2}</th>
								<td align="center" >
									<c:if test="${a.state==0}"><b>[Wait]</b></c:if>
									<c:if test="${a.state==1}"><b style="color:blue;">[Confirm]</b></c:if>
									<c:if test="${a.state==2}"><b style="color:red;">[Reject]</b></c:if>
								</td>
							</tr>
						</c:forEach>
						</table><br/>
						<div id="paging">${pageList}</div>
						<div id="bottonPlace">
							<div id="bottons">
							</div><br>
							<div id ="serch">
								<select>
									<option>ALL</option>
									<option>직책</option>
									<option>소속</option>
									<option>성명</option>
									<option>일자</option>
								</select>
								<input type="text">&nbsp; <input type="image" src="../notice/img/serch.png" width="45px"> &nbsp; <input type="button" value="get vacation" onclick="javaScript:location.href='VacationView.jsp'">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>