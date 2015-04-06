<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, kgmp.common.beans.Schedule"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<%	
	String stryear ="", strmonth="", strday="", sql="",url="",subject="",bgcolor="";
	int year=0,month=0,month1=0, i=0, j=0, id=0,id1=0, id2=0,day=0, z=0, m=0,m1=0, m2=0,cf =0 ,ud=0, cfz=0, oz =0;
%>
<%
	Calendar myCal = Calendar.getInstance();
	Calendar myCaled = Calendar.getInstance();
	Calendar myCaled1 = Calendar.getInstance();
	Calendar nowCal = Calendar.getInstance();
	
	int nowYear = nowCal.get(Calendar.YEAR);
	int nowMonth = nowCal.get(Calendar.MONTH);
	int nowDay = nowCal.get(Calendar.DAY_OF_MONTH);
	try{
		stryear = request.getParameter("year");
		strmonth = request.getParameter("month");
		strday = request.getParameter("day");
	}catch(Exception e){}
%>
<%
	if(stryear == null){
		year = myCal.get(myCal.YEAR);
	}else{
		year = Integer.parseInt(stryear);
	}

	if(strmonth == null){
		month = myCal.get(myCal.MONTH);
	}else{
		month = Integer.parseInt(strmonth)-1;
	}
	if(strday == null){
		day = myCal.get(myCal.DATE);
	}else{
		day = Integer.parseInt(strday);
	}
	

	myCal.set(myCal.YEAR, year);
	myCaled.set(myCal.YEAR, year);
	myCaled1.set(myCal.YEAR, year);
	myCal.set(myCal.MONTH, month);
	myCaled.set(myCal.MONTH, month);
	myCaled1.set(myCal.MONTH, month-1);
	myCal.set(myCal.DATE, day);
	myCaled.set(myCal.DATE, day);
	myCaled1.set(myCal.DATE, day);
	month = month + 1;
