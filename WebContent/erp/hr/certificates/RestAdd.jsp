<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/css/Side.css"/>
		<link rel="stylesheet" type="text/css" href="../css/Rest_A.css"/>
		<link rel="stylesheet" type="text/css" href="../../main/css/BasicBody.css"/>
		<script type="text/javascript">
		function formCheck() {
			var date = document.rest.date.value;
			var why = document.rest.why.value;
			
			if(date==null || date=="") {
				alert('휴직일자를 입력하세요');
				return false;
			}
			if(why==null || why=="") {
				alert('휴직사유를 입력하세요');
				return false;
			}
			if(confirm('글을 저장 하시겠습니까?'))
				document.rest.submit();
		}
		</script>
	</head>
	<body>
		<jsp:include page="../../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../../main/QuickMenu.jsp"/>
		<jsp:include page="../../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Certificate of Temporary Rest Pemission</b></div>
				</div>
				<div id="box"></div>
				<div id = "reportTable">
					<center>
					<form action="RestPrint.jsp" method="post" onSubmit="return false" name="rest">
						<table class="Rest">
							<tr>
								<th width="80px">휴직 일자</th>
								<td align="center"><input type="text" style="width:670px;" name="date"></td>
							</tr>
						</table><br/>
						<table class="Rest">
							<tr>
								<th width="80px">휴직<br/>사유</th>
								<td align="center"><textarea cols="85" rows="5" name="why" style="width:670px;"></textarea></td>
							</tr>
						</table><br/>
					</form>
						<table class="Rest">
							<tr>
								<td style="border-color:grey; color:grey; font-size:10px; font-family:맑은 고딕; padding:10px;">회사는 취업 규칙에 의거하여 직원이 특정한 사유로 휴직을 신청하는 경우 이를 인정해야 한다. 또 인사상의 처우나 징계 처분 등 회사의 명령에 의한 휴직은 그에 합당한 사유가 있어야 한다.

휴직증명서는 근로자가 어떠한 사유로 인해 휴직을 할 때 이를 증명하는 내용의 문서를 말한다. 휴직증명서에는 소속, 성명 등의 인적사항과 함께 휴직일자와 휴직사유가 정확히 기재되어야 한다.

휴직증명서는 필요에 따라 각종 기관에 증빙 서류로 제출할 수 있다.<br/><br/><p style="color:red; text-align:center;">성명, 주민번호, 소속 직위 등은 기본 정보에서 자동 입력 되므로 주의 바랍니다.</p>
							</tr>
						</table>
					</center>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="../img/cancel.png" width="50px" onClick="goUrl('CertificateList.jsp')">
						<input type="image" src="../img/save.png" width="50px" onClick="formCheck()">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../../main/Footer.html"></jsp:include>
	</body>
</html>