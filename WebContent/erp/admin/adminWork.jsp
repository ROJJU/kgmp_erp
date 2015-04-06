<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Report, java.util.Map, java.util.List, java.util.*, java.text.*" %>
<jsp:useBean id="report_DAO" class="kgmp.common.dao.Report_dao" scope="session"/>
<jsp:useBean id="member_DAO" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
//설정
	String writer = (String)session.getAttribute("member_name");
	String id_s = (String)session.getAttribute("member_id");
	String id = (String)session.getAttribute("member_id");
//member info
pageContext.setAttribute("member", member_DAO.printAdmin());
/*-----------------------------------------------------날자 설정 -------------------------------------------------- */
//setting date
Calendar cal=Calendar.getInstance();
SimpleDateFormat year = new SimpleDateFormat("yyyy"); String nowYear= year.format(cal.getTime());
SimpleDateFormat month = new SimpleDateFormat("MM"); String nowMonth= month.format(cal.getTime());
SimpleDateFormat day = new SimpleDateFormat("dd"); String nowDay = day.format(cal.getTime());
int nowY = cal.get(Calendar.YEAR);
int nowM = cal.get(Calendar.MONTH)+1; // +1
int nowD = cal.get(Calendar.DATE);
/*-----------------------------------------------------MINI CALENDAR-------------------------------------------------- */
	int year_m= nowY;
	int month_m=nowM;
	int day_m=nowD;
	if(request.getParameter("id") != null)
		id= request.getParameter("id");
	if(request.getParameter("id") != null)
		id_s= request.getParameter("id");
	if(request.getParameter("year_m") != null)
		year_m= Integer.parseInt(request.getParameter("year_m"));
	if(request.getParameter("month_m") != null)
		month_m= Integer.parseInt(request.getParameter("month_m"));
/*-----------------------------------------------------절달 받은 서류 -------------------------------------------------- */
//setting for page(get)
	int i=-1;
	int j=-1;
	String linkURL = "adminWork.jsp";
//now page setting
	int currentPage_g = 1;
	String search_g = "all";
	String find_g = "";
	int year_g= nowY;
	int month_g=nowM;
	int day_g=nowD;
	if(request.getParameter("currentPage_g") != null)
		currentPage_g = Integer.parseInt(request.getParameter("currentPage_g"));
	if(request.getParameter("search_g") != null)
		search_g=request.getParameter("search_g");
	if(request.getParameter("find_g") != null)
		find_g= request.getParameter("find_g");
	if(request.getParameter("year_g") != null)
		year_g= Integer.parseInt(request.getParameter("year_g"));
	if(request.getParameter("month_g") != null)
		month_g= Integer.parseInt(request.getParameter("month_g"));
	if(request.getParameter("day_g") != null)
		day_g= Integer.parseInt(request.getParameter("day_g"));
//setting for paging and list
	Map<String, Object> pageAll_g = report_DAO.getDaily_g(currentPage_g, linkURL, search_g, find_g, id, year_g, month_g, day_g);
	String pageList_g = (String)pageAll_g.get("pageList_g");
	List<Report> list_g = (List<Report>)pageAll_g.get("list_g");
//add attribute
	pageContext.setAttribute("list_g", list_g);
	pageContext.setAttribute("pageList_g", pageList_g);
//count list(get)
	int count_g = report_DAO.countDaily_g(currentPage_g, linkURL, search_g, find_g, id, year_g, month_g, day_g);
/*-----------------------------------------------------절달 한 서류 -------------------------------------------------- */
//현재페이지 설정
	int currentPage_s = 1;
	String search_s = "all";
	String find_s = "";
	int year_s= nowY;
	int month_s=nowM;
	int day_s=nowD;
	if(request.getParameter("currentPage_s") != null)
		currentPage_s = Integer.parseInt(request.getParameter("currentPage_s"));
	if(request.getParameter("search_s") != null)
		search_s=request.getParameter("search_s");
	if(request.getParameter("find_s") != null)
		find_s= request.getParameter("find_s");
	if(request.getParameter("year_s") != null)
		year_s= Integer.parseInt(request.getParameter("year_s"));
	if(request.getParameter("month_s") != null)
		month_s= Integer.parseInt(request.getParameter("month_s"));
	if(request.getParameter("day_s") != null)
		day_s= Integer.parseInt(request.getParameter("day_s"));
