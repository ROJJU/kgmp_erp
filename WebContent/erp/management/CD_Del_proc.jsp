<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<jsp:useBean id="customerDAO" class="kgmp.common.dao.Customer_db_dao"  scope="session"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int customer_seq = Integer.parseInt(request.getParameter("customer_seq"));
String check = customerDAO.delCustomer(customer_seq);

if(check.equals("true")){
	%>
			alert('고객 정보를 삭제 하였습니다.');
				location.href="CDView.jsp";
	<%
}else{
	%>
			alert('고객 정보 삭제 실패 하였습니다.');
			location.href="CDRead.jsp?customer_seq="+customer_seq+"";
	<%
}
%>
</script>