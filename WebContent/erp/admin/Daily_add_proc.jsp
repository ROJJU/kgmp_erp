<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*, java.text.*" %>
<jsp:useBean id="report_DAO" class="kgmp.common.dao.Report_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="d_report" class="kgmp.common.beans.Report"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
request.setCharacterEncoding("utf-8");
Calendar cal=Calendar.getInstance();
SimpleDateFormat year = new SimpleDateFormat("yyyy");
SimpleDateFormat month = new SimpleDateFormat("MM");
SimpleDateFormat day = new SimpleDateFormat("dd");
String nowYear= year.format(cal.getTime());
String nowMonth= month.format(cal.getTime());
String nowDay= day.format(cal.getTime());

String dir="C:/save/Daily_Report";
int max =60*1024*1024; // 업로드 파일의 최대 크기 지정 
// 첫번째 매개변수로 요청 request를 입력
MultipartRequest mr = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy()); 
d_report.setTitle(mr.getParameter("title"));
d_report.setWriter(mr.getParameter("writer"));
d_report.setD_file(mr.getOriginalFileName("file"));
d_report.setType(mr.getParameter("type"));
d_report.setSend0(mr.getParameter("send0"));
d_report.setSend1(mr.getParameter("send1"));
d_report.setSend2(mr.getParameter("send2"));
d_report.setSend3(mr.getParameter("send3"));
d_report.setSend4(mr.getParameter("send4"));
d_report.setContent(mr.getParameter("content"));
d_report.setInsert_year(nowYear);
d_report.setInsert_month(nowMonth);
d_report.setInsert_day(nowDay);
d_report.setId(mr.getParameter("id"));

String check = report_DAO.insert_d_report(d_report);

if(check.equals("true")){
	%>
			alert('일간업무 등록에 성공하셨습니다.');
			location.href="DailyView.jsp";
	<%
}else{
	%>
			alert('일간업무 등록에 실패하셨습니다.');
			location.href="DailyView.jsp";
	<%
}
%>
</script>
