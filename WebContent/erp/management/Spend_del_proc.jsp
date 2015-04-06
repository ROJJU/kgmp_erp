<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<%@ page import="java.io.*"%><!--delete file-->
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="spend_dao" class="kgmp.common.dao.Spend_dao"  scope="session"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
//delete file
String file=request.getParameter("file");
String fileName = file; //file name
String fileDir = "c:/save/Spend/"; //file directory
//String realPath = application.getRealPath(fileDir);
File f = new File(fileDir+fileName);// create calss
if( f.exists())f.delete(); // delete

//delete spend info
int spend_seq = Integer.parseInt(request.getParameter("spend_seq"));
String check = spend_dao.delSpend(spend_seq);

if(check.equals("true")){
	%>
			alert('삭제 하였습니다.');
				location.href="SpendingView.jsp";
	<%
}else{
	%>
			alert('삭제 실패 하였습니다.');
			location.href="SpendingView.jsp";
	<%
}
%>
</script>