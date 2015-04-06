<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<jsp:useBean id="customerDAO" class="kgmp.common.dao.Customer_db_dao"  scope="session"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int customer_seq = Integer.parseInt(request.getParameter("customer_seq"));
int state = Integer.parseInt(request.getParameter("state"));
String check = customerDAO.moveCustomer(customer_seq, state);

if(check.equals("true")){
	%>
			alert('이동 완료.');
				location.href="CDView.jsp";
	<%
}else{
	%>
			alert('이동 실패.');
			location.href="CDRead.jsp?customer_seq="+customer_seq+"";
	<%
}
%>
</script>