<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<%@ page import="java.util.*, java.text.*" %>
<script>
<%
/*이름 받아오기*/
String writer = (String)session.getAttribute("member_id");
int msg_seq=Integer.parseInt(request.getParameter("msg_seq"));
//메시지 알람 종료
msg_dao.offMsg(writer, msg_seq);
//메시지 읽음 표시
Calendar cal=Calendar.getInstance();
SimpleDateFormat Time = new SimpleDateFormat("HH:mm");
String chk_time = Time.format(cal.getTime());
msg_dao.ReadCheckMsg(chk_time, msg_seq);
%>
window.close();
</script>
<center>
알림 종료중..
<img src="/kgmp/erp/main/images/loader.gif">
</center>
