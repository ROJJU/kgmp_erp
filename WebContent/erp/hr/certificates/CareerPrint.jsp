<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../css/Career_P.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript" src="../js/Career_P.js"></script>
	</head>
	<body>
		<jsp:include page="../../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Certificate of Career </b></div>
				</div>
				<div id = "reportTable">
					<center>
						<table>
							<tr height="100px" align="center">
								<td colspan="7"><h1>경 력 증 명 서</h1></td>
							</tr>
							<tr align="center">
								<th rowspan="3" width="40px">인적<br/>사항</th>
								<td rowspan="2">성명</td>
								<td>한글</td><td width="120px"></td>
								<td rowspan="2" width="120px">주민등록번호</td><td rowspan="2" colspan="2" width="200px"></td>
							</tr>
							<tr align="center">
								<td>한자</td><td></td>
							</tr>
							<tr align="center">
								<td>주소</td><td colspan="5"></td>
							</tr>
							<tr>
								<th rowspan="5">경<br/><br/>력<br/><br/>사<br/><br/>항</th>
								<th colspan="2" height="30px">근 무 기 간</th>
								<th rowspan="2">기 간</th>
								<th rowspan="2">직 급</th>
								<th rowspan="2"  width="120px">직 책</th>
								<th rowspan="2">근 무 부 서</th>
							</tr>
							<tr>
								<th width="80px" height="30px">부 터</th>
								<th width="80px">까 지</th>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center">
								<th>근무<br/>년한</th>
								<td colspan="2"></td>
								<td colspan="2"></td>
								<td></td>
							</tr>
							<tr align="center">
								<th height="80px">퇴직<br/>사유</th>
								<td colspan="6"></td>
							</tr>
							<tr>
								<th rowspan="6">상<br/><br/>벌<br/><br/>사<br/><br/>항</th>
								<th colspan="3" height="30px">포    상</th>
								<th colspan="3">징    계</th>
							</tr>
							<tr align="center">
								<td>년 월 일</td>
								<td>종 류</td>
								<td>기 관</td>
								<td>년 월 일</td>
								<td>종 류</td>
								<td>기 관</td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
							<tr align="center">
								<th rowspan="4">교<br/>육<br/>훈<br/>련</th>
								<th colspan="2"  height="30px">교육기관</th>
								<th colspan="3">교육훈련내용</th>
								<th>기 관</th>
							</tr>
							<tr align="center">
								<td colspan="2"></td>
								<td colspan="3"></td>
								<td></td>
							</tr>
							<tr align="center">
								<td colspan="2"></td>
								<td colspan="3"></td>
								<td></td>
							</tr>
							<tr align="center">
								<td colspan="2"></td>
								<td colspan="3"></td>
								<td></td>
							</tr>
							<tr align="center">
								<th height="80px">용도</th>
								<td colspan="6"></td>
							</tr>
							<tr align="center" >
								<td colspan="7" >
									<br/>위와같이 경력을 증명합니다.<br/><br/>
									<center>
									2014년 08월 01일<br/><br/><br/><br/>
									<h1>(주)한국지엠피 대표 김 효 진</h1><br/><br/>
									</center>
								</td>
							</tr>
						</table>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="../img/list.png" width="50px" onClick="goUrl('CertificateList.jsp')">
						<input type="image" src="../img/modify.png" width="50px" onClick="goUrl('CareerAdd.jsp')">
						<input type="image" src="../img/del.png" width="50px">
						<input type="image" src="../img/print.png" width="50px" onClick="javascript:printIt(document.getElementById('reportTable').innerHTML)">
						<input type="image" src="" onClick="goUrl('CareerExl.jsp')"/>
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../../main/Footer.html"></jsp:include>
	</body>
</html>