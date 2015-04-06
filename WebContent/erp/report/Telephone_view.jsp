<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Telephone, java.util.Map, java.util.List" %>
<jsp:useBean id="telDAO" class="kgmp.common.dao.Telephone_dao" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
request.setCharacterEncoding("utf-8");
//설정
	String linkURL = "Telephone_view.jsp";
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
	Map<String, Object> pageAll = telDAO.getTel(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<Telephone> list = (List<Telephone>)pageAll.get("list");
//페이지속성 추가
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pageList", pageList);
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../notice/css/Notice_V.css"/>
	    <style type="text/css">.bg{background-color:#D5D5D5; border-right:1px solid grey; border-left:1px solid grey;}a#modify:hover{color:blue;}a#del:hover{color:red;}</style>
	    <script type="text/javascript">
	    function popUpTelephoneAdd(){
			window.open("Telephone_add.jsp","tAdd","width=400px, height=220px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");		
		}
	    function delCheck(tel_seq){
	    	if(confirm("해당 통화기록을 삭제 하시겠습니까 ?")){
	    		location.href="Telephone_del_proc.jsp?tel_seq="+tel_seq;
	    	}
	    }
	    function modifyCheck(tel_seq){
	    	if(confirm("해당 통화기록을 수정 하시겠습니까 ?")){
	    		window.open("Telephone_modify.jsp?tel_seq="+tel_seq,"tModify","width=400px, height=220px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
	    	}
	    }
	    </script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/SideMenu.jsp"/>
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Telephone Message</b></div>
				</div>
				<div id = "tablePlace">
					<div>
						<form action="Telephone_view.jsp" method="post" name="telSearch">
							<div id ="serch">
								<select name="search">
									<option value="all">ALL</option>
									<option value="phone3">전화번호(뒷자리)</option>
									<option value="company">상호/성명</option>
									<option value="to_kgmp">찾는사람</option>
									<option value="telephone_seq">NUM</option>
								</select>
								<input type="text" name="find">&nbsp;&nbsp;<input type="image" src="img/serch.png" width="43px">
							</div>
						</form>
					</div>
					<c:if test="${list=='[]'}"><table width="800px"><tr><td align="center" style="color:red;">통화기록이 없습니다.</td></tr></table><br></c:if>
					<c:forEach var="a" items="${list}">
					<table  width="800px" style="border:none;">
						<tr><td align="left" style="border:none;">No_<font color=red>${a.telephone_seq}</font>_DATE : ${a.add_date}_WRITER : ${a.writer}</td><td align="right" style="border:none; color:grey;"><b><a id="modify" title ="수정" href="javaScript:modifyCheck(${a.telephone_seq});">Modify</a> | <a id="del" title="삭제" href="javaScript:delCheck(${a.telephone_seq});">Del</a></b></td></tr>
					</table>
							<table width="800px" style="border : solid 1px grey;">
								<tr>
									<th width="70px" class="bg">상호/성명</th>
									<td>${a.company}</td>
									<th rowspan="3" width="40px" class="bg">내용</th>
									<td rowspan="3" width="350px">${a.content}</td>
								</tr>
								<tr>
									<th class="bg">전화번호</th>
									<td>${a.phone1}-${a.phone2}-${a.phone3}</td>
								</tr>
								<tr>
									<th class="bg">찾는사람</th>
									<td>${a.to_kgmp}</td>
								</tr>
							</table><br/>
						</c:forEach>
					<center>
						${pageList}
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="../notice/img/Write.png" width="50px" onclick="popUpTelephoneAdd()">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>