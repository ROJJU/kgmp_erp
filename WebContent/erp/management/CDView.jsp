<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Customer, java.util.Map, java.util.List" %>
<jsp:useBean id="CustomerDAO" class="kgmp.common.dao.Customer_db_dao" scope="session"/>
<%
//휴지통 수 연산
int trash = CustomerDAO.getTrashQty();
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
	Map<String, Object> pageAll = CustomerDAO.getCustomers(currentPage, linkURL, search, find);
	String pageList = (String)pageAll.get("pageList");
	List<Customer> list = (List<Customer>)pageAll.get("list");
//페이지속성 추가
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pageList", pageList);
//디비개수 출력
	int count = CustomerDAO.countCustomer(search, find);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/CD_V.css"/>
	    <script type="text/javascript">
	    function onload(){
	    	var search=document.getElementById("search");
	    	if(search.value=="sort"){
	    		$( "#find" ).hide();
	    		$( ".sort" ).show();
	    	}else{
	    		$( "#find" ).show();
	    		$( ".sort" ).hide();
	    	}
	    }
	    function selChange(obj){
	    	if(obj.value=="sort"){
	    		$( "#find" ).hide();
	    		$( ".sort" ).show();
	    	}else{
	    		$( "#find" ).show();
	    		$( ".sort" ).hide();
	    	}
	    }
	    function findChange(obj){
	    	var find = document.getElementById("find");
	    	find.value=obj.value;
	    }
	    function warnning(){
	    	alert('비공개 서류 입니다.');
	    }
	    function formCheck() {
				document.cd.submit();
	    }
	    function trash(){
	    	document.cd.search.value="state"
	    	document.cd.submit();
	    }
	    </script>
	</head>
	<body onload="onload()">
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>ContactDirect</b></div>
					<div id ="add"><input type="image" src="../main/images/link.png" width="11px" onclick="goUrl('CDAdd.jsp')"></div>
				<div id="serchPlace">
					<div id ="serch" style="float:left;">
						<form action="CDView.jsp" method="post" name="cd">
							<select name="search" id="search" onchange="selChange(this)">
								<option value="all" <%="all".equals(search)?"selected":""%>>ALL</option>
								<option value="state" <%="state".equals(search)?"selected":""%>>휴지통</option>
								<option value="member_name" <%="member_name".equals(search)?"selected":""%>>db 입력자</option>
								<option value="company" <%="company".equals(search)?"selected":""%>>회사명</option>
								<option value="main_name" <%="main_name".equals(search)?"selected":""%>>담당자</option>
								<option value="customer_seq" <%="customer_seq".equals(search)?"selected":""%>>Code</option>
								<option value="sort" id="menu1" <%="sort".equals(search)?"selected":""%>>분류별</option>
							</select>
							<select class="sort" onchange="findChange(this)">
								<option>분류선택</option>
								<option value="0" <%="0".equals(find)?"selected":""%>>기타</option>
								<option value="1" <%="1".equals(find)?"selected":""%>>Drug</option>
								<option value="2" <%="2".equals(find)?"selected":""%>>Cosmetic</option>
								<option value="3" <%="3".equals(find)?"selected":""%>>Food</option>
								<option value="4" <%="4".equals(find)?"selected":""%>>Device</option>
							</select>
							<input type="text" name="find" id="find">
							&nbsp;<a onClick="formCheck()" style="cursor:hand; cursor:pointer;" title="검색">Search</a>
							&nbsp; | Total number of List : <font color="red"><%=count %></font>
						</form>
					</div>
					<div id="trash" style="float:left;"><a href="#" onclick="trash()"><img src="img/trash_Full.png" width="20px"> 휴지통 <b style="font-size:9px; color:blue;">[<%=trash%>]</b></a></div>
					<div id="page" style="float:left;">
						${pageList}
					</div>
				</div>
				</div>
				<div id = "tablePlace">
					<table width="950px">
							<tr>
								<th width="40px" >Code</th>
								<th >Assigned To</th>
								<th>Company Name</th>
								<th>Address</th>
								<th>Phone</th>
								<th>Fax</th>
								<th>Email</th>
								<th>Website</th>
							</tr>
						<c:if test="${list=='[]'}"><tr><td colspan="8" align="center"><font color="red">* 고객 정보가 없습니다. *</font></td></tr></c:if>
						<c:forEach var="a" items="${list}">
							<c:if test="${a.condition=='close'}">
								<c:if test="${a.member_name==member_name}"><tr class="a" onclick="goUrl('CDRead.jsp?customer_seq=${a.customer_seq}&currentPage=<%=currentPage%>');" style="color:blue;"></c:if>
								<c:if test="${a.member_name!=member_name}"><tr class="a" style="color:red;" onclick="warnning();"></c:if>
							</c:if>
							<c:if test="${a.condition=='open'}"><tr class="a" onclick="goUrl('CDRead.jsp?customer_seq=${a.customer_seq}&currentPage=<%=currentPage%>');"></c:if>
								<td title="2014.08.29" align="center">${a.customer_seq}</td>
								<td>${a.main_name}</td>
								<td><div class="company" title="${a.company}">${a.company}</div></td>
								<td><div class="ellipsis" title="${a.address}">${a.address}</div></td>
								<td>
									<c:if test="${a.main_phone3=='0'||a.main_phone2=='0'}">-</c:if>
									<c:if test="${a.main_phone3!='0'}">${a.main_phone1}-${a.main_phone2}-${a.main_phone3}</c:if>
								</td>
								<td>
									<c:if test="${a.main_fax3=='0'||a.main_fax2=='0'}">-</c:if>
									<c:if test="${a.main_fax3!='0'}">${a.main_fax1}-${a.main_fax2}-${a.main_fax3}</c:if>
								</td>
								<td>
									<c:if test="${a.main_email2=='-'||a.main_email1=='-'}">-</c:if>
									<c:if test="${a.main_email2!='-'}"><div class="email" title="${a.main_email1}@${a.main_email2}">${a.main_email1}@${a.main_email2}</div></c:if>
								</td>
								<td><div class="web" title="${a.site}">${a.site}</div></td>
							</tr>
						</c:forEach>
					</table><br/>
				</div>
			</div>
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>