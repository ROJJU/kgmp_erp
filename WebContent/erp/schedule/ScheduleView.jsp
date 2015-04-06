<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, kgmp.common.beans.Schedule"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
 <%
 request.setCharacterEncoding("UTF-8");
//print db
List<Schedule> list = schedule_dao.getSchedule();
pageContext.setAttribute("list", list);
int a=-1;
//setting calendar
 Calendar cal =Calendar.getInstance(); 

  int nowYear = cal.get(Calendar.YEAR);
  int nowMonth = cal.get(Calendar.MONTH)+1; // +1
  int nowDay = cal.get(Calendar.DAY_OF_MONTH);
  request.setCharacterEncoding( "utf-8");
  String strYear = request.getParameter( "year");
  String strMonth = request.getParameter( "month");
 
    int year = nowYear; // 현재의 년을 받아옴.
    int month = nowMonth; // 현재의 월을 받아옴.
    int i;
    if(strYear != null){
     year = Integer.parseInt(strYear); 
    }
    if(strMonth != null){
     month = Integer.parseInt(strMonth);
    }
   
    cal.set(year,month-1,1);
    int startDay = 1;
   
    int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
    int week = cal.get(Calendar.DAY_OF_WEEK);
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link type="text/css" href="css/Schedule.css" rel="stylesheet" />
	    <script type="text/javascript">
		    $(window).load(function(){
			    $('#loading').hide();
			  });
			function popupScheAdd(year, month, day){
				   window.open("ScheduleAdd.jsp?year="+year+"&month="+month+"&day="+day,"scheAdd","width=520px, height=340px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
				}
			function popupPerson(writer, year, month, day){
				   window.open("SchedulePerson.jsp?year="+year+"&month="+month+"&day="+day+"&writer="+encodeURI(encodeURIComponent(writer)),"schePerson","width=520px, height=280px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
				}
			function window_onload(){
			    for ( i=1988;i<=2017 ; i++){
			        var op= new Option(i+ "년",i);
			         syear.options[i -1988]=op; 
			         if(i== <%=year %> )
			         {
			            syear.options[i -1988].selected ="selected" ;
			         }
			   }
			     for ( i=1;i<=12 ; i++){
			        var op= new Option(i+ "월",i);
			         smonth.options[i -1]=op;
			         if(i== <%=month %>)
			         {
			             smonth.options[i -1].selected = "selected";
			         }
			     }
			 }
			function month_onchange(){   
			     var month = smonth.value;
			     var year = syear.value;
			     var addr = "ScheduleView.jsp?year=" + year +"&month=" + month;
			    //alert(addr);
			    //addr 이 가지는 주소값으로  페이지를 이동시킨다.       
			   location.href = addr;
			}
			function year_onchange()
			{
			     var year = syear.value;
			     var month = smonth.value;
			     var addr = "ScheduleView.jsp?year=" + year +"&month=" + month;
			    
			        location.href = addr;
			}
			function goToday(nowyear, nowmonth)
			{
				alert('오늘 ['+nowyear+'년'+nowmonth+'월]로 이동 됩니다.');
				location.href="ScheduleView.jsp?year="+nowyear+"&month="+nowmonth;
			}
	    </script>
	</head>
	<body onload ="window_onload()">
<!--프로세스바!!! 로드시 hide!!!!-->
		<div id="loading">
			<center>
				<a style="font-family:맑은 고딕; font-size:25px;">NOW LOADING...</a><br><br>
				<input type="image" src="img/prograss.gif"/>
			</center>
		</div>
<!--로딩 END-->
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/SideMenu.jsp"/>
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Schedule </b></div>
				</div>
				<div id="">
					<div class="box">
						<div id = "font">
						  <ul class="main_menu">
							   <li class="active">Month</li>
   							   <li onclick = "goUrl('ScheduleView_w.jsp')">Week</li>
							   <li onclick = "goToday(<%=nowYear%>, <%=nowMonth%>)">Go Today</li>
						  </ul>
						 </div>
					 <div style="text-align:right;">
						 <a href="ScheduleView.jsp?year=<%= month-1 == 0? year-1:year%>&month=<%=month-1==0? 12:month-1%>"><input type="image" src="../main/images/but-pre.png"></a>
							<b>
							   <select id = "syear" onchange= "year_onchange()">
							   		<option ></option >
							   </select >
						    </b>
						    <b>&nbsp;
							    <select   id= "smonth" onchange= "month_onchange()">
							    	<option ></option >
							    </select>
						    </b>
					    <a href="ScheduleView.jsp?year=<%= month+1==13?year+1:year%>&month=<%=month+1==13?1:month+1 %>"><input type="image" src="../main/images/but-next.png" onclick="gonext(<%=nowYear%>, <%=nowMonth%>)"></a>
		  			 </div> 
					 </div>
				</div>
				<div id="Table">
					<center>
						<table class="cal" align = "center" cellspacing= "1" cellpadding= "2" bgcolor ="#cccccc" >
						   <tr >
						     <td class="font" width="100" height="30px" style=" color: red;" >&nbsp; SUN</td >
						     <td class="font">&nbsp; MON </td >
						     <td class="font">&nbsp; TUE </td >
						     <td class="font">&nbsp; WED </td >
						     <td class="font">&nbsp; THU </td >
						     <td class="font">&nbsp; FRI </td >
						     <td class="font"  style=" color: blue;" > SAT  </td>
						    
						   </tr >
						   <%
						      int newLine=0;
						      out.print( "<tr>");
						     
						      for(i=1; i<week; i++)
						      {
						       out.print("<td width='100' height='100' bgcolor='#ffffff'>&nbsp;</td>");
						       newLine++;
						      }
						     
						      for(i=startDay; i<=endDay; i++)
						      {
						    	 	pageContext.setAttribute("year", year);
						    	    pageContext.setAttribute("month", month);
						    	    pageContext.setAttribute("i", i); 
						    	         
						       String fontColor=(newLine==0)?
						                "red":(newLine==6)? "blue": "black";
						       String bgColor=(nowYear==year)&&(nowMonth==month)
						                &&(nowDay==i)? "#FAF4C0": "#ffffff";
						      
						       %>
						       <td width="100" height="100" style="background-color:<%=bgColor%>;" >
							       <table class="cal" width="100" height="100"  style="border-collapse:collapse;">
								       	<tr><td height="20" style="border-bottom: 1px solid grey" ><a style="color:<%=fontColor%>;">&nbsp;<%=i%><input type="image" src="img/link.png" align="right" width="6px" style="padding:3px;" onClick='popupScheAdd(<%=year%>,<%=month%>,<%=i%>)'></a></td></tr>
								       	<tr>
								       		<td height="100" id="a">
<!--DB print-->
												<div style="overflow:scroll; height:90px; width:95px;">
													<c:forEach var="a" items="${list}">
													<%
													a++;
													int count = schedule_dao.countSchedule(list.get(a).getWriter(), year, month, i);
													int db_day = list.get(a).getDay() ;
													int db_year = list.get(a).getYear();
													int db_month = list.get(a).getMonth();
													if(i==db_day&&db_year==year&&db_month==month){
													%>
													&nbsp;<a id="person" onclick="popupPerson('${a.writer}', <%=year%>, <%=month%>, <%=i%>)"> · ${a.writer}</a><font color="red"> (<%=count%>)</font><br>
													<%}%>
													</c:forEach>	
												</div>						      
								       		</td>
								       </tr>
							       </table> 
						       </td>
						       <%
						       a=-1;
						       newLine++;
						           if(newLine ==7 &&i!=endDay)
						           {
						            out.print( "</tr><tr>" );
						            newLine=0;
						           }
						      }
						     while(newLine>0 && newLine<7)
						     {
						      out.print( "<td width='100' height='100' bgcolor='#ffffff'>&nbsp;</td>");
						      newLine++;
						     }
						     out.print( "</tr>");
						   %>
					  </table>
					  <table id="aaa" width="735px" style="background-color:grey;"><tr style="background-color:grey;  height:20px;"><td></td></tr></table>
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