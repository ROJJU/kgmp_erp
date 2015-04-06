<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao"  scope="session"></jsp:useBean>
<jsp:useBean id="dl" class="kgmp.common.beans.DL"></jsp:useBean>
<jsp:setProperty property="*" name="dl"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script>
<%
String check = dl_DAO.checkDL(dl);

if(check.equals("true")){
	if(dl.getState().equals("0")){
		%>
		alert('출근 등록 완료 되었습니다. 오늘도 수고 해주세요');
		window.close();
		<%
	}if(dl.getState().equals("1")){
		%>
		alert('퇴근 등록 완료 되었습니다. 오늘도 수고 하셨습니다.');
		window.close();
		<%
	}if(dl.getState().equals("2")){
		%>
		alert('출장 등록 완료 되었습니다. 서류를 결제 후 근무시간이 합계됩니다.');
		window.close();
		<%
	}if(dl.getState().equals("4")){
		%>
		alert('외근 등록 완료 되었습니다. 서류를 결제 후 근무시간이 합계됩니다.');
		window.close();
		<%
	}if(dl.getState().equals("6")){
		%>
		alert('출근(기타) 등록 완료 되었습니다. 서류를 결제 후 근무시간이 합계됩니다.');
		window.close();
		<%
	}
}else{
	%>
	alert('금일 이미 모든 [출근/퇴근] 등록을 완료 하셨습니다. [인사 > 근태 관리 > 출 퇴근 조회]에서 확인 바랍니다. 오류가 있을시 건의사항에 등록 바랍니다.');
	window.close();
	<%
}
%>
</script>
<center>
	<a style="font-family:맑은 고딕; font-size:25px;">기능 처리중...</a><br><br>
	<input type="image" src="/kgmp/erp/schedule/img/prograss.gif"/>
</center>