<%@page import="kgmp.common.dao.Dl_dao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.DL, java.util.Map, java.util.List" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<%
request.setCharacterEncoding("utf-8");
//설정
	String linkURL = "DLselectView.jsp";
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
	Map<String, Object> pageAll = dl_DAO.printAdmin(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<DL> list = (List<DL>)pageAll.get("list");
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
	    <link rel="stylesheet" type="text/css" href="css/DL_select.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript">
	    function formCheck(){
			document.dl.submit();
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
	<body onload ="window_onload()">
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Admin_DL</b></div>
				</div>
				<div class="box">
					<div id = "font">
						  <ul class="main_menu">
							   <li onclick = "goUrl('adminVacation.jsp')">휴가승인</li>
 							   <li onclick = "goUrl('adminSpend.jsp')">지출승인</li>
 							   <li class="active" onclick = "goUrl('adminDl.jsp')">출근부승인</li>
							   <li onclick = "goUrl('adminWork.jsp')">업무확인</li>
						  </ul>
					 </div>
				</div>
				<div id = "tablePlace">
					<div id="bottonPlace"><br>
						<div id ="search">
							<form action="adminDl.jsp" method="post" name="dl">
								<select>
									<option value="all">ALL</option>
									<option value="w_level">직책</option>
									<option value="department">소속</option>
									<option value="kor_name">성명</option>
								</select>
								<input type="text" name="find"> <input type="image" src="../hr/img/serch.png" width="40px"  title="검색" onclick="formCheck()">
							</form>
						</div>
					</div>
				<c:if test="${list=='[]'}"><table width="800px"><tr><td></td></tr><tr><td align="center"><font color="red">수기 출근부 신청 내역이 없습니다.</font></td></tr></table><br></c:if>
				<c:forEach var="dl" items="${list}">
					<table width="800px">
						<tr>
							<th width="40px">번호</th>
							<th width="70px">사원번호</th>
							<th>출근시간</th>
							<th>퇴근시간</th>
							<th>소속</th>
							<th>직책</th>
							<th width="40px">성명</th>
							<th>일자</th>
							<th width="80px">상태</th>
						</tr>
						<tr align="center" >
							<td align="center">${dl.dl_seq }</td>
							<td>0${dl.code_seq}</td>
							<th style="background-color:#D5D5D5;">${dl.hi_work_time}</th>
							<th style="background-color:#BDBDBD;">${dl.bye_work_time}</th>
							<td>${dl.department}</td>
							<td>${dl.w_level}</td>
							<td><b>${dl.kor_name}</b></td>
							<td style="background-color:#EAEAEA;" width="80px">${dl.add_date}</td>
						<c:if test="${dl.state==2}">
							<td>출장<b>(서류대기)</b></td>
						</c:if>
						<c:if test="${dl.state==3}">
							<td><b>출장(서류완료)</b></td>
						</c:if>
						<c:if test="${dl.state==4}">
							<td>외근<b>(서류대기)</b></td>
						</c:if>
						<c:if test="${dl.state==5}">
							<td><b>외근(서류완료)</b></td>
						</c:if>
						<c:if test="${dl.state==6}">
							<td>기타<b>(서류대기)</b></td>
						</c:if>
						<c:if test="${dl.state==7}">
							<td><b>기타(서류완료)</b></td>
						</c:if>
						<c:if test="${dl.state==8}">
							<td><b><font color="red">[Reject]</font></b></td>
						</c:if>
						</tr>
						<tr  class="a">
							<th>사유</th><td colspan="4">${dl.excuse}<td>
							<th>승인</th>
							<td align="center" colspan="2">
								<c:if test="${dl.state==2||dl.state==4||dl.state==6}">
									<a class="submit" href="admin_dl_proc.jsp?dl_seq=${dl.dl_seq}&state=${dl.state}">[Confirm]</a> | 
									<a class="submit" href="admin_dl_proc.jsp?dl_seq=${dl.dl_seq}&state=8">[Reject]</a>
								</c:if>
								<c:if test="${dl.state==3||dl.state==5||dl.state==7||dl.state==8}">
									<font color="red">상태 변경 불가</font>
								</c:if>
							</td>
						</tr>
					</table><br/><br>
				</c:forEach>
					<center><div id="paging">${pageList}</div></center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>