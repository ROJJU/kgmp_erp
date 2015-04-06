<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Schedule, java.util.Map, java.util.List" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao" scope="session"/>
<%@ page import="kgmp.common.beans.Member" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
String id=(String)session.getAttribute("member_id");
String member_sign=member_dao.printSign(id);
%>
<%
//설정
	request.setCharacterEncoding("utf-8");
	String linkURL = "VacationView.jsp";
//현재페이지 설정
	int currentPage = 1;
	String search = "all";
	String find = "";
	if(request.getParameter("currentPage") != null)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	if(request.getParameter("search") != null)
		search=request.getParameter("search");
	if(request.getParameter("find") != null)
		find= request.getParameter("find");
//페이징과 리스트 가져오기
	Map<String, Object> pageAll = schedule_dao.getVacation(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<Schedule> list = (List<Schedule>)pageAll.get("list");
//페이지속성 추가
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
	    <link rel="stylesheet" type="text/css" href="../welfare/css/Vacation_V.css"/>
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
		function goSubmit(){
			var test = document.getElementsByName("state").value;
			alert(test);
		}
		</script>
		<style type="text/css">
			 #font{
			  font-family:"Arial Black";
			  font-size:0.75em;
			  fontp-weight :bold;
			 }
			 ul.main_menu{
			  margin:5px 0 0 10px;
			  padding:0;
			 }
			 ul.main_menu li{
			  list-style-type:none;
			  display:block;
			  width:72px;
			  height:22px;
			  text-align:center;
			  margin:0 3px 0 0;
			  padding:3px 0 0 0;
			  float:left;
			  border:1px solid #999;
			  border-bottom:none;
			  /*background-image : url(../bar/notify/img/tab1.gif);*/
			  color : #ffffff;
			  background-color:#D5D5D5;
			 }
			 ul.main_menu li.active{
			  /*  background-image : url(../bar/notify/img/tab2.gif);*/
			  background-color:#ffffff;
			  border:1px solid grey;
			  padding-bottom:1px;
			  border-bottom:none;
			  color:#422700;
			 }
			 ul.main_menu li:hover{
			  border-bottom:none;
			  background-color:#ffffff;
			  color:black;
			  cursor:pointer;
			  cursor:hand;
			  border-bottom:none;
			  padding-bottom:1px;
			 }
			 .box{
			  position :relative;
			  border-bottom:1px solid #666;
			  height:26px;
			  width : 800px;
			  margin:0 auto;
			 }
			 a.submit:hover{
			 color:red;
			 text-decoration:underline;
			 }
		</style>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Admin_Vacation</b></div>
					<div id ="dailyAdd"><input type="image" src="../schedule/img/link.png" width="6px" onclick="popupVaAdd()"></div>
				</div>
				<div class="box">
					<div id = "font">
						  <ul class="main_menu">
							   <li class="active" onclick = "goUrl('adminVacation.jsp')">휴가승인</li>
 							   <li onclick = "goUrl('adminSpend.jsp')">지출승인</li>
 							   <li onclick = "goUrl('adminDl.jsp')">출근부승인</li>
							   <li onclick = "goUrl('adminWork.jsp')">업무확인</li>
						  </ul>
					 </div>
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
								<th width="120px">승인</th>
							</tr>
						<c:if test="${list=='[]'}">
							<tr><td align="center" colspan="7"><font color="red">휴가 신청 내역이 없습니다.</font></td></tr>
						</c:if>
						<c:forEach var="a" items="${list}">
							    <tr class="a">
								<td align="center">${a.year}-${a.schedule_seq}</td>
								<td align="center" >${a.writer}</td>
								<td>${a.title}_[${a.content}]</td>
								<th align="center" >${a.date_cal}일</th>
								<th align="center" >${a.year}-${a.month}-${a.day}~${a.date2}</th>
								<td align="center" >
									<c:if test="${a.state==0}"><b >[Wait]</b></c:if>
									<c:if test="${a.state==1}"><b style="color:blue;">[Confirm]</b></c:if>
									<c:if test="${a.state==2}"><b style="color:red;">[Reject]</b></c:if>
								</td>
								<td align="center">
									<c:if test="${a.state==0}">
										<a class="submit" href="admin_vacation_proc.jsp?schedule_seq=${a.schedule_seq}&date_check=${a.date_check}&state=1&year=${a.year}&month=${a.month}&day=${a.day}&id=${a.id}">[Confirm]</a> | 
										<a class="submit" href="admin_vacation_proc.jsp?schedule_seq=${a.schedule_seq}&date_check=${a.date_check}&state=2">[Reject]</a>
									</c:if>
									<c:if test="${a.state==1||a.state==2}">
										<font color="red">이미 처리된 건 입니다.</font>
									</c:if>
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
								<input type="text">&nbsp; <input type="image" src="../notice/img/serch.png" width="45px">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>