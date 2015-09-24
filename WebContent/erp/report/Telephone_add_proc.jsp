<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="telDAO" class="kgmp.common.dao.Telephone_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="tel" class="kgmp.common.beans.Telephone"></jsp:useBean>
<jsp:setProperty property="*" name="tel"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = telDAO.insertTelephone(tel);

if(check.equals("true")){
	%>
			alert('저장 성공 하였습니다.');
				history.go(-1);
				window.close();
	<%
}else{
	%>
			alert('저장 실패 하였습니다.');
			window.close();
	<%
}
%>
</script>
