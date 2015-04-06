<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Customer, java.util.Map, java.util.List" %>
<jsp:useBean id="CustomerDAO" class="kgmp.common.dao.Customer_db_dao" scope="session"/>
<%
//고객정보 출력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
int customer_seq = Integer.parseInt(request.getParameter("customer_seq"));
int currentPage =1;
if(request.getParameter("currentPage") != null)
	currentPage = Integer.parseInt(request.getParameter("currentPage"));
pageContext.setAttribute("c", CustomerDAO.getCustomer(customer_seq));
Customer customer = CustomerDAO.getCustomer(customer_seq);
//고객정보 코맨트 출력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//설정
	String linkURL = "CDRead.jsp";
//현재페이지 번호 설정
	int c_currentPage = 1;
	if(request.getParameter("c_currentPage") != null)
		c_currentPage = Integer.parseInt(request.getParameter("c_currentPage"));
//페이징과 리스트 가져오기
	Map<String, Object> pageAll = CustomerDAO. getComment(c_currentPage, linkURL, customer_seq, currentPage);
	String pageList = (String)pageAll.get("pageList");
	List<Customer> list = (List<Customer>)pageAll.get("list");
//페이지속성 추가
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pageList", pageList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/CD_R.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
		<script type="text/javascript">
		function popupCo(){
			window.open("CommentAdd.jsp?customer_seq="+<%=customer.getCustomer_seq()%>,"CoAdd","width=450px, height=280px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
		}
		function del(){
			if(confirm('영구 삭제 하시겠습니까? 삭제된 서류는 복구할수 없습니다.'))
				location.href="CD_Del_proc.jsp?customer_seq="+<%=customer.getCustomer_seq()%>+"";
		}
		function nodel(){
			alert('이미 휴지통으로 이동된 서류 입니다.');
		}
		function rollback(){
			if(confirm('서류를 복구 하겠습니까 ?'))
				location.href="CD_Del_proc.jsp?customer_seq="+<%=customer.getCustomer_seq()%>+"";
		}
		function popupCoMo(c_comment_seq){
			window.open("CommentModify.jsp?customer_seq="+<%=customer.getCustomer_seq()%>+"&c_comment_seq="+c_comment_seq,"CoAdd","width=450px, height=280px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
		}
		</script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/SideMenu.jsp"/>
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Customer DataBase</b></div>
				</div>
				<div id = "CDTable">
						<table width="820px">
							<tr>
								<td width="640px">
									<c:if test="${c.condition=='open'}"><a style="color:red;">*</a><a style="color:red;">(공개_전체)</a> 서류</c:if>
									<c:if test="${c.condition=='close'}"><a style="color:red;">*</a><a style="color:red;">(비공개)</a> 서류</c:if>
									 |   Type of Renewal : <b>${c.type_renewal}</b>
									 |  Sort : 
									 <b>
									 	<c:if test="${c.sort==0}">기타</c:if>
									 	<c:if test="${c.sort==1}">Drug</c:if>
									 	<c:if test="${c.sort==2}">Cosmetic</c:if>
									 	<c:if test="${c.sort==3}">Food</c:if>
									 	<c:if test="${c.sort==4}">Device</c:if>
									 </b>
								</td>
								<td align="right">DB 입력자 : ${c.member_name} [${c.add_date}]</td>
							</tr>
						</table>
						<table class="CD">
							<tr align="left">
								<th>&nbsp;거래처등록번호</th>
								<td>${c.client_num}</td>
								<th>&nbsp;종사업장번호</th>
								<td>${c.company_num}</td>
							</tr>
							<tr align="left">
								<th><a style="color:red;">&nbsp;* </a>상호(법인명)</th>
								<td>${c.company}</td>
								<th><a style="color:red;">&nbsp;* </a>대표자</th>
								<td>${c.ceo}</td>
							</tr>
							<tr align="left">
								<th>&nbsp;Mailing Address</th>
								<td colspan="3">${c.address}</td>
							</tr>
							<tr align="left">
								<th>&nbsp;Physical Address</th>
								<td colspan="3">${c.address_p}</td>
							</tr>
							<tr align="left">
								<th>&nbsp;업태</th>
								<td>${c.bz_condition}</td>
								<th>&nbsp;종목</th>
								<td>${c.type}</td>
							</tr>
							<tr align="left">
								<th>사이트</th>
								<c:if test="${c.site=='-'}"><td colspan="3"></c:if>
								<c:if test="${c.site!='-'}"><td colspan="3" onclick="window.open('http://${c.site}');" style="cursor:hand; cursor:pointer;" title="해당 사이트 이동"></c:if>
								${c.site}</td>
							</tr>
						</table><br/>
						<table class="CD">
							<tr align="left">
								<th>&nbsp;주담당부서명</th>
								<td>${c.main_part_name}</td>
								<th>&nbsp;부담당부서명</th>
								<td>${c.sub_part_name}</td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자명</th>
								<td>${c.main_name}</td>
								<th>&nbsp;부담당자명</th>
								<td>${c.sub_name}</td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자전화번호</th>
								<td>
									<c:if test="${c.main_phone3==0||c.main_phone2==0}">-</c:if>
									<c:if test="${c.main_phone3!=0}">${c.main_phone1}-${c.main_phone2}-${c.main_phone3}</c:if>
								</td>
								<th>&nbsp;부담당자전화번호</th>
								<td>
									<c:if test="${c.sub_phone3==0||c.sub_phone2==0}">-</c:if>
									<c:if test="${c.sub_phone3!=0}">${c.sub_phone1}-${c.sub_phone2}-${c.sub_phone3}</c:if>
								</td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자휴대전화번호</th>
								<td>
									<c:if test="${c.main_cell_phone3==0||c.main_cell_phone2==0}">-</c:if>
									<c:if test="${c.main_cell_phone3!=0}">${c.main_cell_phone1}-${c.main_cell_phone2}-${c.main_cell_phone3}</c:if>
								</td>
								<th>&nbsp;부담당자휴대전화번호</th>
								<td>
									<c:if test="${c.sub_cell_phone3==0||c.sub_cell_phone2==0}">-</c:if>
									<c:if test="${c.sub_cell_phone3!=0}">${c.sub_cell_phone1}-${c.sub_cell_phone2}-${c.sub_cell_phone3}</c:if>
								</td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자팩스번호</th>
								<td>
									<c:if test="${c.main_fax3==0||c.main_fax2==0}">-</c:if>
									<c:if test="${c.main_fax3!=0}">${c.main_fax1}-${c.main_fax2}-${c.main_fax3}</c:if>
								</td>
								<th>&nbsp;부담당자팩스번호</th>
								<td>
									<c:if test="${c.sub_fax3==0||c.sub_fax2==0}">-</c:if>
									<c:if test="${c.sub_fax3!=0}">${c.sub_fax1}-${c.sub_fax2}-${c.sub_fax3}</c:if>
								</td>
							</tr>
							<tr align="left">
								<th>&nbsp;주담당자메일</th>
								<td>
									<c:if test="${c.main_email2=='-'||c.main_email1=='-'}">-</c:if>
									<c:if test="${c.main_email2!='-'}"><a href="mailto:${c.main_email1}@${c.main_email2}" title="이메일 보내기">${c.main_email1}@${c.main_email2}</a></c:if>
								</td>
								<th>&nbsp;부담당자이메일</th>
								<td>
									<c:if test="${c.sub_email2=='-'||c.sub_email1=='-'}">-</c:if>
									<c:if test="${c.sub_email2!='-'}"><a href="mailto:${c.sub_email1}@${c.sub_email2}" title="이메일 보내기">${c.sub_email1}@${c.sub_email2}</a></c:if>
								</td>
							</tr>
						</table>
				</div>
				<div id="buttonPlace">
					<div id="buttons">
						<input type="image" src="img/list.png" width="50px" onclick="goUrl('CDView.jsp?currentPage=<%=currentPage%>')">
						<input type="image" src="img/modify.png" width="50px" onclick="goUrl('CDModify.jsp?customer_seq=<%=customer.getCustomer_seq()%>&currentPage=<%=currentPage%>')">
						<c:if test="${c.state==0}"><input type="image" src="img/del.png" width="50px" onclick="goUrl('CD_Upstate_proc.jsp?customer_seq=<%=customer.getCustomer_seq()%>&state=<%=customer.getState()%>')"></c:if>
						<c:if test="${c.state==1}"><input type="image" src="img/del.png" width="50px" onclick="nodel()"></c:if>
						<input type="image" src="img/add.png" width="50px" onclick="goUrl('CDAdd.jsp')">
					</div>
					<c:if test="${c.state==1}">
						<div id="del">
							<input type="image" src="img/del_final.png" width="50px" onclick="del()">
							<input type="image" src="img/rollback.png" width="50px" onclick="goUrl('CD_Upstate_proc.jsp?customer_seq=<%=customer.getCustomer_seq()%>&state=<%=customer.getState()%>')">
						</div>
					</c:if>
				</div>
				<div id="history">
					<center>
						<table width="820px">
								<tr>
									<td><b>▶ History</b> <a style="color:red; font-size:9px;">(주의 : History에 저장된 정보는 본인이 입력한 정보만 수정, 삭제 가능합니다.)</a></td>
									<td align="right">${pageList}</td>
								</tr>
						</table>
						<table width="820px">
							<tr>
								<td width="130px"><b>User/Date</b></td>
								<td><b>Comment</b></td>
								<td width="80px" ><a href="javascript:popupCo();" style="color:#2A0066;">Add a note</a></td>
							</tr>
						<c:forEach var="a" items="${list}">
							<tr >
								<td >
										<b>${a.member_name}</b><br>${a.add_date}<input type="hidden" name="test">
								</td>
								<c:if test="${a.color=='blue'}"><td colspan="2" style="color:blue"></c:if>
								<c:if test="${a.color=='red'}"><td colspan="2" style="color:red"></c:if>
								<c:if test="${a.color=='black'}"><td colspan="2"></c:if>
								${a.c_comment}
								<c:if test="${a.member_name==member_name}"> |  <b><a href="javaScript:popupCoMo(${a.c_comment_seq});"> [Edit]</a><a href="javaScript:location.href='Comment_del_proc.jsp?c_comment_seq=${a.c_comment_seq}&customer_seq=<%=customer_seq%>'"> [Del]</a></b></c:if>
								</td>
							</tr>
						</c:forEach>
						</table>
					</center>
				</div>
				<div style="height:80px;"></div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>