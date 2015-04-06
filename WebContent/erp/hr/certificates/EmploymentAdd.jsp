<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/css/Side.css"/>
		<link rel="stylesheet" type="text/css" href="../../main/css/BasicBody.css"/>
		<link rel="stylesheet" type="text/css" href="../css/Employ_A.css"/>
		<script type="text/javascript">
		function formCheck() {
			var since = document.forms[0].since.value;
			var why = document.forms[0].why.value;
			
			if(since==null || since=="") {
				alert('제직기간을 입력하세요');
				return false;
			}
			if(why==null || why=="") {
				alert('용도를 입력하세요');
				return false;
			}
			if(confirm('글을 저장 하시겠습니까?'))
				document.forms[0].submit();
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
					<div id ="pageTitle"><b>proof of employment</b></div>
				</div>
				<div id="box"></div>
				<div id = "reportTable">
					<center>
					<form action="EmploymentPrint.jsp" method="post" onSubmit="return false">
						<table class="employment">
							<tr>
								<th width="80px">재직기간</th>
								<td align="center"><input type="text"  name="since" style="width:670px;"></td>
							</tr>
						</table><br/>
						<table class="employment">
							<tr>
								<th width="80px">용도</th>
								<td align="center"><textarea cols="85" rows="5" name="why"  style="width:670px;"></textarea></td>
							</tr>
						</table><br/>
					</form>
						<table class="employment">
							<tr>
								<td style="border-color:grey; color:grey; font-size:10px; font-family:맑은 고딕; padding:10px;">재직증명서는 본인이 어떤 직장에 소속되어 있거나 어떤 직책을 맡고 있음을 재직증명서를 발급하는 회사(기관)가 보증하는 증명서이다. 

표준 재직증명서는 각 회사나 단체에서 정한 문서규정의 범위 내에서 서식이 정해지며 경우에 따라 규정의 내용과 관계없이 자유롭게 서식을 작성하는 경우도 있다. 일반적으로 회사에 따라 자사의 고유 서식을 사용하고 있으므로 기본적인 재직사항을 명확히 기재하는 것이 중요하다.
							<br/><br/><p style="color:red; text-align:center;">성명, 주민번호, 소속 직위 등은 기본 정보에서 자동 입력 되므로 주의 바랍니다.</p>
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