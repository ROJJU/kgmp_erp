<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<jsp:useBean id="login_db" class="kgmp.common.dao.member_join_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="member" class="kgmp.common.beans.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
	<%
	if(login_db.isCustomer(member)){
		member = login_db.getCustomer(member);
		session.setAttribute("member_id", member.getId());
		session.setAttribute("member_name", member.getKor_name());
		session.setAttribute("member_department", member.getDepartment());
		session.setAttribute("member_pic", member.getEmp_pic());
		session.setAttribute("member_level", member.getW_level());
		session.setMaxInactiveInterval(60000);
	%>
	<script>alert('�α��ο� �����߽��ϴ�.');location.href="../main/MainPage.jsp"; </script>
	
	<%}else{%>
	<script>alert('�α��ο� �����Ͽ����ϴ�. ���̵� �� ��й�ȣ�� �ٽ� Ȯ���� �ּ���.');location.href="Login.jsp";</script>
	<%}%>

