<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<jsp:useBean id="customerDAO" class="kgmp.common.dao.Customer_db_dao"  scope="session"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int c_comment_seq = Integer.parseInt(request.getParameter("c_comment_seq"));
int customer_seq=Integer.parseInt(request.getParameter("customer_seq"));
String check = customerDAO.delComment(c_comment_seq);

if(check.equals("true")){
	%>
			alert('�����丮�� ���� �Ͽ����ϴ�.');
				location.href="CDRead.jsp?customer_seq="+<%=customer_seq%>+"";
	<%
}else{
	%>
			alert('�����丮 ���� ���� �Ͽ����ϴ�.');
			location.href="CDRead.jsp?customer_seq="+<%=customer_seq%>+"";
	<%
}
%>
</script>