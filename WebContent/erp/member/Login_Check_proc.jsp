<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
로그인 체크를 원하는 페이지는 이 페이지를 인클루드 해주세요.
<jsp:include page='/kgmp/erp/member/Login_Check_proc.jsp'>
로그인이 되어 있지 않다면, 로그인 사용자만 접근 하다는 메세지와 함께
메인페이지로 이동 됩니다.
*/
	if(session.getAttribute("member_id") == null){
		%>
		<script>
			alert('로그인 사용자만 접근 가능한 페이지 입니다.');
			location.href="/kgmp/erp/member/Login.jsp";
		</script>
		<%
	}
%>