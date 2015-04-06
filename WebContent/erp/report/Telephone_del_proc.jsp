<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="telDAO" class="kgmp.common.dao.Telephone_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="tel" class="kgmp.common.beans.Telephone"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
int tel_seq = Integer.parseInt(request.getParameter("tel_seq"));
String check = telDAO.delTelephone(tel_seq);

if(check.equals("true")){
	%>
			alert('삭제 성공 하였습니다.');
				location.href="Telephone_view.jsp";
	<%
}else{
	%>
			alert('삭제 실패 하였습니다.');
			location.href="Telephone_view.jsp";
	<%
}
%>
</script>
