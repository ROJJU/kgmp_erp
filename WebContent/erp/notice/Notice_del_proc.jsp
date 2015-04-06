<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%><!--delete file-->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice_dao" class="kgmp.common.dao.Notice_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="notice" class="kgmp.common.beans.Notice"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
//delete file
   String file=request.getParameter("file");
   String fileName = file; //file name
   String fileDir = "c:/save/Notice/"; //file directory
   //String realPath = application.getRealPath(fileDir);
   File f = new File(fileDir+fileName);// create calss
   if( f.exists())f.delete(); // delete



//delete notice info
int notice_seq = Integer.parseInt(request.getParameter("notice_seq"));
String check = notice_dao.delNotice(notice_seq);

if(check.equals("true")){
	%>
			alert('삭제 성공 하였습니다.');
				location.href="NoticeView.jsp";
	<%
}else{
	%>
			alert('삭제 실패 하였습니다.');
			location.href="NoticeView.jsp";
	<%
}
%>
</script>
