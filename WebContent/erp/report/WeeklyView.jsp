<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/Weekly_V.css"/>
<script type="text/javascript">
function popup_wAdd(){
	window.open("WeeklyAdd_s.jsp","wAdd_s","width=1050px, height=470px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
}
</script> 
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>WeeklyReport</b></div>
				</div>
				<div class="box">
					<div id = "font">
					  <ul class="main_menu">
					  	   <li onclick="')">ALL</li>
						   <li onclick="')">ESA</li>
  							   <li class="active">Hong</li>
						   <li onclick = "">NewGreen</li>
						   <li onclick = "">Hyo_en</li>
					  </ul>
					 </div>
					 <div align="right">
					 	<select>
					 		<option>2014년</option>
					 	</select>
					 	<select>
					 		<option>7월</option>
					 	</select>
					 	<input type="image" src="../notice/img/serch.png" width="35px"/>
					 </div>
				</div>
				<div id = "bodyTable">
					<center>
						<table width="800px">
							<tr>
								<th width="40px">번호</th>
								<th width="500px">제목</th>
								<th>작성자</th>
								<th>일자</th>
								<th>조회수</th>
							</tr>
							<tr class="a" onclick="goUrl('WeeklyRead.jsp')">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차  :test <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
							<tr class="a">
								<td align="center">1</td>
								<td>K-GMP_주간업무보고_07월2주차 <a style="color:red;">(1)</a></td>
								<td align="center">김찬홍</td>
								<td align="center">2014.07.24</td>
								<td align="center">119</td>
							</tr>
						</table><br/>
						<form name="formname" action="WeeklyRead.jsp">
						</form>
						<div id="paging">1 2 3</div>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/report.png" width="50px" onclick="popup_wAdd()">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>