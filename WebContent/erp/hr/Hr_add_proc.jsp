<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.*"%><!--delete file-->
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="member" class="kgmp.common.beans.Member"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
request.setCharacterEncoding("utf-8");

String dir="C:/save/Member_Sign";
int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
// 첫번째 매개변수로 요청 request를 입력
MultipartRequest mr = new MultipartRequest(request, dir, max, "utf-8", new DefaultFileRenamePolicy());
if(mr.getOriginalFileName("member_sign")==null){
	member.setMember_sign(mr.getParameter("old_file"));
}else{
	//delete file
	   String file=mr.getParameter("old_file");
	   String fileName = file; //file name
	   String fileDir = "c:/save/Member_Sign/"; //file directory
	   //String realPath = application.getRealPath(fileDir);
	   File f = new File(fileDir+fileName);// create calss
	   if( f.exists())f.delete(); // delete
	//update file name
	   member.setMember_sign(mr.getOriginalFileName("member_sign"));
}
member.setId(mr.getParameter("id"));

String check = member_dao.insertSign(member);

if(check.equals("true")){
	%>
			alert('등록에 성공하셨습니다.');
			location.href="HrAdd.jsp";
	<%
}else{
	%>
			alert('등록에 실패하셨습니다.');
			location.href="HrAdd.jsp";
	<%
}
%>
</script>
