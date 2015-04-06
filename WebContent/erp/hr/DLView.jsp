<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.DL, java.util.Map, java.util.*, java.text.*" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<%
//맴버 출력
String find="";
List<DL> list = dl_DAO.getMembers(find);
pageContext.setAttribute("list", list);
//날자 설정
Calendar cal=Calendar.getInstance();
SimpleDateFormat year = new SimpleDateFormat("yyyy"); String nowYear= year.format(cal.getTime());
SimpleDateFormat month = new SimpleDateFormat("MM"); String nowMonth= month.format(cal.getTime());
SimpleDateFormat day = new SimpleDateFormat("dd"); String nowDay = day.format(cal.getTime());
String id=(String)session.getAttribute("member_id");
int nowY = cal.get(Calendar.YEAR);
int nowM = cal.get(Calendar.MONTH)+1; // +1
//파라미터 설정
request.setCharacterEncoding("utf-8");
int insert_year=nowY;
int insert_month=nowM;
if(request.getParameter("insert_year") != null)
	insert_year=Integer.parseInt(request.getParameter("insert_year"));
if(request.getParameter("insert_month") != null)
	insert_month=Integer.parseInt(request.getParameter("insert_month"));
int i=-1; 
int j=0;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/DL_V.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script type="text/javascript">
		function window_onload()
		 {
		    for ( i=1988;i<=2017 ; i++)
		   {
		        var op= new Option(i+ "년",i);
		         syear.options[i -1988]=op; 
		         if(i== <%=insert_year %> )
		         {
		            syear.options[i -1988].selected ="selected" ;
		         }
		   }
		     for ( i=1;i<=12 ; i++)
		     {
		        var op= new Option(i+ "월",i);
		         smonth.options[i -1]=op;
		         if(i== <%=insert_month %>)
		         {
		             smonth.options[i -1].selected = "selected";
		         }
		     }
		 }
		</script>
	</head>
	<body onload="window_onload()">
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id="pageTitle"><b>Diligence and Laziness</b></div>
					<div id="selectM">
						<form action="DLView.jsp" method="post" name="dl">
							<select name="insert_year" id="syear"><option></option></select>
							<select name="insert_month" id="smonth"><option></option>	</select>
							<input type="image" src="img/serch2.png" width="40px" onclick="javaScript:document.dl.submit()">
						</form>
					</div>
				</div>
				<div id = "DLTable">
					<center>
						<table id="DL" width="900px">
							<tr class="h" >
								<th rowspan="2" class="bgcolor1" style="font-size:11px;">순번</th>
								<th colspan="5" class="bgcolor2" style="font-size:11px;">사원정보</th>
								<th colspan="4" class="bgcolor1" style="font-size:11px;">근무일</th>
								<th class="bgcolor2" style="font-size:11px;">근무시간</th>
								<th colspan="9" class="bgcolor1" style="font-size:11px;">근태결과(일수)</th>
							</tr>
							<tr class="h">
								<th width="50px" class="bgcolor2">사원번호</th>
								<th width="40px" class="bgcolor2">사원명</th>
								<th width="40px" class="bgcolor2">부서</th>
								<th width="40px"  class="bgcolor2">직책</th>
								<th width="90px" class="bgcolor2">출입 ID</th>
								<th class="bgcolor1">정상</th>
								<th class="bgcolor1">연장</th>
								<th class="bgcolor1">기타</th>
								<th class="bgcolor1">합계</th>
								<th width="75px" class="bgcolor2">합계</th>
								<th class="bgcolor1">출근</th>
								<th class="bgcolor1">출장/외근</th>
								<th class="bgcolor1">지각</th>
								<th class="bgcolor1">조퇴</th>
								<th class="bgcolor1">결근</th>
								<th class="bgcolor1">휴가</th>
								<th class="bgcolor1">월차</th>
								<th class="bgcolor1">반차</th>
								<th class="bgcolor1">연차</th>
							</tr>
						<c:forEach var="dl" items="${list}">
						<%
							i++; j++;
							List<DL> sum = dl_DAO.getSums(list.get(i).getId(), insert_year, insert_month);
							/*state check*/
							pageContext.setAttribute("state", dl_DAO.getState(list.get(i).getId(), nowYear, nowMonth, nowDay));
							try{
						%>
							<tr class="a">
								<th><%=j%></th>
								<th>0${dl.code_seq}</th>
								<th><div class="department" title="${dl.kor_name}">${dl.kor_name}</div></th>
								<th><div class="department" title="${dl.department}">${dl.department}</div></th>
								<th>${dl.w_level}</th>
								<th>${dl.id}</th>
								<th><%=sum.get(0).getWork_check()%></th>
								<th><%=sum.get(0).getOver_work_check()%></th>
								<th><%=sum.get(0).getEtc() %></th>
								<th><%=sum.get(0).getTotal_work_check()%></th>
							<c:if test="${state.state!='0'}">
								<th title="총 <%=sum.get(0).getBye_work_min()%>분" style="background-color:#D5D5D5;">[ <a style="color:blue;"><%=sum.get(0).getHi_work_hour()%> : <%=sum.get(0).getHi_work_min()%></a> ]</th>
							</c:if>
							<c:if test="${state.state=='0'}">
								<th title="이 인원은 아직 퇴근 처리를 하지 않았습니다." style="background-color:#D5D5D5;"><a style="color:blue;">근무중..</a></th>
							</c:if>
								<th><%=sum.get(0).getWork()%></th>
								<th><%=sum.get(0).getBiz_trip() %></th>
								<th><%=sum.get(0).getLate()%></th>
								<th><%=sum.get(0).getGive_up()%></th>
								<th><%=sum.get(0).getDont()%></th>
								<th><%=sum.get(0).getVacation()%></th>
								<th><%=sum.get(0).getHalf_vacation()%></th>
								<th><%=sum.get(0).getMonth_vacation()%></th>
								<th><%=sum.get(0).getYear_vacation()%></th>
							<%}catch(Exception e){%><!--억지로 끼워 넣었습니다 매우 좋지 않은 소스 입니다..-->
								<th colspan="13" align="center" style="font-size:11px; color:red;" title="연산 불가"> * 해당 월 1회 이상 출근하지 않은 인원 입니다 *</th>
							<%}%>
							</tr>
						</c:forEach>
						</table><br/>
						<span>1 2 3</span>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>