<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="customerDAO" class="kgmp.common.dao.Customer_db_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="customer" class="kgmp.common.beans.Customer"></jsp:useBean>
<jsp:setProperty property="*" name="customer"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = customerDAO.modifyComment(customer);

if(check.equals("true")){
	%>
			alert('히스토리를 수정 하였습니다.');
			opener.location.href="CDRead.jsp?customer_seq="+<%=customer.getCustomer_seq()%>+"";
			window.close();
	<%
}else{
	%>
			alert('수정 실패 하였습니다.');
			location.href="CommentAdd.jsp";
	<%
}
%>
</script>
