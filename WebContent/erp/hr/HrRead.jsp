<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Member, java.util.Map, java.util.List" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
int code_seq = Integer.parseInt(request.getParameter("code_seq"));
pageContext.setAttribute("m", member_dao.selectMmeber(code_seq));
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
							<table width="600px">
								<tr><td><font color="red">* </font>사원정보</td></tr>
								<tr>
									<th width="60px">보 직</th>
									<td width="340px">
										[ ${m.department}_${m.w_level}(${m.emp_type}) ]
									</td>
									<th width="60px">직 책</th>
									<td width="80px">${m.work_type}</td>
								</tr>
							</table>
						<br/><br/>
							<table width="600px">
									<tr><td><font color="red">* </font>기본정보</td></tr>
									<tr>
										<td rowspan="6" align="center" style="background-color:#ffffff;" width="90px"><img src="/save/${m.emp_pic}" width=80px;/><br><br>[ 등록사진 ]</td>
									</tr>
									<tr>
										<th width="60px">이 름</th><td>한글 : ${m.kor_name}&nbsp; | 한문 : ${m.cha_name}&nbsp; | 영문 : ${m.eng_name}</td>
									</tr>
									<tr>
										<th>전화번호</th><td >${m.phone1} - ${m.phone2} - ${m.phone3}</td>
									</tr>
									<tr><th>휴대폰</th><td>${m.cell_phone1} - ${m.cell_phone2} - ${m.cell_phone3}</td></tr>
									<tr>
										<th>이메일</th><td>${m.email1} @ ${m.email2}</td>
									</tr>
									<tr>
										<th>주 소</th><td >${m.address}</td>
									</tr>
							</table><br/><br/>
							<table width="600px">
									<tr><td><font color="red">* </font>회원정보</td></tr>
									<tr>
										<th width="60px">아이디</th><td>${m.id}</td>
										<th width="60px">비밀번호</th><td>**********</td>
									</tr>
							</table><br/><br/>
							<table width="600px">
									<tr><td><font color="red">* </font>서명정보</td></tr>
									<tr>
										<th width="60px">파일명</th>
										<td>
											<c:if test="${m.member_sign==null||m.member_sign=='-'}">
												<font color="red">등록된 서명이 없습니다.</font>
											</c:if>
											<c:if test="${m.member_sign!=null||m.member_sign!='-'}">
												${m.member_sign} &nbsp;
												<font color="red"> [서명 확인 및 변경은 (인사>개인서명관리)에서 하시기 바랍니다.]</font>
											</c:if>
										</td>
									</tr>
							</table><br/><br/>
						<div id="paging">${pageList}</div>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/list.png" width="50px" onclick="goUrl('HrView.jsp')">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>