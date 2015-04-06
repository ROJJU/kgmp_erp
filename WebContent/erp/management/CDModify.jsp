<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Customer" %>
<jsp:useBean id="CustomerDAO" class="kgmp.common.dao.Customer_db_dao" scope="session"/>
<%
int customer_seq = Integer.parseInt(request.getParameter("customer_seq"));
int currentPage = Integer.parseInt(request.getParameter("currentPage"));
pageContext.setAttribute("c", CustomerDAO.getCustomer(customer_seq));
Customer customer = CustomerDAO.getCustomer(customer_seq);
String renewal = customer.getType_renewal();
%>
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
			if(confirm('수정할 경우 db 입력자가 변환됩니다. 진행 하시겠습니까?'))
				if(confirm('서류 형식을 지정하지 않았을 경우 [공개]서류가 됩니다.'))
					if(confirm('수정 하시겠습니까?'))
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
					<form action="CD_Modify_proc.jsp" method="post" onSubmit="return false" name="cd">
						<input type="hidden" name="customer_seq" value="${c.customer_seq}">
						<input type="hidden" name="member_name" value="${member_name}">
						<table width="820px">
							<tr>
								<td>
									<input type="radio" name="condition" value="open">공개
									<input type="radio" name="condition" value="close">비공개&nbsp;
									<a style="color:red;">*</a> 미선택시 기본값<a style="color:red;">(공개)</a>적용&nbsp;/&nbsp;[ 현제:
									<c:if test="${c.condition=='open'}"><a style="color:red;"></a><a style="color:red;">(공개_전체)</a> 서류</c:if>
									<c:if test="${c.condition=='close'}"><a style="color:red;"></a><a style="color:red;">(비공개)</a> 서류</c:if>
									] / Type of Renewal : 
									<select name="type_renewal">
										<option value="BTA PIN" <%="BTA PIN".equals(renewal)?"selected":""%>>BTA PIN</option>
										<option value="BTA AGENT" <%="BTA AGENT".equals(renewal)?"selected":""%>>BTA AGENT</option>
										<option value="DRUG RENEWAL" <%="DRUG RENEWAL".equals(renewal)?"selected":""%>>DRUG RENEWAL</option>
										<option value="PLD RENEWAL" <%="PLD RENEWAL".equals(renewal)?"selected":""%>>PLD RENEWAL</option>
										<option value="MEDEV CERT" <%="MEDEV CERT".equals(renewal)?"selected":""%>>MEDEV CERT</option>
										<option value="MEDEV RENEWAL" <%="MEDEV RENEWAL".equals(renewal)?"selected":""%>>MEDEV RENEWAL</option>
										<option value="DMF RENEWAL" <%="DMF RENEWAL".equals(renewal)?"selected":""%>>DMF RENEWAL</option>
										<option value="MAF RENEWAL" <%="MAF RENEWAL".equals(renewal)?"selected":""%>>MAF RENEWAL</option>
										<option value="VMF RENEWAL" <%="VMF RENEWAL".equals(renewal)?"selected":""%>>VMF RENEWAL</option>
										<option value="RED RENEWAL" <%="RED RENEWAL".equals(renewal)?"selected":""%>>RED RENEWAL</option>
										<option value="FCE RENEWAL" <%="FCE RENEWAL".equals(renewal)?"selected":""%>>FCE RENEWAL</option>
									</select>
								</td>
								<td align="right">DB 입력자 : ${c.member_name} [${c.add_date}]</td>
							</tr>
						</table>
						<table class="CD">
							<tr align="left">
								<th>&nbsp;거래처등록번호</th>
								<td align="center"><input type="text" name="client_num" style="width:230px;" value="${c.client_num}"></td>
								<th>&nbsp;종사업장번호</th>
								<td align="center"><input type="text" name="company_num" style="width:230px;" value="${c.company_num}"></td>
							</tr>
							<tr align="left">
								<th><a style="color:red;">&nbsp;* </a>상호(법인명)</th>
								<td align="center"><input type="text" name="company" style="width:230px;" value="${c.company}"></td>
								<th><a style="color:red;">&nbsp;* </a>대표자</th>
								<td align="center"><input type="text" name="ceo" style="width:230px;" value="${c.ceo}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;Mailing Address</th>
								<td align="center" colspan="3"><input type="text" name="address" style="width:642px;" value="${c.address}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;Physical Address</th>
								<td align="center" colspan="3"><input type="text" name="address_p" style="width:642px;" value="${c.address_p}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;업태</th>
								<td align="center"><input type="text" style="width:230px;" name="bz_condition" value="${c.bz_condition}"></td>
								<th>&nbsp;종목</th>
								<td align="center"><input type="text" style="width:230px;" name="type" value="${c.type}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;사이트주소</th>
								<td align="center">
									<input type="text" style="width:230px;"  name="site" value="${c.site}">
								</td>
								<th>&nbsp;분류</th>
								<td >&nbsp;현제분류 : 
									<c:if test="${c.sort==0}">기타</c:if>
								 	<c:if test="${c.sort==1}">Drug</c:if>
								 	<c:if test="${c.sort==2}">Cosmetic</c:if>
								 	<c:if test="${c.sort==3}">Food</c:if>
								 	<c:if test="${c.sort==4}">Device</c:if>&nbsp;
									<select name="sort" style="width:145px;" >
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
								<td align="center"><input type="text"  style="width:230px;"name="main_part_name" value="${c.main_part_name}"></td>
								<th>&nbsp;부담당부서명</th>
								<td align="center"><input type="text"  style="width:230px;" name="sub_part_name" value="${c.sub_part_name}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자명</th>
								<td align="center"><input type="text"  style="width:230px;" name="main_name" value="${c.main_name}"></td>
								<th>&nbsp;부담당자명</th>
								<td align="center"><input type="text"  style="width:230px;" name="sub_name" value="${c.sub_name}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자전화번호</th>
								<td align="center"><input type="text"  style="width:65px;" name="main_phone1" value="${c.main_phone1}"> - <input type="text"  style="width:65px;" name="main_phone2" value="${c.main_phone2}"> - <input type="text"  style="width:65px;" name="main_phone3" value="${c.main_phone3}"></td>
								<th>&nbsp;부담당자전화번호</th>
								<td align="center"><input type="text"  style="width:65px;" name="sub_phone1" value="${c.sub_phone1}"> - <input type="text"  style="width:65px;" name="sub_phone2" value="${c.sub_phone2}"> - <input type="text"  style="width:65px;" name="sub_phone3" value="${c.sub_phone3}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자휴대전화번호</th>
								<td align="center"><input type="text" style="width:65px;" name="main_cell_phone1" value="${c.main_cell_phone1}"> - <input type="text" style="width:65px;"name="main_cell_phone2" value="${c.main_cell_phone2}"> - <input type="text" style="width:65px;"name="main_cell_phone3" value="${c.main_cell_phone3}"></td>
								<th>&nbsp;부담당자휴대전화번호</th>
								<td align="center"><input type="text" style="width:65px;" name="sub_cell_phone1" value="${c.sub_cell_phone1}"> - <input type="text" style="width:65px;" name="sub_cell_phone2" value="${c.sub_cell_phone2}"> - <input type="text" style="width:65px;"name="sub_cell_phone3" value="${c.sub_cell_phone3}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자팩스번호</th>
								<td align="center"><input type="text" style="width:65px;" name="main_fax1" value="${c.main_fax1}"> - <input type="text" style="width:65px;" name="main_fax2" value="${c.main_fax2}"> - <input type="text" style="width:65px;" name="main_fax3" value="${c.main_fax3}"></td>
								<th>&nbsp;부담당자팩스번호</th>
								<td align="center"><input type="text" style="width:65px;" name="sub_fax1" value="${c.sub_fax1}"> - <input type="text" style="width:65px;" name="sub_fax2" value="${c.sub_fax2}"> - <input type="text" style="width:65px;" name="sub_fax3" value="${c.sub_fax3}"></td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자메일</th>
								<td align="center"><input type="text" style="width:90px;" name="main_email1" value="${c.main_email1}"> @ <input type="text" style="width:114px;" name="main_email2" value="${c.main_email2}"></td>
								<th>&nbsp;부담당자이메일</th>
								<td align="center">
									<input type="text" style="width:90px;" name="sub_email1" value="${c.sub_email1}"> @ <input type="text" style="width:114px;" name="sub_email2" value="${c.sub_email2}">
									<input type="hidden" value="<%=currentPage%>" name="currentPage">
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="img/list.png" width="50px" onclick="goUrl('CDView.jsp')">
						<input type="image" src="img/modify.png" width="50px" onclick="formCheck()">
					</div>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>