<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="notice_dao" class="kgmp.common.dao.Notice_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="notice" class="kgmp.common.beans.Notice"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
request.setCharacterEncoding("utf-8");

String dir="C:/save/Notice";
int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
// 첫번째 매개변수로 요청 request를 입력
MultipartRequest mr = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
notice.setContent(mr.getParameter("content"));
notice.setN_file(mr.getOriginalFileName("n_file"));
notice.setTitle(mr.getParameter("title"));
notice.setWriter(mr.getParameter("writer"));

String check = notice_dao.insertTelephone(notice);

if(check.equals("true")){
	%>
			alert('등록에 성공하셨습니다.');
			location.href="NoticeView.jsp";
	<%
}else{
	%>
			alert('등록에 실패하셨습니다.');
			location.href="NoticeView.jsp";
	<%
}
%>
</script>
