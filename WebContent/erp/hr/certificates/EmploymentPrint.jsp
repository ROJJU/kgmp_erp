<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/Employ_P.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript" src="../js/Employ_P.js"></script>
	</head>
	<body>
		<jsp:include page="../../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>proof of employment </b></div>
				</div>
				<div id = "reportTable">
					<center>
						<table>
							<tr align="center">
								<td rowspan="3" ><h1>재 직 증 명 서</h1></td>
								<th height="30px">부 서 명</th>
								<td >개발부</td>
							</tr>
							<tr>
								<th height="30px">작 성 자</th>
								<td></td>
							</tr>
							<tr>
								<th height="30px">작성일자</th>
								<td></td>
							</tr>
						</table><br/>
						<table>
							<tr align="center">
								<td rowspan="2" width="80px" >인 적<br/>사 항</td>
								<td  width="80px" height="50px">성 명</td>
								<td></td>
								<td  width="80px">주민등록번호</td>
								<td></td>
							</tr>
							<tr>
								<td align="center" height="50px">주 소</td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td rowspan="3" align="center">재 직<br/>사 항</td>
								<td align="center" height="50px">소 속</td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td align="center" height="50px">직 위</td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td align="center" height="50px">재직기간</td>
								<td colspan="3"></td>
							</tr>
							<tr>
								<td align="center" height="100px">용 도</td>
								<td colspan="4"></td>
							</tr>
							<tr>
							<td colspan="5" height="500px">
								<br/> &nbsp; 위와 같이 재직하고 있음을 증명합니다.<br/><br/><br/><br/><br/><p style="text-align:center;">2014년 08월 12일</p><br/><br/><br/><p style="padding:0 0 0 400px;">발령인 :<br/><br/>직&nbsp;&nbsp;&nbsp; 위 :<br/><br/><br/>주&nbsp;&nbsp;&nbsp; 소:
								</p><br/><br/><br/><br/><br/><p style="text-align:right; padding:0 80px;">대표이사 : &nbsp;&nbsp;김 효진 (인)</p><br/><br/><h1 style="text-align:center;">주식회사 한국지엠피</h1>
							</td>
							</tr>
						</table>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="../img/list.png" width="50px" onClick="goUrl('CertificateList.jsp')">
						<input type="image" src="../img/modify.png" width="50px" onClick="goUrl('EmploymentAdd.jsp')">
						<input type="image" src="../img/del.png" width="50px">
						<input type="image" src="../img/print.png" width="50px" onClick="javascript:printIt(document.getElementById('reportTable').innerHTML)">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../../main/Footer.html"></jsp:include>
	</body>
</html>