//페이징과 리스트 가져오기
	Map<String, Object> pageAll = report_DAO.getDaily_s(currentPage_s, linkURL, search_s, find_s, year_s, month_s, day_s, id_s);
	String pageList_s = (String)pageAll.get("pageList");
	List<Report> list_s = (List<Report>)pageAll.get("list");
//페이지속성 추가
	pageContext.setAttribute("list_s", list_s);
	pageContext.setAttribute("pageList_s", pageList_s);
//서류 개수 출력
	int count_s = report_DAO.countDaily_s(currentPage_s, linkURL, search_s, find_s, year_s, month_s, day_s, id_s);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/BasicBody.css"/>
	    <link rel="stylesheet" type="text/css" href="../report/css/Daily_V.css"/>
	    <script type="text/javascript">
			function window_onload(){
	// 받은 업무 일자 출력~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				for ( i=1988;i<=2017 ; i++){
			        var op= new Option(i+ "년",i);
			         syear_g.options[i -1988]=op; 
			         if(i== <%=year_g %> ){
			            syear_g.options[i -1988].selected ="selected" ;
			         }
			   }
			     for ( i=1;i<=12 ; i++){
			        var op= new Option(i+ "월",i);
			         smonth_g.options[i -1]=op;
			         if(i== <%=month_g %>){
			             smonth_g.options[i -1].selected = "selected";
			         }
			     }
			     for ( i=1;i<=31 ; i++){
			        var op= new Option(i+ "일",i);
			         sday_g.options[i -1]=op;
			         if(i== <%=day_g%>){
			             sday_g.options[i -1].selected = "selected";
			         }
			     }
	  // 보낸 업무 일자 출력~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~	
			     for ( i=1988;i<=2017 ; i++){
				        var op= new Option(i+ "년",i);
				         syear_s.options[i -1988]=op; 
				         if(i== <%=year_s %> ){
				            syear_s.options[i -1988].selected ="selected" ;
				         }
				   }
				     for ( i=1;i<=12 ; i++){
				        var op= new Option(i+ "월",i);
				         smonth_s.options[i -1]=op;
				         if(i== <%=month_s %>){
				             smonth_s.options[i -1].selected = "selected";
				         }
				     }
				     for ( i=1;i<=31 ; i++){
				        var op= new Option(i+ "일",i);
				         sday_s.options[i -1]=op;
				         if(i== <%=day_s%>){
				             sday_s.options[i -1].selected = "selected";
				         }
				     }
			 }
			//form check for date
			function dateCheck(){
				var id=document.date_m.id.value;
				var year_m=document.date_m.year_m.value;
				var month_m=document.date_m.month_m.value;
				
				if(id==1){
					alert('사원을 선택해 주시기 바랍니다.');
					return false;
				}else if(year_m==1){
					alert('연도를 선택해 주시기 바랍니다.');
					return false;
				}else if(month_m==1){
					alert('월을 선택해 주시기 바랍니다.');
					return false;
				}else{
					document.date_m.submit();
				}
			}
	    </script>
	    <style type="text/css">
	    	#biz_submit{
	    	background:red;
	    	color:#ffffff;
	    	}
	    	#biz_submit:hover{
	    	background:blue;
	    	}
			div.{border:solid 1px red;}
			#titlePlace{position:relative; height:110px;}
			#pageTitle{position:relative; top: 30px; left:50px; width:500px; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; background-color:#EAEAEA; padding:3px;}
			#bottons{position:relative; left:370px; width:100px;}
			#sum{position:absolute; background-color:#ffffff; width:220px; border:1px solid black; padding:3px; top:75px; left:620px;}
			a{text-decoration:none;}
			select, input, img, input {/* border: 0 none; */ vertical-align:middle;}
			 #font1{
			  font-family:"Arial Black";
			  font-size:0.75em;
			  fontp-weight :bold;
			 }
			 ul.main_menu1{
			  margin:5px 0 0 10px;
			  padding:0;
			 }
			 ul.main_menu1 li{
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
			 ul.main_menu1 li.active{
			  /*  background-image : url(../bar/notify/img/tab2.gif);*/
			  background-color:#ffffff;
			  border:1px solid grey;
			  padding-bottom:1px;
			  border-bottom:none;
			  color:#422700;
			 }
			 ul.main_menu1 li:hover{
			  border-bottom:none;
			  background-color:#ffffff;
			  color:black;
			  cursor:pointer;
			  cursor:hand;
			  border-bottom:none;
			  padding-bottom:1px;
			 }
			 .box1{
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
	<body onload ="window_onload()">
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Admin_Work</b></div>
				</div>
				<div class="box1">
					<div id = "font1">
						  <ul class="main_menu1">
							   <li onclick = "goUrl('adminVacation.jsp')">휴가승인</li>
 							   <li onclick = "goUrl('adminSpend.jsp')">지출승인</li>
 							   <li onclick = "goUrl('adminDl.jsp')">출근부승인</li>
							   <li class="active" onclick = "goUrl('adminWork.jsp')">업무확인</li>
						  </ul>
					 </div>
				</div><br>
				<!--받은 업무 start!!!-->
				<div class="box2">
					<table>
						<tr>
							<td colspan="32">
								<a href="adminWork.jsp?year_m=<%= month_m-1== 0? year_m-1:year_m%>&month_m=<%=month_m-1==0? 12:month_m-1%>&id=<%=id%>"><input type="image" src="../main/images/but-pre.png"></a>
								현재 <b><%=id%></b>님의 <font color="red"><%=year_m%></font>년 <font color="red"><%=month_m%></font>월 업무 내역 입니다.
								<a><input type="image" src="../main/images/but-next.png" onclick="goUrl('adminWork.jsp?year_m=<%= month_m+1==13?year_m+1:year_m%>&month_m=<%=month_m+1==13?1:month_m+1 %>&id=<%=id%>')"></a>
							</td>
						</tr>
						<tr>
							<td align="right" colspan="32">
								<form action="adminWork.jsp" method="post" name="date_m">
								  * 직원별 보기: <select name="id">
											  	<option value="1">사원선택</option>
										  	<c:forEach var="member" items="${member}">
								  				<option value="${member.id}">[${member.w_level}] ${member.kor_name}</option>
							  				</c:forEach>
							  				  </select>
									 | Year: <select name="year_m">
									 			<option value="1">연도선택</option>
									 		<%for(int s=nowY-5;s<=nowY+5;s++){%>
									 			<option value="<%=s%>"><%=s%></option>
								 			<%}%>
								 			 </select> 년
									 | Month: <select name="month_m">
									 			<option value="1">월선택</option>
									 		<%for(int s=1;s<=12;s++){%>
								 				<option value="<%=s%>"><%=s%></option>
							 				<%}%>
							 				  </select> 월 | 
									<a href="javaScript:dateCheck();" ><font color="blue"><b>GO</b></font></a>
								</form>
							</td>
						</tr>
						<tr>
							<td style="background-color:#D5D5D5;"><b >Date</b></td>
							<%for(int s=1;s<=31;s++){%>
							<td width="30px" align="center" style="background-color:#EAEAEA;"><%=s %></td>
							<%}%>
						</tr>
						<tr class="a">
							<td style="background-color:#D5D5D5;"><b >받음</b></td>
							<%for(int s=1;s<=31;s++){
							int count = report_DAO.countGet(year_m, month_m, s, id);
							%>
							<td align="center" class="selectTD" onclick="goUrl('adminWork.jsp?year_g=<%=year_m%>&month_g=<%=month_m%>&day_g=<%=s%>&year_m=<%=year_m%>&month_m=<%=month_m%>&id=<%=id%>')"><%=count %></td>
							<%}%>
						</tr>
						<tr class="a">
							<td style="background-color:#D5D5D5;"><b >전달</b></td>
							<%for(int s=1;s<=31;s++){
							int count = report_DAO.countSpend(year_m, month_m, s, id);
							%>
							<td align="center" class="selectTD" onclick="goUrl('adminWork.jsp?year_s=<%=year_m%>&month_s=<%=month_m%>&day_s=<%=s%>&year_m=<%=year_m%>&month_m=<%=month_m%>&id_s=<%=id%>&id=<%=id%>')"><%=count %></td>
							<%}%>
						</tr>
					</table>
				</div><br>
				<div class="box">
					<div id = "font">
					  <ul class="main_menu">
						   <li>내가받은업무 수 : <a style="color:red;"><%=count_g%></a></li>
					  </ul>
					 </div>
					 <div id="caution">	<img src="../main/images/total_delIcon.gif" width="8px">&nbsp; 검색은 날짜와 상관없이 가능합니다</div>
				</div>
				<div id="serchPlace">
					<form action="adminWork.jsp" method="post" name="get">
						<div id ="serch">
							<select name="search_g">
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</select>
							<input type="text" name="find_g"> <input type="image" src="../notice/img/serch.png" width="40px" onclick="javaScript:document.get.submit();" title="검색">
						</div>
					</form>
					<form action="adminWork.jsp" method="post" name="date_g">
						<div id="page">
							${pageList_g}&nbsp;
							(일별보기 : <select name="year_g" id="syear_g"><option></option></select><select name="month_g" id="smonth_g"><option></option></select><select name="day_g" id="sday_g"><option></option></select>)
							 <a href="javaScript:document.date_g.submit();" title="받은 업무 일별보기">GO</a>
							  / <a href="adminWork.jsp?year_g=<%=nowY%>&month_g=<%=nowM%>&day_g=<%=nowD%>" title="받은 업무 <%=nowY%>년<%=nowM%>월<%=nowD%>일 이동">Today</a>
						</div>
					</form>
				</div>
				<div id = "bodyTable">
					<center>
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th width="80px">구분</th>
								<th>첨부</th>
								<th width="400px">제목</th>
								<th>작성자</th>
								<th>일자</th>
								<th>조회수</th>
								<th>진행</th>
							</tr>	
						<c:if test="${list_g==null||list_g=='[]'}"><tr><td colspan="8" align="center"><img src="../main/images/total_delIcon.gif" width="=9px"> <a style="color:red;">해당일은 받은 업부가 없습니다.</a></td></tr></c:if>
						<c:forEach var="a" items="${list_g}"><%i++;%>
							<tr onclick="goUrl('DailyRead.jsp?daily_seq=${a.daily_seq}&year_m=<%=year_m%>&month_m=<%=month_m%>&id=<%=id%>&year_g=<%=year_m%>&month_g=<%=month_m%>&day_g=<%=day_g%>')" class="a">
								<td align="center">${a.daily_seq}</td>
								<c:if test="${a.type==1}"><td align="center">내부업무</td></c:if>
								<c:if test="${a.type==2}"><td align="center">외부업무</td></c:if>
								<c:if test="${a.d_file!=null}"><td align="center"><input type="image" src="../report/img/icon_attach.gif" title="${a.d_file}"></td></c:if>
								<c:if test="${a.d_file==null}"><td align="center">-</td></c:if>
								<td>
									<c:if test="${a.depth!=0}">
								  		<c:forEach begin="1" end="${a.depth-1}">
								  			&nbsp;&nbsp;&nbsp;
								  		</c:forEach>
								  		<font color="red">└ Vere${a.step}_${a.depth}:</font>
							  		</c:if>
									${a.title}
									<a style="color:red;">(<%=report_DAO.getCountComment_d(list_g.get(i).getDaily_seq()) %>)</a>
								</td>
								<td align="center">${a.writer}</td>
								<td align="center">${a.add_date}</td>
								<td align="center">${a.hit}</td>
								<c:if test="${a.state==0}"><td align="center">대기</td></c:if>
								<c:if test="${a.state==-1}"><td align="center"><a style="color:blue;">컴펌</a></td></c:if>
								<c:if test="${a.state==1}"><td align="center"><a style="color:red;">보완</a></td></c:if>
							</tr>
						</c:forEach>
						</table><br/><br><br>
					</center>
<!--받은 업무 end!!!-->
<!--전달한업무 start!!-->
						<div class="box">
							<div id = "font">
							  <ul class="main_menu">
								   <li>내가전달한업무 수 : <a style="color:red;"><%=count_s%></a></li>
							  </ul>
							</div>
						</div>
						<div id="serchPlace">
							<form action="adminWork.jsp" method="post" name="send">
								<div id ="serch2">
									<select name="search_s">
										<option value="title">제목</option>
										<option value="writer">작성자</option>
									</select>
									<input type="text" name="find_s"> <input type="image" src="../notice/img/serch.png" width="40px" onclick="javaScript:document.send.submit();" title="검색">
								</div>
							</form>
							<form action="adminWork.jsp" method="post" name="date_s">
								<div id="page2">
									${pageList_s}&nbsp;
									(일별보기 : <select name="year_s" id="syear_s"><option></option></select><select name="month_s" id="smonth_s"><option></option></select><select name="day_s" id="sday_s"><option></option></select>)
									 <a href="javaScript:document.date_s.submit();" title="전달업무 일별보기">GO</a>
									   / <a href="adminWork.jsp?year_s=<%=nowY%>&month_s=<%=nowM%>&day_s=<%=nowD%>"  title="전달 업무 <%=nowY%>년<%=nowM%>월<%=nowD%>일 이동">Today</a>
								</div>
							</form>
						</div>
					<center>
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th width="80px">구분</th>
								<th>첨부</th>
								<th width="400px">제목</th>
								<th>전달자</th>
								<th>일자</th>
								<th>조회수</th>
								<th>진행</th>
							</tr>
						<c:if test="${list_s==null||list_s=='[]'}"><tr><td colspan="8" align="center"><img src="../main/images/total_delIcon.gif" width="=9px"> <a style="color:red;">해당일은 전달한 업부가 없습니다.</a></td></tr></c:if>
						<c:forEach var="b" items="${list_s}"><%j++;%>
							<tr onclick="goUrl('DailyRead.jsp?daily_seq=${b.daily_seq}&year_m=<%=year_m%>&month_m=<%=month_m%>&id=<%=id%>&year_s=<%=year_m%>&month_s=<%=month_m%>&day_s=<%=day_s%>')" class="a">
								<td align="center">${b.daily_seq}</td>
								<c:if test="${b.type==1}"><td align="center">내부업무</td></c:if>
								<c:if test="${b.type==2}"><td align="center">외부업무</td></c:if>
								<c:if test="${b.d_file!=null}"><td align="center"><input type="image" src="../report/img/icon_attach.gif" title="${b.d_file}"></td></c:if>
								<c:if test="${b.d_file==null}"><td align="center">-</td></c:if>
								<td>
									<c:if test="${b.depth!=0}">
								  		<c:forEach begin="1" end="${b.depth-1}">
								  			&nbsp;&nbsp;&nbsp;
								  		</c:forEach>
								  		<font color="red">└ Vere${b.step}_${b.depth}:</font>
							  		</c:if>
									${b.title}
									<a style="color:red;">(<%=report_DAO.getCountComment_d(list_s.get(j).getDaily_seq()) %>)</a>
								</td>
								<td align="center" >
									<c:if test="${b.send0!=null}"><img src="../report/img/person.png" width="5px" title="${b.send0}"></c:if>
									<c:if test="${b.send1!=null}"><img src="../report/img/person.png" width="5px" title="${b.send1}"></c:if>
									<c:if test="${b.send2!=null}"><img src="../report/img/person.png" width="5px" title="${b.send2}"></c:if>
									<c:if test="${b.send3!=null}"><img src="../report/img/person.png" width="5px" title="${b.send3}"></c:if>
									<c:if test="${b.send4!=null}"><img src="../report/img/person.png" width="5px" title="${b.send4}"></c:if>	
								</td>
								<td align="center">${b.add_date}</td>
								<td align="center">${b.hit}</td>
								<c:if test="${b.state==0}"><td align="center">대기</td></c:if>
								<c:if test="${b.state==-1}"><td align="center"><a style="color:blue;">컴펌</a></td></c:if>
								<c:if test="${b.state==1}"><td align="center"><a style="color:red;">보완</a></td></c:if>
							</tr>
						</c:forEach>
						</table><br/>
<!--전달한 업무 end~!!!-->
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>