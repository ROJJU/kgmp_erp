<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<jsp:useBean id="memberDAO" class="kgmp.common.dao.member_join_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="member" class="kgmp.common.beans.Member"></jsp:useBean>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
<%
String dir="C:/save/";
int max =10*1024*1024; // 업로드 파일의 최대 크기 지정 
// 첫번째 매개변수로 요청 request를 입력
MultipartRequest mr = new MultipartRequest(request, dir, max, "UTF-8", new DefaultFileRenamePolicy());
member.setDepartment(mr.getParameter("department"));
member.setEmp_type(mr.getParameter("emp_type"));
member.setWork_type(mr.getParameter("work_type"));
member.setW_level(mr.getParameter("w_level"));
System.out.println(mr.getParameter("w_level"));
member.setKor_name(mr.getParameter("kor_name"));
member.setCha_name(mr.getParameter("cha_name"));
member.setEng_name(mr.getParameter("eng_name"));
member.setAddress(mr.getParameter("address"));
member.setPhone1(mr.getParameter("phone1"));
member.setPhone2(mr.getParameter("phone2"));
member.setPhone3(mr.getParameter("phone3"));
member.setCell_phone1(mr.getParameter("cell_phone1"));
member.setCell_phone2(mr.getParameter("cell_phone2"));
member.setCell_phone3(mr.getParameter("cell_phone3"));
member.setEmail1(mr.getParameter("email1"));
member.setEmail2(mr.getParameter("email2"));
member.setEmp_pic(mr.getOriginalFileName("emp_pic"));
member.setId(mr.getParameter("id"));
member.setPw(mr.getParameter("pw"));
member.setVacation_year(Integer.parseInt(mr.getParameter("vacation_year")));
member.setVacation_month(Integer.parseInt(mr.getParameter("vacation_month")));
String check = memberDAO.insertMember(member);

if(check.equals("true")){
	%>
			alert('[K-GMP]회원 가입에 성공 하셨습니다.');
			window.close();
	<%
}else{
	%>
			alert('[K-GMP]회원 가입에 실패 하셨습니다.');
			location.href="Join.jsp";
	<%
}
%>
</script>
