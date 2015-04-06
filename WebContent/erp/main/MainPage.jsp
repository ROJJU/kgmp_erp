<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Customer, kgmp.common.beans.Report, kgmp.common.beans.Notice, kgmp.common.beans.Schedule, java.util.Map, java.util.*, java.text.*" %>
<jsp:useBean id="CustomerDAO" class="kgmp.common.dao.Customer_db_dao" scope="session"/>
<jsp:useBean id="report_DAO" class="kgmp.common.dao.Report_dao" scope="session"/>
<jsp:useBean id="notice_DAO" class="kgmp.common.dao.Notice_dao" scope="session"/>
<jsp:useBean id="schedule_DAO" class="kgmp.common.dao.Schedule_dao" scope="session"/>
<jsp:useBean id="msg_DAO" class="kgmp.common.dao.Message_dao" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//고객 정보 출력
List<Customer> list_customer = CustomerDAO.getMainCustomer();
pageContext.setAttribute("list_customer", list_customer);
/*설정_오늘날자*/
Calendar cal =Calendar.getInstance();
SimpleDateFormat now = new SimpleDateFormat("yy/MM/dd");
String getNow= now.format(cal.getTime());
pageContext.setAttribute("now", getNow);
int nowY = cal.get(Calendar.YEAR);
int nowM = cal.get(Calendar.MONTH)+1; // +1
int nowD = cal.get(Calendar.DATE);
//일일 업무(받은업무) 출력
String writer = (String)session.getAttribute("member_name");
String id = (String)session.getAttribute("member_id");
List<Report> list_report =report_DAO.getMainReport(nowY, nowM, nowD, id);
pageContext.setAttribute("list_report", list_report);
//공지사항 출력
List<Notice> list_notice = notice_DAO.getMainNotice();
pageContext.setAttribute("list_notice", list_notice);
//일정 출력
List<Schedule> list_sche=schedule_DAO.getMainSchedule();
pageContext.setAttribute("list_sche", list_sche);
//일정 알람 확인
int alram = schedule_DAO.checkalram(writer, nowY, nowM, nowD);
//메시지 자동 삭제
if(nowD==1){
	int month=nowM-10;
	if(month==0){
		month=12;
	}
	msg_DAO.autoDel(month);
}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/MainContent.css"/>
<link rel="stylesheet" type="text/css" href="css/Side.css"/>
<link rel="stylesheet" type="text/css" href="css/Table.css"/>
<link rel="stylesheet" type="text/css" href="css/Main.css"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script language="javascript" type="text/javascript" src="js/mootools-1.2.1-core.js"></script>
<script language="javascript" type="text/javascript" src="js/mootools-1.2-more.js"></script>
<script language="javascript" type="text/javascript" src="js/lofslidernews.mt12.js"></script>
	<%if(alram==1){%>
	<script type="text/javascript">
	window.open("Schedule_alram.jsp","Alram","width=520px, height=320px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
	</script>
	<%}%>
</head>
	<body>
		<jsp:include page="Header.jsp"/>
		<div id="container">
		<jsp:include page="SideMenu.jsp"/>
		<jsp:include page="QuickMenu.jsp"/>
			<div id="content">
				<div id="table" >
<!--                                                                                         -->
<!--                                 공지테이블               					                            -->
<!--                                                                                         -->	
					<div id="noticeTitle"><b>▶ Notice</b></div>
					<div id="noticeLink"><input type="image" src="images/link.png" width="10px;" onclick="goUrl('../notice/NoticeView.jsp')"></div>
					<div id="notice">
						<table width="273px">
							<tr>
								<th>번호</th>
								<th width="150px">내용</th>
								<th>일자</th>
							</tr>
						<c:forEach var="n" items="${list_notice}">
							<tr class="a" onClick="goUrl('../notice/NoticeRead.jsp?notice_seq=${n.notice_seq}');">
								<td align="center">${n.notice_seq}</td>
								<td title="${n.title}"><div class="MainNotice" style="float: left;"><img src="images/icon_n.png" width="22px">&nbsp;${n.title}</div><c:if test="${n.add_date==now}">&nbsp;<img src="images/ico_new.gif" width=10px;></c:if></td>
								<td>${n.add_date}</td>
							</tr>
						</c:forEach>
						</table>
					</div>
<!--                                                                                         -->
<!--                           고객정보 테이블                                     							         -->
<!--                                                                                         -->
					<form action="../management/CDView.jsp" method="post" name="customer_s">			
						<div id="vacationTitle" style="width:250px; ">
							<b style="margin:0px 30px 0px 0px;">▶ Customer</b>
							<input type="hidden" value="all" name="search">
							<input type="text" style="width:80px; border-top:none;" name="find">
							<a style="font-size:11px; color:blue;" href="javaScript:document.customer_s.submit()"> Search</a>
						</div>
					</form>
					<div id="VacationLink"><input type="image" src="images/link.png" width="10px;" onclick="goUrl('../management/CDView.jsp')"></div>
					<div id="vacation">
						<table width="273px">
							<tr>
								<th width="20">번호</th>
								<th width="100px">Company</th>
							</tr>
						<c:forEach var="a" items="${list_customer}">
							<tr class="a" onclick="goUrl('../management/CDRead.jsp?customer_seq=${a.customer_seq}')">
								<td align="center" >${a.customer_seq}</td>
								<td title="${a.company}"><div class="MainCustomer" style="float: left;">${a.company}</div><c:if test="${a.add_date==now}">&nbsp;<img src="images/ico_new.gif" width=10px;></c:if></td>
							</tr>
						</c:forEach>
						</table>
					</div>
<!--                                                                                         -->
<!--                                 보고테이블                                          								 -->
<!--                                                                                         -->
					<div id="confirmTitle" style="width:250px; "><b>▶ Confirm</b><font size=1px;>_받은서류_<%=nowY%>.<%=nowM%>.<%=nowD%></font></div>
					<div id="ConfirmLink"><input type="image" src="images/link.png" width="10px;" onclick="goUrl('../report/DailyView.jsp')"></div>
					<div id="confirm">
						<table width="273px">
							<tr>
								<th>번호</th>
								<th width="140px">서류명</th>
								<th>상태</th>
							</tr>
						<c:if test="${list_report=='[]'}"><tr><td colspan="3" align="center"><font color="red">금일 받은 서류가 없습니다.</font></td></tr></c:if>
						<c:forEach var="b" items="${list_report}">
							<tr align="center" class="a" onclick="goUrl('../report/DailyRead.jsp?daily_seq=${b.daily_seq}&id=${member_id}&state=Home')">
								<td align="center">${b.daily_seq}</td>
								<td align="left" title="${b.title}">
									<div class="MainNotice" style="float: left;">
										<c:if test="${b.depth!=0}"><font color="red">[Ver_${b.step}_${b.depth}]:</font></c:if>
										${b.title}
									</div>
								</td>
								<c:if test="${b.state==0}"><td align="center">대기</td></c:if>
								<c:if test="${b.state==-1}"><td align="center"><a style="color:blue;">컴펌</a></td></c:if>
								<c:if test="${b.state==1}"><td align="center"><a style="color:red;">보완</a></td></c:if>
							</tr>
						</c:forEach>
						</table>
					</div>
				</div><br>
				<div id="scheduleTitle"><b>▶ Schedule_KGMP</b></div>
				<div id="scheduleLink"><input type="image" src="images/link.png" width="10px;" onclick="goUrl('../schedule/ScheduleView.jsp')"></div>
				<hr style="height:2px; background-color:grey;">
			<div id="lofslidecontent45" class="lof-slidecontent">
			<div class="preload"><div></div></div>
<!-- MAIN CONTENT /일정 슬라이드~!! start--> 
			  <div class="lof-main-wapper">
			  <c:forEach var="d" items="${list_sche}">
			  		<div class="lof-main-item">
			        		<img src="images/sback.png" title="Newsflash 2" height="300" width="900"/>           
		                 <div class="lof-main-item-desc">
			                <h3>
			                	<a target="_parent" title="${d.title}">
			                		[
			                		<c:if test="${d.type==1}">출장</c:if>
									<c:if test="${d.type==2}">휴가</c:if>
									<c:if test="${d.type==3}">내부업무</c:if>
									<c:if test="${d.type==4}">FDA</c:if>
									<c:if test="${d.type==5}">CFDA</c:if>
									<c:if test="${d.type==6}">GMP</c:if>
									<c:if test="${d.type==7}">STED</c:if>
									<c:if test="${d.type==8}">CE</c:if>
			                		]
			                		${d.title}
		                		</a>
	                		</h3>
			                <p>${d.content}<br><br>
			                   | 날짜 : ${d.year}.${d.month}.${d.day} | 장소 : ${d.location} | 참가인원 : 없음
			                </p>
			             </div>
			        </div> 
		        </c:forEach>
			  </div>
			<!-- END MAIN CONTENT --> 
		    <!-- NAVIGATOR -->
			  <div class="lof-navigator-outer">
			  		<ul class="lof-navigator">
			  		<c:forEach var="c" items="${list_sche}">
			            <li>
			            	<div>
			                	<img src="/save/${c.emp_pic}" />
			                	<h3>[${c.writer}]</h3>
			                	<h3> 일정명 : ${c.title} </h3>
			                  	<span>${c.year}.${c.month}.${c.day}</span> - ${c.content}
			                </div>    
			            </li>
		            </c:forEach>
			        </ul>
			  </div>
		 	</div>
		 	<hr style="height:2px; background-color:grey;">
			<script type="text/javascript">
				var _lofmain =  $('lofslidecontent45');
				var _lofscmain = _lofmain.getElement('.lof-main-wapper');
				var _lofnavigator = _lofmain.getElement('.lof-navigator-outer .lof-navigator');
				var object = new LofFlashContent( _lofscmain, 
												  _lofnavigator,
												  _lofmain.getElement('.lof-navigator-outer'),
												  { fxObject:{ transition:Fx.Transitions.Quad.easeInOut,  duration:800},
												 	 interval:3000,
										 			 direction :'hrleft' } );
				object.start( true, _lofmain.getElement('.preload') );
			</script>
			</div>
		</div>
		<jsp:include page="Footer.html"/>
	</body>
</html>