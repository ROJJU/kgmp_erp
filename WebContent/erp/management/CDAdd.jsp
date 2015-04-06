<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/CD_A.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript">
	    function formCheck() {
	    	var company=document.cd.company.value;
	    	var ceo=document.cd.ceo.value;
	    	
	    	if(company==null || company=="") {
				alert('상호명을 입력하세요');
				document.cd.company.focus();
				return false;
			}
	    	if(ceo==null || ceo=="") {
				alert('대표자를 입력하세요');
				document.cd.ceo.focus();
				return false;
			}
			if(confirm('글을 저장 하시겠습니까?'))
				document.cd.submit();
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
					<div id ="pageTitle"><b>Customer DataBase</b></div>
				</div>
				<div id = "CDTable">
					<form action="CD_Add_proc.jsp" method="post" onSubmit="return false" name="cd">
						<input type="hidden" name="member_name" value="${member_name}">
						<table width="820px">
							<tr>
								<td width="643px">
									<input type="radio" name="condition" value="open">공개
									<input type="radio" name="condition" value="close">비공개&nbsp;
									<a style="color:red;">*</a> 미선택시 기본값<a style="color:red;">(공개)</a>적용
								</td>
								<td>Type of Renewal : 
									<select name="type_renewal">
										<option value="BTA PIN">BTA PIN</option>
										<option value="BTA AGENT">BTA AGENT</option>
										<option value="DRUG RENEWAL">DRUG RENEWAL</option>
										<option value="PLD RENEWAL">PLD RENEWAL</option>
										<option value="MEDEV CERT">MEDEV CERT</option>
										<option value="MEDEV RENEWAL">MEDEV RENEWAL</option>
										<option value="DMF RENEWAL">DMF RENEWAL</option>
										<option value="MAF RENEWAL">MAF RENEWAL</option>
										<option value="VMF RENEWAL">VMF RENEWAL</option>
										<option value="RED RENEWAL">RED RENEWAL</option>
										<option value="FCE RENEWAL">FCE RENEWAL</option>
									</select>
								</td>
							</tr>
						</table>
						<table class="CD">
							<tr align="left">
								<th>&nbsp;거래처등록번호</th>
								<td align="center"><input type="text" name="client_num" style="width:230px;"></td>
								<th>&nbsp;종사업장번호</th>
								<td align="center"><input type="text" name="company_num" style="width:230px;"></td>
							</tr>
							<tr align="left">
								<th><a style="color:red;">&nbsp;* </a>상호(법인명)</th>
								<td align="center"><input type="text" name="company" style="width:230px;"></td>
								<th><a style="color:red;">&nbsp;* </a>대표자</th>
								<td align="center"><input type="text" name="ceo" style="width:230px;"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;Mailing Address</th>
								<td align="center" colspan="3"><input type="text" name="address" style="width:642px;"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;Physical Address</th>
								<td align="center" colspan="3"><input type="text" name="address_p" style="width:642px;"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;업태</th>
								<td align="center"><input type="text" style="width:230px;" name="bz_condition"></td>
								<th>&nbsp;종목</th>
								<td align="center"><input type="text" style="width:230px;" name="type"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;사이트주소</th>
								<td align="center"><input type="text" style="width:230px;" name="site"></td>
								<th>&nbsp;분류</th>
								<td align="center">
									<select name="sort" style="width:230px;" >
										<option value="0">기타</option>
										<option value="1">Drug</option>
										<option value="2">Cosmetic</option>
										<option value="3">Food</option>
										<option value="4">Device</option>
									</select>
								</td>
							</tr>
						</table><br/>
						<table class="CD">
							<tr align="left">
								<th>&nbsp;주담당부서명</th>
								<td align="center"><input type="text"  style="width:230px;"name="main_part_name"></td>
								<th>&nbsp;부담당부서명</th>
								<td align="center"><input type="text"  style="width:230px;" name="sub_part_name"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자명</th>
								<td align="center"><input type="text"  style="width:230px;" name="main_name"></td>
								<th>&nbsp;부담당자명</th>
								<td align="center"><input type="text"  style="width:230px;" name="sub_name"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자전화번호</th>
								<td align="center"><input type="text"  style="width:65px;" name="main_phone1"> - <input type="text"  style="width:65px;" name="main_phone2"> - <input type="text"  style="width:65px;" name="main_phone3"></td>
								<th>&nbsp;부담당자전화번호</th>
								<td align="center"><input type="text"  style="width:65px;" name="sub_phone1"> - <input type="text"  style="width:65px;" name="sub_phone2"> - <input type="text"  style="width:65px;" name="sub_phone3"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자휴대전화번호</th>
								<td align="center"><select style="width:65px;" name="main_cell_phone1"><option>010</option><option>017</option><option>018</option></select> - <input type="text" style="width:65px;"name="main_cell_phone2"> - <input type="text" style="width:65px;"name="main_cell_phone3"></td>
								<th>&nbsp;부담당자휴대전화번호</th>
								<td align="center"><select style="width:65px;" name="sub_cell_phone1"><option>010</option><option>017</option><option>018</option></select> - <input type="text" style="width:65px;"name="sub_cell_phone2"> - <input type="text" style="width:65px;"name="sub_cell_phone3"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자팩스번호</th>
								<td align="center"><input type="text" style="width:65px;" name="main_fax1"> - <input type="text" style="width:65px;" name="main_fax2"> - <input type="text" style="width:65px;" name="main_fax3"></td>
								<th>&nbsp;부담당자팩스번호</th>
								<td align="center"><input type="text" style="width:65px;" name="sub_fax1"> - <input type="text" style="width:65px;" name="sub_fax2"> - <input type="text" style="width:65px;" name="sub_fax3"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자메일</th>
								<td align="center"><input type="text" style="width:90px;" name="main_email1"> @ <input type="text" style="width:114px;" name="main_email2"></td>
								<th>&nbsp;부담당자이메일</th>
								<td align="center"><input type="text" style="width:90px;" name="sub_email1"> @ <input type="text" style="width:114px;" name="sub_email2"></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="img/list.png" width="50px" onclick="goUrl('CDView.jsp')">
						<input type="image" src="img/add.png" width="50px" onclick="formCheck()">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>