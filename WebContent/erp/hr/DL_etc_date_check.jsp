<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@page import="kgmp.common.beans.DL" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session" />
<%
String nowYear = request.getParameter("insert_year");
String nowMonth = request.getParameter("insert_month");
String nowDay = request.getParameter("insert_day");
String id = request.getParameter("id");
%>
<center>
<form action="DL_etc_date_check.jsp" method="post">
	DATE: <input type="text" name="insert_year" value="<%=nowYear%>" id="txt_year" style="width:45px;" maxlength="4">년
	 <input type="text" name="insert_month" value="<%=nowMonth%>" id="txt_month" style="width:35px;" maxlength="2">월
	 <input type="text" name="insert_day" value="<%=nowDay%>" id="txt_day" style="width:35px;" maxlength="2">일
	<input type="hidden"  value="<%=id%>" name="id">
	<input type="submit" value="중복확인"><br>
</form>
<script src="../report/js/jquery-1.9.1.js"></script>
<script>
$(function(){
	<%
	if(dl_DAO.isState(id, nowYear, nowMonth, nowDay)){
		%>
		$("#txt_result").html("날자가 중복 됩니다 <br>날자를 확인해주세요.");
		<%
	}else{
		%>
		$("#txt_result").html("사용 가능한 날자 입니다. <button id='btn_exit'>날자 사용</button>");
		<%
	}
	%>
	
	$("#btn_exit").bind("click",function(){
		window.opener.document.dl.insert_year.value = $("#txt_year").val();
		window.opener.document.dl.insert_month.value = $("#txt_month").val();
		window.opener.document.dl.insert_day.value = $("#txt_day").val();
		window.opener.document.dl.check_box.value = $("#txt_year").val();
		window.close();
	});
});
</script>
<label id="txt_result"></label>
</center>