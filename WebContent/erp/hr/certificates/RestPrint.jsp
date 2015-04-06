<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<style type="text/css">
			div.{border:solid 1px red;}
			#titlePlace{position:relative; height:110px;}
			#pageTitle{position:relative; top: 30px; left:30px; width:500px; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; background-color:#EAEAEA; padding:3px;}
			#ViewList{position:relative;width:300px;}
			#buttonPlace{position:relative; height:60px;}
			#buttons{position:relative; left:660px; top:30px; width:210px;}
			table{border-collapse:collapse;}
			table th, td{ border:1px solid black;}
			table th{background-color:#D5D5D5; }
			
			
	body{position:relative;height:100%;background:#f5f6f7; margin:0 auto;}
	#container{position:relative; width:1280px; height:1120px; font-size:12px;font-family:Arial, Helvetica, sans-serif; margin:0 auto; }
	#content{position:relative; width:900px; height:100%; margin:0 auto;}
	#footer{possition:relative; height:90px;}
	#flap{position:relative; width:950px; margin:0 auto;}
	.text{position:relative; font-family:맑은 고딕; font-size:11px; color:grey;}
	#longLogo{position: absolute; left:730px; top:1px;}
	#con{position:relative; left:30px;}
	
		</style>
		<script type="text/javascript">
		var win=null;
		  function printIt(printThis)  {
		    win = window.open('','offprint','width=755 height=526');
		    self.focus();
		    win.document.open();
		    win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
		    win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
		    win.document.write('table{border-collapse:collapse;}table th, td{ border:1px solid black;}table th{background-color:#D5D5D5;}');
		    win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
		    win.document.write('<br/><br/><br/><hr style="border: solid 1px grey;"/><br/><br/><br/>');
		    win.document.write(printThis);
		    win.document.write('<br/><br/><br/><hr style="border: solid 1px grey;"/>');
		    win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
		    win.document.close();
		    win.print();
		    win.close();
		  }
		</script>
	</head>
	<body>
		<jsp:include page="../../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Certificate of Temporary Rest Pemission</b></div>
				</div>
				<div id = "reportTable">
					<center>
						<table width="800px">
							<tr>
								<td style="border-bottom-color:grey;" align="center" height="100px"><h1>휴 직 증 명 서</h1></td>
							</tr>
							<tr>
								<td style="padding:20px;">
									<table width="800px">
										<tr height="35px">
											<th width="120px;">소 속</th>
											<td></td>
										</tr>
										<tr height="40px">
											<th>직 위</th>
											<td></td>
										</tr>
										<tr height="40px">
											<th>성 명</th>
											<td></td>
										</tr>
										<tr height="40px">
											<th>주민등록번호</th>
											<td></td>
										</tr>
										<tr height="40px">
											<th>휴 직 일 자</th>
											<td></td>
										</tr>
										<tr height="40px">
											<th>휴 직 사 유</th>
											<td></td>
										</tr>
									</table><br/><br/><br/><br/><br/><br/><br/><br/>
									<p style="text-align:center">본인은 위와 같은 사유로 인하여 휴직을 증명합니다. </p>
									<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
									<table width="250px" align="right">
										<tr><th height="35px" width="100px">날&nbsp;&nbsp;&nbsp;&nbsp; 짜</th><td></td></tr>
										<tr><th height="35px" width="100px">신 청 인</th><td align="right" style="padding:7px;">(인)</td></tr>
										<tr><th height="35px" width="100px">대&nbsp;&nbsp;&nbsp;&nbsp; 표</th><td align="right" style="padding:7px;">(인)</td></tr>
									</table>
									<br/><br/><br/><br/><br/><br/><br/><br/><br/>
									<br/><br/><br/><br/><br/><br/>
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
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../../main/Footer.html"></jsp:include>
	</body>
</html>