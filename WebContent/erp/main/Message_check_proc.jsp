<%@page contentType="text/xml; charset=utf-8" %>
<jsp:useBean id="msg_DAO" class="kgmp.common.dao.Message_dao" scope="session"/>
<%
/*이름 받아오기*/
String writer = (String)session.getAttribute("member_id");
//상태 확인
int state = msg_DAO.checkState(writer);
%>
<%=state%>