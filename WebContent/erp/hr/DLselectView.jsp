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
	Map<String, Object> pageAll = dl_DAO.getTotalDl(currentPage, linkURL, search, find);
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
	    </style>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>출/퇴근 조회</b></div>
				</div>
				<div id = "tablePlace">
					  <div id="bottonPlace">
							<div id ="search">
								<form action="DLselectView.jsp" method="post" name="dl">
									<select>
										<option value="all">ALL</option>
										<option value="w_level">직책</option>
										<option value="department">소속</option>
										<option value="kor_name">성명</option>
									</select>
									<input type="text" name="find"> <input type="image" src="img/serch.png" width="40px"  title="검색" onclick="formCheck()">
								</form>
							</div>
						</div>
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th width="70px">사원번호</th>
								<th>출근시간</th>
								<th>퇴근시간</th>
								<th>소속</th>
								<th>직책</th>
								<th>성명</th>
								<th>일자</th>
								<th width="80px">상태</th>
							</tr>
						<c:forEach var="dl" items="${list}">
							<tr align="center" class="a">
								<td align="center">${dl.dl_seq }</td>
								<td>0${dl.code_seq}</td>
								<th style="background-color:#D5D5D5;">${dl.hi_work_time}</th>
								<th style="background-color:#BDBDBD;">${dl.bye_work_time}</th>
								<td>${dl.department}</td>
								<td>${dl.w_level}</td>
								<td><b>${dl.kor_name}</b></td>
								<td style="background-color:#EAEAEA;" width="80px">${dl.add_date}</td>
							<c:if test="${dl.state==0}">
								<td style="color:blue;">퇴근미완료</td>
							</c:if>
							<c:if test="${dl.state==1}">
								<td>
									<b>퇴근완료<c:if test="${dl.hi_work_time=='00:00'}">(휴가)</c:if></b>
								</td>
							</c:if>
							<c:if test="${dl.kor_name==member_name}">
								<c:if test="${dl.state==6}">
									<td id="biz_submit" title="클릭 시 서류 확인" onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq}')">기타<b>(서류대기)</b></td>
								</c:if>
								<c:if test="${dl.state==2}">
									<td id="biz_submit" title="클릭 시 서류 확인" onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq }')">출장<b>(서류대기)</b></td>
								</c:if>
								<c:if test="${dl.state==4}">
									<td id="biz_submit" title="클릭 시 서류 확인" onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq }')">외근<b>(서류대기)</b></td>
								</c:if>
							</c:if>
							<c:if test="${dl.kor_name!=member_name}">
								<c:if test="${dl.state==6}">
									<td id="biz_submit" title="클릭 시 서류 확인" onclick="javaScript:alert('서류는 본인만 열람 가능합니다.')">기타<b>(서류대기)</b></td>
								</c:if>
								<c:if test="${dl.state==2}">
									<td id="biz_submit" title="클릭 시 서류 확인" onclick="javaScript:alert('서류는 본인만 열람 가능합니다.')">출장<b>(서류대기)</b></td>
								</c:if>
								<c:if test="${dl.state==4}">
									<td id="biz_submit" title="클릭 시 서류 확인" onclick="javaScript:alert('서류는 본인만 열람 가능합니다.')">외근<b>(서류대기)</b></td>
								</c:if>
							</c:if>
							<c:if test="${dl.state==3}">
								<td onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq}')"><b>출장(서류완료)</b></td>
							</c:if>
							<c:if test="${dl.state==5}">
								<td onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq}')"><b>외근(서류완료)</b></td>
							</c:if>
							<c:if test="${dl.state==7}">
								<td onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq}')"><b>기타(서류완료)</b></td>
							</c:if>
							<c:if test="${dl.state==8}">
								<td onclick="goUrl('DL_etc_paper.jsp?dl_seq=${dl.dl_seq}')"><b><font color="red">[Reject]</font></b></td>
							</c:if>
							</tr>
						</c:forEach>
						</table><br/>
					<center><div id="paging">${pageList}</div></center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>