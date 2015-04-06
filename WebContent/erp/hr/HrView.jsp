<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Member, java.util.Map, java.util.List" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
//설정
	request.setCharacterEncoding("utf-8");
	String linkURL = "CDView.jsp";
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
	Map<String, Object> pageAll = member_dao.getMembers(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<Member> list = (List<Member>)pageAll.get("list");
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
	    <link rel="stylesheet" type="text/css" href="css/Hr_V.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/SideMenu.jsp"/>
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Personnel</b></div>
				</div>
				<div id = "noticeTable">
					<center>
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th>사원번호</th>
								<th>가입일자</th>
								<th>탈퇴일자</th>
								<th>소속</th>
								<th>직책</th>
								<th>성명</th>
								<th>비상연락망</th>
								<th>급여</th>
							</tr>
						<c:forEach var="a" items="${list}">
							<tr onclick="goUrl('HrRead.jsp?code_seq=${a.code_seq}')" align="center" class="a">
								<td align="center">1</td>
								<td>${a.code_seq}</td>
								<td>${a.join_date}</td>
								<td>-</td>
								<td>${a.department}</td>
								<td>${a.w_level}</td>
								<td>${a.kor_name}</td>
								<td>${a.cell_phone1}-${a.cell_phone2}-${a.cell_phone3}</td>
								<td>-</td>
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
								</select>
								<input type="text"> <input type="image" src="img/serch.png" width="40px">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>