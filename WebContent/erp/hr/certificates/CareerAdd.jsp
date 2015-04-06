<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript" src="../js/CareerAdd.js"></script>
		<link rel="stylesheet" type="text/css" href="../../main/css/Table.css"/>
		<link rel="stylesheet" type="text/css" href="../../main/css/Side.css"/>
		<link rel="stylesheet" type="text/css" href="../../main/css/BasicBody.css"/>
		<link rel="stylesheet" type="text/css" href="../css/Career_A.css"/>
	</head>
	<body>
		<jsp:include page="../../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../../main/QuickMenu.jsp"/>
		<jsp:include page="../../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Certificate of Career </b></div>
				</div>
				<div id = "reportTable">
					<center>
<!--퇴직사유-->
					<form action="CareerPrint.jsp" method="post" onSubmit="return false" name="career">
						<table class="career">
							<tr>
								<th width="80px">퇴직사유</th>
								<td width="500px" align="center">
									<textarea cols="85" rows="5" name="why"></textarea>
								</td>
							</tr>
						</table><br/>
					<div class ="contBox" align="right" style="padding:0 50px;">
					    <a id="tableReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="text" id="str" value="1" style="border:0;" readonly size="1px">&nbsp;
					    <input type="image" src="../img/link.png" id="conditionAddRow" width="12px" onClick="clicked()"/>
					</div>
<!--포상/징계-->
						<table id="condition">
							<tr height="30px">
								<th colspan="3">포상</th>
								<th colspan="4">징계</th>
							</tr>
							<tr height="30px" align="center">
								<td>년 월 일</td>
								<td>종 류</td>
								<td>기 관</td>
								<td>년 월 일</td>
								<td>종 류</td>
								<td>기 관</td>
								<th>삭 제</th>
							</tr>
							<tr height="30px" align="center">
								<td><input type="date" name="good_date" /></td>
								<td><input type="text" size="5px" name="good_type"/></td>
								<td><input type="text" size="5px" name="good_institute"/></td>
								<td><input type="date" name="bad_date"/></td>
								<td><input type="text" size="5px" name="bad_type"/></td>
								<td><input type="text" size="5px" name="bad_institute"/></td>
								<td width="40px"></td>
							</tr>
						</table><br/>
					<div class ="contBox" align="right" style="padding:0 50px;">
					    <a id="eduTableReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="text" id="eduStr" value="1" style="border:0;" readonly size="1px">
					    <input type="image" src="../img/link.png" id="eduAddRow" width="12px" onClick="clicked()"/>
					</div>
<!--교육훈련-->
						<table id="edu">
							<tr height="30px">
								<th colspan="4">교육훈련</th>
							</tr>
							<tr height="30px" align="center">
								<td>교육기관</td>
								<td>교육훈련내용</td>
								<td>기 관</td>
								<th width="40px">삭 제</th>
							</tr>
							<tr height="30px" align="center">
								<td><input type="text" name="edu_institute"/></td>
								<td><input type="text" name="edu_story"/></td>
								<td><input type="text" name="edu_company"/></td>
								<td></td>
							</tr>
						</table><br/>
<!--용도-->
						<table class="career">
							<tr>
								<th width="80px">용도</th>
								<td align="center"><textarea cols="85" rows="5" name="use"></textarea></td>
							</tr>
						</table><br/>
					</form>
						<table class="career">
							<tr>
								<td style="border-color:grey; color:grey; font-size:10px; font-family:맑은 고딕; padding:10px;">퇴직자의 경우 퇴직사유를 명확하게 기재하는 것이 좋으며 퇴직사유에는 정년퇴직, 명예퇴직, 이직, 권고사직 등의 내용을 기재할 수 있다.

근로기준법에 의하여 기업은 근로자가 퇴직한 후에도 업무기간, 업무의 종류, 지위와 임금 등 필요한 사항에 관한 증명서를 청구할 때에는 사실대로 기입하여 교부해야 할 의무가 있다.

 경력증명서는 주로 퇴사 후 근로자의 재직사실과 업무내용, 직책 등을 회사가 증명하여 주는 내용으로 구성되며, 법적으로 표준화된 서식이 있는 것이 아니므로 경력증명서를 요구하는 기관의 요구에 충실히 따르면 된다. 표준 경력증명서의 내용은 회사마다 다를 수 있지만 기본적으로는 근무기간, 직책, 수행한 업무 등에 관하여 기재한다.
 									<br/><br/><p style="color:red; text-align:center;">성명, 주민번호, 소속 직위 등은 기본 정보에서 자동 입력 되므로 주의 바랍니다.</p>
 								</td>
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