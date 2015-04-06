<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Spend, java.util.Map, java.util.List, java.util.*" %>
<jsp:useBean id="spend_dao" class="kgmp.common.dao.Spend_dao" scope="session"/>
<%@ page import="kgmp.common.beans.Member" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
String id=(String)session.getAttribute("member_id");
String member_sign=member_dao.printSign(id);
%>
<%
//calendar cal
Calendar cal =Calendar.getInstance(); 
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1 for month of  korea
if(request.getParameter("year") != null)
	nowYear=Integer.parseInt(request.getParameter("year"));
if(request.getParameter("month") != null)
	nowMonth=Integer.parseInt(request.getParameter("month"));
%>
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
//페이징과 리스트 가져오기
	Map<String, Object> pageAll = spend_dao.getSpend(currentPage, linkURL, nowYear, nowMonth);
	String pageList = (String)pageAll.get("pageList");
	List<Spend> list = (List<Spend>)pageAll.get("list");
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
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<style type="text/css">
			div.{border:solid 1px red;}
			#titlePlace{position:relative; height:110px;}
			#pageTitle{position:relative; top: 30px; left:50px; width:500px; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; background-color:#EAEAEA; padding:3px;}
			#bottons{position:relative; left:370px; width:100px;}
			#sum{position:absolute; background-color:#ffffff; width:220px; border:1px solid black; padding:3px; top:75px; left:620px;}
			a{text-decoration:none;}
			select, input, img, input {/* border: 0 none; */ vertical-align:middle;}
		</style>
		<script type="text/javascript">
		function window_onload(){
		    for ( i=1988;i<=2017 ; i++){
		        var op= new Option(i+ "년",i);
		         syear.options[i -1988]=op; 
		         if(i== <%=nowYear%> )
		         {
		            syear.options[i -1988].selected ="selected" ;
		         }
		   }
		     for ( i=1;i<=12 ; i++){
		        var op= new Option(i+ "월",i);
		         smonth.options[i -1]=op;
		         if(i== <%=nowMonth %>)
		         {
		             smonth.options[i -1].selected = "selected";
		         }
		     }
		 }
		function ban(){
			alert("서명 등록을 하셔야 합니다. (인사>인사카드관리>개인서명관리)에서 서명 등록 후 진행 하시기 바랍니다.");
		}
		</script>
	</head>
	<body onload ="window_onload()">
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Spending</b></div>
				</div>
				<div id="sum" align="center">
					<a href="SpendingView.jsp?year=<%= nowMonth-1== 0? nowYear-1:nowYear%>&month=<%=nowMonth-1==0? 12:nowMonth-1%>"><input type="image" src="../main/images/but-pre.png"></a>
					<form action="SpendingView.jsp" method="post" name="spend" style="float:left;">
						<b>&nbsp;[ <select id = "syear" name="year"><option></option></select> <select id= "smonth" name="month"><option></option></select> <a href="javaScript:document.spend.submit()">GO</a> ]</b>
					</form>
					<a ><input type="image" src="../main/images/but-next.png" onclick="goUrl('SpendingView.jsp?year=<%= nowMonth+1==13?nowYear+1:nowYear%>&month=<%=nowMonth+1==13?1:nowMonth+1 %>')"></a>
				</div>
				<div id = "DLTable">
					<center>
						<table width="800px">
							<tr>
								<th width="40px">번 호</th>
								<th width="80px">영수증</th>
								<th width="80px">성 명</th>
								<th>결제명</th>
								<th>결제 방법</th>
								<th>금 액</th>
								<th width="80px">입력일자</th>
								<th width="40px">상 태</th>
							</tr>
						<c:if test="${list=='[]'}"><tr><td style="color:red;" colspan="8" align="center">지출 결의서 내역이 없습니다.</td></tr></c:if>
						<c:forEach var="a" items="${list}">
							<c:if test="${member_name==a.writer}"><tr onclick="goUrl('SpendingRead.jsp?spend_seq=${a.spend_seq}')" align="center" class="a"></c:if>
							<c:if test="${member_name!=a.writer}"><tr onclick="javaScript:alert('서류 열람은 본인만 가능합니다.');" align="center" class="a"></c:if>
								<td align="center">${a.spend_seq}</td>
								<td>
									<c:if test="${a.spend_img!=null}"><input type="image" src="../report/img/icon_attach.gif" title="${a.spend_img}"></c:if>
									<c:if test="${a.spend_img==null}">-</c:if>
								</td>
								<td>${a.writer }</td>
								<td>${a.title}</td>
								<th>${a.how}</th>
								<th>${a.money}원</th>
								<td>${a.add_date}</td>
								<td>
									<c:if test="${a.state==0}"><b>[Wait]</b></c:if>
									<c:if test="${a.state==1}"><b style="color:blue;">[Confirm]</b></c:if>
									<c:if test="${a.state==2}"><b style="color:red;">[Reject]</b></c:if>
								</td>
							</tr>
						</c:forEach>
						</table><br/>
						<div id="paging">${pageList}</div>
						<div id="bottonPlace">
							<div id="bottons">
							<%if(member_sign==null||member_sign==""||member_sign=="-"){ %>
								<input type="image" src="img/add.png" width="50px" onclick="ban()">
							<%}else{%>
								<input type="image" src="img/add.png" width="50px" onclick="goUrl('SpendingAdd.jsp')">
							<%}%>
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>