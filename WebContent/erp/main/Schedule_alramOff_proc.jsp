<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao"  scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
//알람 종료
String writer = (String)session.getAttribute("member_name");
int year=Integer.parseInt(request.getParameter("year"));
int month=Integer.parseInt(request.getParameter("month"));
int day=Integer.parseInt(request.getParameter("day"));
String check=schedule_dao.offAlram(writer, year, month, day);

if(check.equals("true")){
	%>
			alert('알림이 종료 되었습니다.');
			window.close();
	<%
}else{
	%>
			alert('알림 종료 실패하였습니다.');
			window.close();
	<%
}
%>
</script>
<%=writer%>