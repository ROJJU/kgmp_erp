<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String destFileName = "test.hwp";
response.setHeader("Content-Disposition", "attachment;filename=".concat(String.valueOf(destFileName)));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
table{width:800px; border-collapse:collapse;}table th, td{ border:1px solid black;}table td{height:30px;}table th{background-color:#D5D5D5;}
</style>
</head>
<body>
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
</body>
</html>