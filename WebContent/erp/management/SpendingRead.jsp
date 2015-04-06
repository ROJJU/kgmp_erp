<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Spend" %>
<jsp:useBean id="spend_dao" class="kgmp.common.dao.Spend_dao" scope="session"></jsp:useBean>
<%@ page import="kgmp.common.beans.Member" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
String id=(String)session.getAttribute("member_id");
String member_sign=member_dao.printSign(id);
%>
<%
//print select
int spend_seq = Integer.parseInt(request.getParameter("spend_seq"));
pageContext.setAttribute("s", spend_dao.selectSpend(spend_seq));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="css/SpendingBody.css" rel="stylesheet" />
	    <link type="text/css" href="css/Spending_R.css" rel="stylesheet" />
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript" src="js/Spending_R.js"></script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Spending</b></div>
				</div>
				<div id = "reportTable">
					<center>
						<table>
							<tr>
								<td class="blank" rowspan="2" align="center"><h1>지 출 결 의 서</h1></td>
								<th rowspan="2" class="line" width="50px;">결재</th>
								<th class="line">담당</th>
								<th class="line">대표</th>
							</tr>
							<tr align="center">
								<td height="30px" class="line" width="100px"><img src="/save/Member_Sign/<%=member_sign%>" width="50px"></td>
								<td class="line" width="100px">
									<c:if test="${s.state==0}"><b>[Wait]</b></c:if>
									<c:if test="${s.state==1}"><img src="img/CEO_Signature.gif" width="50px"></c:if>
									<c:if test="${s.state==2}"><b style="color:red;">[Reject]</b></c:if>
								</td>
							</tr>
						</table><br/>
						<table>
							<tr>
								<td align="center" class="underLine"> 일금 ${s.money_kor}원 정</td>
								<td width="100px"></td>
								<td align="center" class="underLine"> (${s.money}￦)
								<td width="100px"></td>
							</tr>
						</table><br/>
						<table class="line">
							<tr class="line">
								<th class="line">검토인</th><td width="100px" class="line" align="center">-</td>
								<th class="line">검토일</th><td width="100px" class="line" align="center">-</td>
								<th class="line">계정과목</th>
								<th class="line">출금액</th>
								<th class="line">출금방법</th>
								<th class="line">출금통장</th>
							</tr>
							<tr class="line">
								<th class="line">지출인</th><td class="line" align="center">${s.writer}</td>
								<th class="line">지출일</th><td class="line" align="center">${s.spend_date}</td>
								<td class="line"></td>
								<td class="line"></td>
								<td class="line"></td>
								<td class="line"></td>
							</tr>
						</table><br/>
						<table class="line">
							<tr class="line">
								<th colspan="8" class="line">지출내역</th>
							</tr>
							<tr class="line" >
								<th class="line">일 시</th>
								<th class="line">적 요</th>
								<th class="line">가맹점명</th>
								<th class="line">금 액</th>
								<th class="line">결제방법</th>
								<th class="line">비 고</th>
							</tr>
							<tr class="line" align="center">
								<td class="line">${s.spend_date}</td>
								<td class="line">${s.summary}</td>
								<td class="line"></td>
								<td class="line">${s.money}원</td>
								<td class="line">${s.how}</td>
								<td class="line">${s.etc}</td>
							</tr>
						</table><br/>
						<table>
							<tr>
								<td  align="center" colspan="3">위 금액을 청구하오니 결재 바랍니다.</td>
								<th class="line" width="100px">영수인</th>
							</tr>
							<tr align="center">
								<td>${s.add_date}</td>
								<td>청구인:</td>
								<td >${s.writer} &nbsp;<img src="/save/Member_Sign/<%=member_sign%>" width="50px"></td>
								<td class="line"></td>
							</tr>
						</table><br/><br/><br/><hr/><br/><br/>
						<table>
							<tr>
								<th class="line" width="100px" style="background-color:#BDBDBD;">첨&nbsp;&nbsp;&nbsp; 부<br/>영수증<br/></th>
								<td class="line" align="center" height="500px">
									<c:if test="${s.spend_img==null}"><font color="red">첨부 영수증 없음</font></c:if>
									<c:if test="${s.spend_img!=null}"><img src="/save/Spend/${s.spend_img}" width="60%"></c:if>
								</td>
							</tr>
						</table>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons" align="right">
						<input type="image" src="img/list.png" width="50px" onClick="goUrl('SpendingView.jsp')">
						<c:if test="${s.state==0}">
							<input type="image" src="img/modify.png" width="50px" onClick="goUrl('SpendingModify.jsp?spend_seq=${s.spend_seq}')">
							<input type="image" src="img/del.png" width="50px" onclick="goUrl('Spend_del_proc.jsp?spend_seq=${s.spend_seq}&file=${s.spend_img}')">
						</c:if>
						<input type="image" src="img/print.png" width="50px" onClick="javascript:printIt(document.getElementById('reportTable').innerHTML)">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>