<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.*"%><!--delete file-->
<jsp:useBean id="notice_dao" class="kgmp.common.dao.Notice_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="notice" class="kgmp.common.beans.Notice"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
request.setCharacterEncoding("utf-8");

String dir="C:/save/Notice";
int max =10*1024*1024; // size setting
// request setting
MultipartRequest mr = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
notice.setContent(mr.getParameter("content"));
if(mr.getOriginalFileName("n_file")==null){//file update check
	notice.setN_file(mr.getParameter("old_file"));
}else{
	//delete file
	   String file=mr.getParameter("old_file");
	   String fileName = file; //file name
	   String fileDir = "c:/save/Notice/"; //file directory
	   //String realPath = application.getRealPath(fileDir);
	   File f = new File(fileDir+fileName);// create calss
	   if( f.exists())f.delete(); // delete
   //update file name
	notice.setN_file(mr.getOriginalFileName("n_file"));
}
notice.setTitle(mr.getParameter("title"));
notice.setWriter(mr.getParameter("writer"));
notice.setNotice_seq(Integer.parseInt(mr.getParameter("notice_seq")));

String check = notice_dao.modiftyNotice(notice);

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