//주간 업무 출력
	List<Schedule> list = schedule_dao.getWeekSchedule(year, month);
	pageContext.setAttribute("list", list);
	int up=-1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/BasicBody.css"/>
	    <link type="text/css" href="css/Schedule_w.css" rel="stylesheet" />
	    <script type="text/javascript">
	    function popupScheRead(schedule_seq, state){
	    	window.open("ScheduleRead.jsp?schedule_seq="+schedule_seq+"&state="+state,"scheRead","width=520px, height=320px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
	    	}
	    function popupScheAdd(year, month, day){
			   window.open("ScheduleAdd.jsp?year="+year+"&month="+month+"&day="+day,"scheAdd","width=520px, height=340px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
			}
		function window_onload()
		 {
		    for ( i=1988;i<=2017 ; i++)
		   {
		        var op= new Option(i+ "년",i);
		         syear.options[i -1988]=op; 
		         if(i== <%=year %> )
		         {
		            syear.options[i -1988].selected ="selected" ;
		         }
		   }
		     for ( i=1;i<=12 ; i++)
		     {
		        var op= new Option(i+ "월",i);
		         smonth.options[i -1]=op;
		         if(i== <%=month %>)
		         {
		             smonth.options[i -1].selected = "selected";
		         }
		     }
		     for ( i=1;i<=31 ; i++)
		     {
		        var op= new Option(i+ "일",i);
		         sday.options[i -1]=op;
		         if(i== <%=day %>)
		         {
		             sday.options[i -1].selected = "selected";
		         }
		     }
		 }
		function month_onchange()
		{   
		     var month = smonth.value;
		     var year = syear.value;
		     var day = sday.value;
		     var addr = "ScheduleView_w.jsp?year=" + year +"&month=" + month+"&day="+day;
		    //alert(addr);
		    //addr 이 가지는 주소값으로  페이지를 이동시킨다.       
		   location.href = addr;
		   
		}
		function year_onchange()
		{
		     var year = syear.value;
		     var month = smonth.value;
		     var day = sday.value;
		     var addr = "ScheduleView_w.jsp?year=" + year +"&month=" + month+"&day="+day;
		    
		        location.href = addr;
		}
		function day_onchange()
		{
			var year = syear.value;
		    var month = smonth.value;
		    var day = sday.value;
		    var addr = "ScheduleView_w.jsp?year=" + year +"&month=" + month+"&day="+day;
		    //alert(addr);
		    location.href= addr;
		}
		function goToday(year, month, day){
			var addr = "ScheduleView_w.jsp?year=" + year +"&month=" + month+"&day="+day;
			alert("오늘 ["+year+"년"+month+"월"+day+"일] 로 이동 됩니다.")
			location.href= addr;
		}
	    </script>
	</head>
	<body onload ="window_onload()">
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id="titlePlace">
					<div id="pageTitle"><b>Schedule</b></div>
				</div>
					<div class="box">
						<div id = "font">
						  <ul class="main_menu">
							   <li onclick="goUrl('ScheduleView.jsp')">Month</li>
   							   <li class="active">Week</li>
							   <li onclick = "goToday(<%=nowYear%>, <%=nowMonth+1%>, <%=nowDay%>)">Go Today</li>
						  </ul>
						 </div>
						 <div style="text-align:right;">
							<b>
							   <select id = "syear" onchange= "year_onchange()">
							   		<option ></option >
							   </select >
						    </b>
						    <b>
							    <select   id= "smonth" onchange= "month_onchange()">
							    	<option ></option >
							    </select>
						    </b>
						    <b>
						    	<select   id= "sday" onchange= "day_onchange()">
							    	<option ></option >
							    </select>
						    </b>
					 	</div>
					 </div>
					<center>
						<table class="week">
						<%  
							i = myCal.get(myCal.DAY_OF_MONTH);
							//이번달 마지막 날짜 구하는 함수
							do{
								id++;
								myCaled.set(myCaled.DAY_OF_MONTH,id);
									if(id != myCaled.get(myCaled.DAY_OF_MONTH)){
										break;
									}m = myCaled.get(myCaled.DAY_OF_WEEK);
							}while(true);
							//1일 의 위치가 요일중 몇 번짼가 알아 보는것이다
							do{
								id1++;
								myCaled.set(myCaled.DAY_OF_MONTH,id1);
								m1 = myCaled.get(myCaled.DAY_OF_WEEK);
								break;
							}while(true);
							
							//앞단의 남은 일자 구하기	
							do{
								id2++; //id2값이 앞 달의 맨 끝날짜 구하는곳이다
								myCaled1.set(myCaled1.DAY_OF_MONTH,id2);
									if(id2 != myCaled1.get(myCaled1.DAY_OF_MONTH)){
										break;
									}m2 = myCaled1.get(myCaled1.DAY_OF_WEEK);
							}while(true);
							//이번 주 백그라운드 색 변경하는 공식
							String bgColor=(nowYear==year)&&(nowMonth+1==month)
					                &&(nowDay==i)? " #e6e4e6": "#ffffff";
							oz=(id2-1)-(m2-1); // 앞 달의 한주가 시작 하는 날짜 구하는 공식
							//달력에 칸수 보여주는 함수
								for(z=((i+1)-myCal.get(myCal.DAY_OF_WEEK)) ; z<=((i+1)-myCal.get(myCal.DAY_OF_WEEK) + 6) ;z++){
										cf++;//일요일 체크하는 flog로 정리 한다.
									if(z<=(id-1)){
										out.println("<tr><td  width=50 id='week'");//tr open//td open
										if(cf == 1){
											out.println(" bgcolor = red>");
											out.println("<font color=ffffff>&nbsp;SUN<font color/>");
										}
										if(cf == 2){
											out.println("bgcolor = #e6e4e6>");
											out.println("&nbsp;MON");
										}
										if(cf == 3){
											out.println("bgcolor = #e6e4e6>");
											out.println("&nbsp;TUE");
										}
										if(cf == 4){
											out.println("bgcolor = #e6e4e6>");
											out.println("&nbsp;WED");
										}
										if(cf == 5){
											out.println("bgcolor = #e6e4e6>");
											out.println("&nbsp;THU");
										}
										if(cf == 6){
											out.println("bgcolor = #e6e4e6>");
											out.println("&nbsp;FRI");
										}
										if(cf == 7){
											out.println(" bgcolor = blue>");
											out.println("<font color=ffffff>&nbsp;SAT<font color/>");
										}
											out.println("</td>");//td close
						
										if(z <= 0){
											if((id2-1) >= oz){
												int lastMonth=month-1;
												out.println("<td align='center' width='70px' style='background-color:"+bgColor+";'>["+lastMonth+"월] "+oz+++"일</td>"); // 앞 달의 한주가 시작 하는 날짜 나타나는 곳
											}
										}else{//앞에 처음 달 날짜를 만든다
											out.println("<td align='center' width='70px' style='background-color:"+bgColor+";'>"+z+"일</td>");//그 주간 날자 출력
										}
										%>
						<!--                                                                           -->
						<!--                       여기를 for 루프 돌리면 되요!!!                -->
						<!--                                                                           -->
											<td width='500px' id="a" bgcolor="#ffffff">
												<c:forEach var="a" items="${list}">
													<% up++;
													if(z==list.get(up).getDay()){
													//out.print("&nbsp; <a onclick='popupScheRead()' style='background-color:#ffffff;'>[김찬홍]_오후 10시00분~10시30분_휴식</br>&nbsp; [김찬홍]_오후 11시00분~11시30분_개발</a>");
													%>
													<a onclick="popupScheRead(${a.schedule_seq}, 1)" id="sche_w">
													<c:if test="${a.alram==1}"><img src="img/alram.png" width="20px">&nbsp;</c:if>[${a.writer}
													<c:if test="${a.type==1}"><b  style="color:blue; background-color:grey;">( 출장 )</b></c:if>
													<c:if test="${a.type==2}"><b style="color:red; background-color:grey;">( 휴가 )</b></c:if>
													<c:if test="${a.type==3}"><b style="color:#ffffff; background-color:grey;">( 내부업무 )</b></c:if>
													<c:if test="${a.type==4}"><b style="color:yelloW; background-color:grey;">( FDA )</b></c:if>
													<c:if test="${a.type==5}"><b style="color:#1DDB16; background-color:grey;">( CFDA )</b></c:if>
													<c:if test="${a.type==6}"><b style="color:#FF5E00; background-color:grey;">( GMP )</b></c:if>
													<c:if test="${a.type==7}"><b style="color:#353535; background-color:grey;">( STED )</b></c:if>
													<c:if test="${a.type==8}"><b style="color:#FF007F; background-color:grey;">( CE )</b></c:if>
													]_${a.f_hour}시${a.f_min}분 ~ ${a.s_hour}시_${a.s_min}분  |  ${a.title}
													</a>
													<br>
													<%} %>
												 </c:forEach>
											</td>
											<td align="center" style="vertical-align:top; width:8px;" bgcolor="#e6e4e6"><input type="image" src="img/link.png" width="6px" onclick="popupScheAdd(<%=year%>,<%=month%>,<%=z%>)"></td>
										</tr>
										<% up=-1;
									}else{
										break;
									}
								}
								/*  //뒷 자리 다음 달의 날짜를 합친다
								if((z-1)==(id-1)&&m<7){
									for(int t=1 ;t<=7-m;t++){
										int nextMonth=month+1;
										out.println("<td align='center' width='70px' style='background-color:"+bgColor+";'>["+nextMonth+"월] "+t+"일</td>");
									}
								}*/
							%>
						</table>
						<table class="week" id="aaa" width="708px" style="background-color:grey; border-top:1px solid black; border-bottom:1px solid black;">
						  	<tr style="background-color:grey;">
						  		<td align="left">
						  			&nbsp;&nbsp;<a style="background-color:blue">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;출장&nbsp;
						  			<a style="background-color:red;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;휴가&nbsp;
						  			<a style="background-color:#ffffff;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;내부업무&nbsp;
						  			<a style="background-color:yelloW;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;FDA&nbsp;
						  			<a style="background-color:#1DDB16;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;CFDA&nbsp;
						  			<a style="background-color:#FF5E00;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;GMP&nbsp;
						  			<a style="background-color:#353535;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;STED&nbsp;
						  			<a style="background-color:#FF007F;">&nbsp;&nbsp;&nbsp;&nbsp;</a>&nbsp;CE&nbsp;
					  			</td>
						  		<td style="text-align:right; vertical-align:bottom; color:#ffffff;">K-GMP&nbsp;</td>
					  		</tr>
				  		</table>
					</center>
				</div>
<!--높이를 100%로 두어 블랭크(빈공간)으로 사용 중 지우지 마세요~!!!!-->
				<div id="buttonPlace">
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>