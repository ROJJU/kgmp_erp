<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="spend_dao" class="kgmp.common.dao.Spend_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="spend" class="kgmp.common.beans.Spend"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
request.setCharacterEncoding("utf-8");

String dir="C:/save/Spend";
int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
// 첫번째 매개변수로 요청 request를 입력
MultipartRequest mr = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
spend.setTitle(mr.getParameter("title"));
spend.setSummary(mr.getParameter("summary"));
spend.setMoney(mr.getParameter("money"));
spend.setMoney_kor(mr.getParameter("money_kor"));
spend.setHow(mr.getParameter("how"));
spend.setEtc(mr.getParameter("etc"));
spend.setSpend_img(mr.getFilesystemName("spend_img"));
spend.setSpend_date(mr.getParameter("spend_date"));
spend.setWriter(mr.getParameter("writer"));
spend.setYear(Integer.parseInt(mr.getParameter("year")));
spend.setMonth(Integer.parseInt(mr.getParameter("month")));

String check = spend_dao.insertSpend(spend);

if(check.equals("true")){
	%>
			alert('등록에 성공하셨습니다.');
			location.href="SpendingView.jsp";
	<%
}else{
	%>
			alert('등록에 실패하셨습니다.');
			location.href="SpendingAdd.jsp";
	<%
}
%>
</script>