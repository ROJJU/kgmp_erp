<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="customerDAO" class="kgmp.common.dao.Customer_db_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="customer" class="kgmp.common.beans.Customer"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = customerDAO.modifyCustomer(customer);
int currentPage = Integer.parseInt(request.getParameter("currentPage"));
if(check.equals("true")){
	%>
			alert('고객 정보 수정 성공 하였습니다.');
				location.href="CDRead.jsp?customer_seq="+<%=customer.getCustomer_seq()%>+"&currentPage="+<%=currentPage%>+"";
	<%
}else{
	%>
			alert('고객 정보 수정 실패 하였습니다.');
			location.href="CDAdd.jsp";
	<%
}
%>
</script>