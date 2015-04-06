<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../../main/css/Side.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<style type="text/css">
			div.{border:solid 1px red;}
			#titlePlace{position:relative; height:110px;}
			#pageTitle{position:relative; top: 30px; left:50px; width:500px; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; background-color:#EAEAEA; padding:3px;}
			#bottons{position:relative; left:250px; width:320px;}
		</style>
	</head>
	<body>
		<jsp:include page="../../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../../main/QuickMenu.jsp"/>
		<jsp:include page="../../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Certificates</b></div>
				</div>
				<div id = "DLTable">
					<center>
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th width="80px">사원번호</th>
								<th width="80px">신청인</th>
								<th>신청 증명서류</th>
								<th width="80px">발행일</th>
								<th width="40px">상태</th>
							</tr>
							<tr onclick="goUrl('RestPrint.jsp')" align="center" class="a">
								<td align="center">1</td>
								<td>01</td>
								<td>김찬홍</td>
								<td>휴직 증명서</td>
								<td>2014.08.11</td>
								<td><b style="color:red;">대기</b></td>
							</tr>
							<tr onclick="goUrl('CareerPrint.jsp')" align="center" class="a">
								<td align="center">1</td>
								<td>01</td>
								<td>김찬홍</td>
								<td>경력 증명서</td>
								<td>2014.08.11</td>
								<td><b style="color:blue;">컴펌</b></td>
							</tr>
						</table><br/>
						<div id="paging">1 2 3</div>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="../img/employment.png" width="100px" onclick="goUrl('EmploymentAdd.jsp')">
								<input type="image" src="../img/rest.png" width="100px" onclick="goUrl('RestAdd.jsp')">
								<input type="image" src="../img/career.png" width="100px" onclick="goUrl('CareerAdd.jsp')">
							</div><br/><br/>
							<div id ="serch">
								<select>
									<option>ALL</option>
									<option>직책</option>
									<option>소속</option>
									<option>성명</option>
									<option>일자</option>
								</select>
								<input type="text"> <input type="image" src="../img/serch.png" width="45px">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../../main/Footer.html"></jsp:include>
	</body>
</html>