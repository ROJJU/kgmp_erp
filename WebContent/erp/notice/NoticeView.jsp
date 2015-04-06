<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Notice, java.util.Map, java.util.List" %>
<jsp:useBean id="notice_dao" class="kgmp.common.dao.Notice_dao" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//설정
	request.setCharacterEncoding("utf-8");
	String linkURL = "NoticeView.jsp";
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
	Map<String, Object> pageAll = notice_dao.getNotice(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<Notice> list = (List<Notice>)pageAll.get("list");
//페이지속성 추가
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pageList", pageList);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/Notice_V.css"/>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/SideMenu.jsp"/>
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Notice</b></div>
				</div>
				<div id = "tablePlace">
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th width="600px">내용</th>
								<th width="40px">파일</th>
								<th width="40px">작성자</th>
								<th>일자</th>
								<th width="40px">조회수</th>
							</tr>
						<c:forEach var="a" items="${list}">
							<tr onclick="goUrl('NoticeRead.jsp?notice_seq=${a.notice_seq}')" class="a">
								<td align="center">${a.notice_seq}</td>
								<td><img src="../main/images/icon_n.png" width="25px">&nbsp;${a.title}</td>
									<c:if test="${a.n_file!=null}"><td align="center"><input type="image" src="../report/img/icon_attach.gif" title="${a.n_file}"></td></c:if>
									<c:if test="${a.n_file==null}"><td align="center">-</td></c:if>
								<td align="center">${a.writer}</td>
								<td align="center">${a.add_date}</td>
								<td align="center">${a.hit}</td>
							</tr>
						</c:forEach>
						</table><br/>
					<center>
						<div id="paging">${pageList}</div>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/Write.png" width="50px" onclick="goUrl('NoticeAdd.jsp')">
							</div>
							<div id ="serch">
								<select>
									<option>ALL</option>
									<option>제목</option>
									<option>작성자</option>
								</select>
								<input type="text">  <input type="image" src="img/serch.png" width="40px">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>