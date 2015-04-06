<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="customerDAO" class="kgmp.common.dao.Customer_db_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="customer" class="kgmp.common.beans.Customer"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = customerDAO.insertCustomer(customer);

if(check.equals("true")){
	%>
			alert('고객 정보 저장 성공 하였습니다.');
			if(confirm('계속 저장하시겠습니까?')){
				location.href="CDAdd.jsp";
			}else{
				location.href="CDView.jsp";
			}
	<%
}else{
	%>
			alert('고객 정보 저장 실패 하였습니다.');
			location.href="CDAdd.jsp";
	<%
}
%>
</script>
